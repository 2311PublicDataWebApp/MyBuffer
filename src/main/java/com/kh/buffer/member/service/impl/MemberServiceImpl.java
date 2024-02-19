package com.kh.buffer.member.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.service.MemberService;
import com.kh.buffer.member.store.MemberStore;



@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public MemberVO checkMemberLogin(MemberVO member) {
		MemberVO mOne = mStore.checkMemberLogin(session, member);
		// TODO Auto-generated method stub
		return mOne;
	}

	@Override
	public MemberVO getOneById(String memberId) {
		MemberVO member = mStore.selectOneById(session, memberId);
		return member;
	}

	@Override
	public int updateMember(MemberVO member) {
		int result = mStore.updateMember(session, member);
		return result;
	}

	@Override
	public int insertMember(MemberVO member) {
		int result = mStore.insertMember(session, member);
		return result;
	}

	@Override
	public int deleteMember(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
