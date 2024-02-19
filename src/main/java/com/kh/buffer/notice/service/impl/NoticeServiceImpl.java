package com.kh.buffer.notice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.buffer.notice.domain.NoticeVO;
import com.kh.buffer.notice.domain.PageInfo;
import com.kh.buffer.notice.service.NoticeService;
import com.kh.buffer.notice.store.NoticeStore;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;

	@Override
	public List<NoticeVO> selectNoticeList(PageInfo pInfo) {
		List<NoticeVO> nList = nStore.selectNoticeList(session, pInfo);
		return nList;
	}

	@Override
	public int getTotalCount() {
		int totalCount = nStore.selectTotalCount(session);
		return totalCount;
	}

	@Override
	public int insertNotice(NoticeVO notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) {
		NoticeVO notice = nStore.selectNoticeByNo(session, noticeNo);
		return notice;
	}

	@Override
	public int updateNotice(NoticeVO notice) {
		int result = nStore.upadateNotice(session, notice);
		return result;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(session, noticeNo);
		return result;
	}

}
