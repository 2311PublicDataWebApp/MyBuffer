package com.kh.buffer.member.store.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.domain.PageInfo;
import com.kh.buffer.member.store.MemberStore;

@Repository
public class MemberStoreImpl implements MemberStore {

	@Override
	public int insertMember(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	@Override
	public MemberVO checkMemberLogin(SqlSession session, MemberVO member) {
		MemberVO mOne = session.selectOne("MemberMapper.checkMemberLogin", member);
		return mOne;
	}

	@Override
	public MemberVO selectOneById(SqlSession session, String memberId) {
		MemberVO member = session.selectOne("MemberMapper.selectOneById", memberId);
		return member;
	}

	@Override
	public int updateMember(SqlSession session, MemberVO member) {
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}

	@Override
	public int deleteMember(SqlSession session, String memberId) {
		int result = session.delete("MemberMapper.deleteMember", memberId);
		return result;
	}

	@Override
	public String findIdByEmail(SqlSession session, String memberEmail) {
		return session.selectOne("MemberMapper.findIdByEmail", memberEmail);
	}

	@Override
	public MemberVO findMemberByIdAndEmail(SqlSession session, MemberVO member) {
		return session.selectOne("MemberMapper.findMemberByIdAndEmail", member);
	}

	@Override
	public int updatePassword(SqlSession session, MemberVO member) {
		int result = session.update("MemberMapper.updatePassword", member);
		return result;
	}
	
	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("MemberMapper.selectTotalCount");
		return totalCount;
	}

	@Override
	public List<MemberVO> selectMemberList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowbound = new RowBounds(offset, limit);
		List<MemberVO> mList = session.selectList("MemberMapper.selectMemberList", null, rowbound);
		return mList;
	}

}
