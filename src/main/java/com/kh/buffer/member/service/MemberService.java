package com.kh.buffer.member.service;

import java.util.List;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.domain.PageInfo;

public interface MemberService {
	
	/**
	 * 회원 정보 등록 Service
	 * @param member
	 * @return result
	 */
	int insertMember(MemberVO member);

	/**
	 * 회원 로그인 Service
	 * @param member
	 * @return mOne
	 */
	MemberVO checkMemberLogin(MemberVO member);

	/**
	 * 회원 아이디 검색 Service
	 * @param memberId
	 * @return mOne
	 */
	MemberVO getOneById(String memberId);

	/**
	 * 회원 정보 수정 Service
	 * @param member
	 * @return result
	 */
	int updateMember(MemberVO member);

	/**
	 * 회원 정보 삭제 Service
	 * @param memberId
	 * @return result
	 */ 
	int deleteMember(String memberId);
	
	
	/**
	 * 회원 아이디 찾기
	 * @param email
	 * @return
	 * @throws Exception
	 */

	String findIdByEmail(String memberEmail);
	
	/**
	 * 비밀번호 찾기
	 * @param memberId
	 * @param memberEmail
	 * @return
	 */
	MemberVO getMemberByIdAndEmail(MemberVO member);
	
	
	/**
	 * 비밀번호 변경하기
	 * @param memberId
	 * @param memberPw
	 */
	int changePassword(MemberVO member);
	
	/**
	 * 회원 전체 개수 Service
	 * @return int
	 */
	int getTotalCount();

	/**
	 * 회원 리스트 Service
	 * @param pInfo
	 * @return
	 */
	List<MemberVO> selectMemberList(PageInfo pInfo);
	
	
	

}


