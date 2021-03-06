package com.jobs.run.member.dao;

import java.util.List;

import com.jobs.run.member.vo.MemberVO;

public interface MemberDAO {
	// 회원 등록
	int joinMember(MemberVO memberVO);

	// 아이디 중복검사
	int idCheck(String id);

	// 로그인
	MemberVO loginMember(String id, String pw);

	// 회원 전체조회
	List<MemberVO> selectAllMember();

	// 회원 개별조회
	MemberVO selectMember(String id);

}
