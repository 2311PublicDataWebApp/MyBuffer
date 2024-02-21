package com.kh.buffer.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService mService;

//------------------------로그인---------------------------------------------------------------------------------
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String showLoginPage() {
		return "member/login";
	}

	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String loginPage(String memberId, String memberPw, Model model, HttpSession session) {
		try {
			MemberVO member = new MemberVO(memberId, memberPw);
			MemberVO mOne = mService.checkMemberLogin(member);
			if (mOne != null) {
				// 로그인 성공!, Session에 저장
				session.setAttribute("memberId", mOne.getMemberId());
				session.setAttribute("memberName", mOne.getMemberName());
			} else {
				// 로그인 실패, No Data Found!
				model.addAttribute("msg", "No Data Found!!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			// 그 외의 오류 발생(쿼리문 오타, NullPointerExceptino 등..)
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "redirect:/index.jsp";
	}

//--------------------로그 아웃--------------------------------------------------------------------------------

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String memberLogout(HttpSession session, Model model) {
		try {
			if (session != null) {
				session.invalidate();
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "로그아웃을 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

//----------------------------아이디 찾기----------------------------------------------------- 
	@RequestMapping(value = "/member/findid.do", method = RequestMethod.GET)
	public String showFindIdPage() {
		return "member/findId";
	}

	@RequestMapping(value = "/member/findid.do", method = RequestMethod.POST)
	public String findId(@RequestParam("memberEmail") String memberEmail, Model model) {
		try {
			String foundId = mService.findIdByEmail(memberEmail);
			if (foundId != null) {
				// 아이디를 찾았을 경우 해당 아이디를 보여줌
				model.addAttribute("foundId", foundId);
				return "member/foundId"; // 아이디를 보여주는 페이지로 이동
			} else {
				// 이메일로 등록된 아이디가 없을 경우
				model.addAttribute("msg", "입력하신 이메일로 등록된 아이디가 없습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

//-------------------------비밀번호 찾기----------------------------------------------------------
	@RequestMapping(value = "/member/findpassword.do", method = RequestMethod.GET)
	public String showFindPasswordPage() {
		return "member/findPassword";
	}

//------------------------------회원 가입-------------------------------------------------------    
	@RequestMapping(value = "/member/register.do", method = RequestMethod.GET)
	public String showRegisterPage() {
		return "member/register";
	}

	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String registerPage(@ModelAttribute MemberVO member, Model model) {
		try {

			int result = mService.insertMember(member);
			if (result > 0) {
				// 로그인 페이지
				return "redirect:/index.jsp";
			} else {

				model.addAttribute("msg", "Service Failed!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			// 예외발생시 에러페이지
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

//-----------------------------------회원 정보 수정------------------------------------------------    

	// 회원 정보 수정 페이지 이동
	@RequestMapping(value = "/member/updatemember.do", method = RequestMethod.GET)
	public String showUpdatePage(HttpSession session, Model model) {
		try {
			String memberId = (String) session.getAttribute("memberId");
			MemberVO member = null;
			if (memberId != null) {
				member = mService.getOneById(memberId);
			}
			if (member != null) {
				model.addAttribute("member", member);
				return "member/update";
			} else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				return "common/errorPage";
			}

		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 회원 정보 수정
	@RequestMapping(value = "/member/updatemember.do", method = RequestMethod.POST)
	public String updatePage(@ModelAttribute MemberVO member, Model model) {
		try {

			int result = mService.updateMember(member);
			if (result > 0) {
				// success -> 페이지 이동
				return "redirect:/member/update";
			} else {
				// fail -> 에러페이지 이동
				model.addAttribute("msg", "회원 정보 수정을 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

//--------------------------------회원 탈퇴-----------------------------------    
	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
	public String deleteMember(String memberId, HttpSession session, Model model) {
		try {
			String sessionId = (String) session.getAttribute("memberId");
			int result = 0;
			// 세션에 있는 아이디와 지우려고 하는 아이디가 같은 확인
			if (sessionId != null && sessionId.equals(memberId)) {
				result = mService.deleteMember(memberId);
			} else {
				model.addAttribute("msg", "로그인을 해야 합니다.");
				return "common/errorPage";
			}
			// 회원탈퇴가 성공했는지 확인
			if (result > 0) {
				return "redirect:/member/logout.kh";
			} else {
				model.addAttribute("msg", "회원 탈퇴가 완료되지 않았습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

}