package com.kh.buffer.member.store.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.store.MemberStore;
@Repository
public class MemberStoreImpl implements MemberStore {

	@Override
	public MemberVO checkMemberLogin(SqlSession session, MemberVO member) {
		MemberVO mOne 
		= session.selectOne("MemberMapper.checkMemberLogin", member);
		return mOne;
	}

	@Override
	public MemberVO selectOneById(SqlSession session, String memberId) {
		MemberVO member 
		= session.selectOne("MemberMapper.selectOneById", memberId);
		return member;
	}

	@Override
	public int updateMember(SqlSession session, MemberVO member) {
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}

	@Override
	public int insertMember(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

}
