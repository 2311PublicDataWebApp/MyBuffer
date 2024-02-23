package com.kh.buffer.member.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.domain.PageInfo;
import com.kh.buffer.member.service.MemberService;
import com.kh.buffer.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession session;

	@Override
	public int registerMember(MemberVO member) {
		int result = mStore.registerMember(session, member);
		return result;
	}

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
	public int deleteMember(String memberId) {
		int result = mStore.deleteMember(session, memberId);
		return result;
	}

	@Override
	public String findIdByEmail(String memberEmail) {
		// TODO Auto-generated method stub
		return mStore.findIdByEmail(session, memberEmail);
	}

	@Override
	public MemberVO getMemberByIdAndEmail(MemberVO member) {
		return mStore.findMemberByIdAndEmail(session, member);
	}

	@Override
	public int changePassword(MemberVO member) {
		int result = mStore.updatePassword(session, member);
		return result;
	}
	
	@Override
	public int getTotalCount() {
		int totalCount = mStore.getTotalCount(session);
		return totalCount;
	}

	@Override
	public List<MemberVO> selectMemberList(PageInfo pInfo) {
		List<MemberVO> mList = mStore.selectMemberList(session, pInfo);
		return mList;
	}

}
