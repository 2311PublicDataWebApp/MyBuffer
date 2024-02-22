package com.kh.buffer.notice.store.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.buffer.notice.domain.NoticeVO;
import com.kh.buffer.notice.domain.PageInfo;
import com.kh.buffer.notice.store.NoticeStore;
@Repository
public class NoticeStoreImpl implements NoticeStore {

	@Override
	public List<NoticeVO> selectNoticeList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> nList = session.selectList("NoticeMapper.selectNotice", null, rowBounds);
		return nList;
	}

	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("NoticeMapper.selectTotalCount");
		return totalCount;
	}

	@Override
	public int insertNotice(SqlSession session, NoticeVO notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		result += session.insert("NoticeMapper.insertNoticeImg", notice);
		return result;
	}

	@Override
	public NoticeVO selectNoticeByNo(SqlSession session, int noticeNo) {
		NoticeVO notice = session.selectOne("NoticeMapper.selectNoticeByNo", noticeNo);
		return notice;
	}

	@Override
	public int upadateNotice(SqlSession session, NoticeVO notice) {
		// TODO Auto-generated method stub
				int result = session.update("NoticeMapper.updateNotice", notice);
				result += session.update("NoticeMapper.updateNoticeImg", notice);
				return result;
	}

	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}

	@Override
	public List<NoticeVO> selectNoticesByKeword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> searchList = session.selectList("NoticeMapper.searchNoticeByKeword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public int selectTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("NoticeMapper.searchTotalCount", paramMap);
		return totalCount;
	}

}
