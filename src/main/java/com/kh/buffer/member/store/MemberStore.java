package com.kh.buffer.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.domain.PageInfo;

public interface MemberStore {
	
	/**
	 * 회원 가입 Store
	 * @param session
	 * @param member
	 * @return result
	 */
	int registerMember(SqlSession session, MemberVO member);
	
	/**
	 * 회원 로그인 Store
	 * @param session
	 * @param member
	 * @return mOne
	 */
	MemberVO checkMemberLogin(SqlSession session, MemberVO member);
	
	/**
	 * 회원 아이디 검색 Store
	 * @param session
	 * @param memberId
	 * @return result
	 */
	MemberVO selectOneById(SqlSession session, String memberId);
	/**
	 * 회원 정보 수정 Store
	 * @param session
	 * @param member
	 * @return result
	 */
	int updateMember(SqlSession session, MemberVO member);
	
	/**
	 * 회원 정보 삭제 Store
	 * @param session
	 * @param memberId
	 * @return result
	 */
	int deleteMember(SqlSession session, String memberId);

	/**
	 * 회원 아이디 찾기 store
	 * @param email
	 * @return
	 * @throws result
	 */
	String findIdByEmail(SqlSession session, String memberEmail);

	/**
	 * 비밀번호 찾기
	 * @param memberId
	 * @param memberEmail
	 * @return
	 */
	MemberVO findMemberByIdAndEmail(SqlSession session, MemberVO member);
	
	/**
	 * 비밀번호 변경하기 Store
	 * @param memberId
	 * @param memberPw
	 */
	int updatePassword(SqlSession session, MemberVO member);
	
	/**
	 * 회원 전체 개수 Store
	 * @param session
	 * @return int
	 */
	int getTotalCount(SqlSession session);

	/**
	 * 회원 리스트 Store
	 * @param session
	 * @param pInfo
	 * @return List<MemberVO>
	 */
	List<MemberVO> selectMemberList(SqlSession session, PageInfo pInfo);

}
