package com.kh.buffer.member.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.buffer.member.domain.MemberVO;

public interface MemberStore {
	/**
	 * 회원 로그인 store
	 * @param session
	 * @param member
	 * @return mOne
	 */
	MemberVO checkMemberLogin(SqlSession session, MemberVO member);
	
	/**
	 * 회원 아이디 검색 store
	 * @param session
	 * @param memberId
	 * @return result
	 */
	MemberVO selectOneById(SqlSession session, String memberId);
	/**
	 * 회원 정보 수정 store
	 * @param session
	 * @param member
	 * @return result
	 */
	int updateMember(SqlSession session, MemberVO member);
	/**
	 * 회원 가입 store
	 * @param session
	 * @param member
	 * @return result
	 */
	int insertMember(SqlSession session, MemberVO member);

}
