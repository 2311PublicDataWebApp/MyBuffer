package com.kh.buffer.member.service;

import com.kh.buffer.member.domain.MemberVO;

public interface MemberService {
	
	/**
	 * 회원 정보 등록 Service
	 * @param member
	 * @return result
	 */
	int insertMember(MemberVO member);

	/**
	 * 회원 로그인 Service
	 * @param member
	 * @return mOne
	 */
	MemberVO checkMemberLogin(MemberVO member);

	/**
	 * 회원 아이디 검색 Service
	 * @param memberId
	 * @return mOne
	 */
	MemberVO getOneById(String memberId);

	/**
	 * 회원 정보 수정 Service
	 * @param member
	 * @return result
	 */
	int updateMember(MemberVO member);

	/**
	 * 회원 정보 삭제 Service
	 * @param memberId
	 * @return result
	 */ 
	int deleteMember(String memberId);
	
	
	/**
	 * 회원 아이디 찾기
	 * @param email
	 * @return
	 * @throws Exception
	 */

	String findIdByEmail(String memberEmail);

}


