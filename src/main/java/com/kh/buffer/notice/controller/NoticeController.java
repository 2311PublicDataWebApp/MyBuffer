package com.kh.buffer.notice.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.buffer.notice.domain.NoticeVO;
import com.kh.buffer.notice.domain.PageInfo;
import com.kh.buffer.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	// 공지사항 상세
		@RequestMapping(value="/notice/detail.do", method=RequestMethod.GET)
		public ModelAndView showNoticeDetail(ModelAndView mv, int noticeNo) {
			try {
				NoticeVO notice = nService.selectNoticeByNo(noticeNo);
				if(notice != null) {
					mv.addObject("notice", notice).setViewName("notice/detail");
				}else {
					mv.addObject("msg", "데이터 존재안함").setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
			}
			return mv;
		}
	
	// 공지사항 목록
	@RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
	public ModelAndView showNoticeList(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1")Integer currentPage) {
		try {
			int totalCount = nService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<NoticeVO> nList = nService.selectNoticeList(pInfo);
			mv.addObject("nList", nList);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("notice/list");
			
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 페이징 처리
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10; // 한 페이지당 보여줄 게시물의 개수
		int naviCountPerPage = 5; 	 // 한 페이지당 보여줄 범위의 개수
		int naviTotalCount;          // 범위의 총 개수
		int startNavi;
		int endNavi;
		
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return pi;
	}
	
	// 공지사항 등록페이지
		@RequestMapping(value="/notice/insert.do", method=RequestMethod.GET)
		public ModelAndView showInsertForm(ModelAndView mv) {
			mv.setViewName("notice/insert");
			return mv;
		}
		// 공지사항 등록
		@RequestMapping(value="/notice/insert.do", method=RequestMethod.POST)
		public ModelAndView insertNotice(ModelAndView mv
				, @ModelAttribute NoticeVO notice
				, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
				, HttpServletRequest request) {
			try {
				// 첨부파일 저장
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> infoMap = this.saveFile(uploadFile, request);
					String fileName = (String)infoMap.get("fileName");
					String fileRename = (String)infoMap.get("fileRename");
					String filePath = (String)infoMap.get("filePath");
					long fileSize = (long)infoMap.get("fileSize");
					
					notice.setNoticeFileName(fileName);
					notice.setNoticeFileRename(fileRename);
					notice.setNoticeFilepath(filePath);
					notice.setNoticeFileSize(fileSize);
				}
				// 공지사항 정보 저장
				int result = nService.insertNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/notice/list.do");
				}else {
					mv.addObject("msg", "공지사항 등록 안됐다");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			
			return mv;
		}
		
		// 공지사항 수정페이지
		@RequestMapping(value="/notice/modify.do", method=RequestMethod.GET)
		public ModelAndView showModifyForm(ModelAndView mv, int noticeNo) {
			try {
				NoticeVO notice = nService.selectNoticeByNo(noticeNo);
				if(notice != null) {
					mv.addObject("notice", notice);
					mv.setViewName("notice/modify");
				}else {
					mv.addObject("msg", "데이터 존재안함");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		// 공지사항 수정
		@RequestMapping(value="/notice/modify.do", method=RequestMethod.POST)
		public ModelAndView updateNotice(
				ModelAndView mv
				, @ModelAttribute NoticeVO notice
				,@RequestParam(value="reloadFile", required=false) MultipartFile reloadFile
				, HttpServletRequest request) {
			try {
				// 수정 기능 -> 1. 대체, 2. 삭제 후 등록
				if(reloadFile != null && !reloadFile.isEmpty()) {
					String fileName = notice.getNoticeFileRename();
					if(fileName != null) {
						//있으면 기존 파일 삭제
						this.deleteFile(request, fileName);
					}
					//없으면 새로 업로드하려는 파일 저장
					Map<String, Object> infoMap = this.saveFile(reloadFile, request);
					String noticeFilename = (String)infoMap.get("fileName");
					notice.setNoticeFileName(noticeFilename);
					notice.setNoticeFileRename((String)infoMap.get("fileRename"));
					notice.setNoticeFilepath((String)infoMap.get("filePath"));
					notice.setNoticeFileSize((long)infoMap.get("fileSize"));
				}
				int result = nService.updateNotice(notice);
				if(result > 0) {
					mv.setViewName("redirect:/notice/detail.do?noticeNo="+notice.getNoticeNo());
//					return "redirect:/notice/detail.kh?noticeNo="+notice.getNoticeNo();
				}else {
					mv.addObject("msg", "데이터 존재안함");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}

		// 공지사항 삭제
		private void deleteFile(HttpServletRequest request, String fileName) {
			// TODO Auto-generated method stub
			String rPath = request.getSession().getServletContext().getRealPath("resources");
			String delFilepath = rPath + "\\nuploadFiles\\" + fileName;
			File delFile = new File(delFilepath);
			if(delFile.exists()) {
				delFile.delete();
			}
			
		}
		// 첨부파일 삭제
		@RequestMapping(value="/notice/delete.do", method=RequestMethod.GET)
		public ModelAndView deleteNotice(ModelAndView mv, int noticeNo) {
			try {
				int result = nService.deleteNotice(noticeNo);
				if(result>0) {
					mv.setViewName("redirect:/notice/list.do");
				}else {
					mv.addObject("msg", "데이터조회안됨");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}

		// 첨부파일 저장 메소드
		private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
			String fileName = uploadFile.getOriginalFilename();
			// 저장 경로
			String projectPath = request.getSession().getServletContext().getRealPath("resources");
			String saveDirectory = projectPath + "\\nuploadFiles";
			File sDir = new File(saveDirectory);
			if(!sDir.exists()) {
				sDir.mkdir(); // uploadFile 폴더가 없으면 자동으로 만들어줌
			}
			// 파일 리네임의 필요성!!
			// A : 1.png, B: 1.png --> 내용은 다르지만 이름이 같은 파일을 구별하기 위해서 꼭 파일 리네임을 해주어야함
			// 리네임을 할 때에는 올린 시각을 기준으로 파일 이름을 만들어서 따로 저장
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); // 나중에 SS랑 비교
			String strResult = sdf.format(new Date(System.currentTimeMillis()));
			String ext = fileName.substring(fileName.lastIndexOf(".")+1); // 원본파일의 확장자 글자부터 시작되도록 +1 해줌
			String fileRname = strResult + "." + ext;
			
			
			String savePath = saveDirectory + "\\" + fileRname;
			File file = new File(savePath);
			
			// 파일 저장
			uploadFile.transferTo(file);
			// DB에 저장할 파일정보 셋팅
			// 1. 파일이름, 2.파일 리네임, 3. 파일경로, 4.파일크기
			long fileLength = uploadFile.getSize();
			Map<String, Object> infoMap = new HashMap<String, Object>();
			infoMap.put("fileName", fileName);
			infoMap.put("fileRename", fileRname);
			infoMap.put("filePath", savePath);
			infoMap.put("fileSize", fileLength);
			return infoMap;
		}
}
