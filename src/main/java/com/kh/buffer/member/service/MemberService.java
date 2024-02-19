package com.kh.buffer.member.service;

import com.kh.buffer.member.domain.MemberVO;

public interface MemberService {

	MemberVO checkMemberLogin(MemberVO member);

	MemberVO getOneById(String memberId);

	int updateMember(MemberVO member);

	int insertMember(MemberVO member);

	int deleteMember(String memberId);

	

}
