package com.kh.buffer.notice.service;

import java.util.List;
import java.util.Map;

import com.kh.buffer.notice.domain.NoticeVO;
import com.kh.buffer.notice.domain.PageInfo;

public interface NoticeService {

	
	/**
	 * 공지사항 목록 Service
	 * @param pInfo
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(PageInfo pInfo);

	/**
	 * 전체 게시물 갯수
	 * @return int
	 */
	int getTotalCount();

	/**
	 * 공지사항 등록
	 * @param notice
	 * @return result
	 */
	int insertNotice(NoticeVO notice);

	/**
	 * 번호로 공지사항 찾기
	 * @param noticeNo
	 * @return
	 */
	NoticeVO selectNoticeByNo(int noticeNo);

	/**
	 * 공지사항 수정
	 * @param notice
	 * @return int
	 */
	int updateNotice(NoticeVO notice);

	/**
	 * 공지사항 삭제
	 * @param noticeNo
	 * @return result
	 */
	int deleteNotice(int noticeNo);

	/**
	 * 공지사항 검색 Service
	 * @param pInfo
	 * @param paramMap
	 * @return List
	 */
	List<NoticeVO> searchNoticeByKeword(PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 검색 게시물 전체 갯수 Service
	 * @param paramMap
	 * @return int
	 */
	int getTotalCount(Map<String, String> paramMap);
	

}
