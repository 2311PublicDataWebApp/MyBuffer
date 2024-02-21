package com.kh.buffer.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.buffer.notice.domain.NoticeVO;
import com.kh.buffer.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 공지사항 목록
	 * @param session
	 * @param pInfo
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(SqlSession session, PageInfo pInfo);

	/**
	 * 공지사항 전체 게시물 갯수
	 * @param session
	 * @return int
	 */
	int selectTotalCount(SqlSession session);

	/**
	 * 공지사항 등록
	 * @param session
	 * @param notice
	 * @return result
	 */
	int insertNotice(SqlSession session, NoticeVO notice);

	/**
	 * 공지사항 상세
	 * @param session
	 * @param noticeNo
	 * @return notice
	 */
	NoticeVO selectNoticeByNo(SqlSession session, int noticeNo);

	/**
	 * 공지사항 수정
	 * @param session
	 * @param notice
	 * @return int
	 */
	int upadateNotice(SqlSession session, NoticeVO notice);

	/**
	 * 공지사항 삭제
	 * @param session
	 * @param noticeNo
	 * @return result
	 */
	int deleteNotice(SqlSession session, int noticeNo);

	/**
	 * 공지사항 검색 Store
	 * @param session
	 * @param pInfo
	 * @param paramMap
	 * @return List
	 */
	List<NoticeVO> selectNoticesByKeword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 검색 갯수 Store
	 * @param session
	 * @param paramMap
	 * @return
	 */
	int selectTotalCount(SqlSession session, Map<String, String> paramMap);

}
