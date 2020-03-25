package com.jobs.run.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.jobs.run.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	@Inject
	private SqlSession sqlSession;

	// 회원등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("MemberDAOImplXML.joinMember(MemberVO memberVO) 호출됨!");
		return sqlSession.insert("mappers.MemberDAO-mapper.joinMember", memberVO);
	}

	// 아이디 중복체크
	public int idCheck(String id) {
		System.out.println("===> Mybatis로 idCheck");
		int result = sqlSession.selectOne("mappers.MemberDAO-mapper.idCheck", id);
		return result;
	}

	// 로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberDAOImplXML.loginMember(String id, String pw) 호출됨!");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		memberVO.setPw(pw);
		return sqlSession.selectOne("mappers.MemberDAO-mapper.loginMember", memberVO);
	}

	// 회원 전체조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberDAOImplXML.selectAllMember(MemberVO memberVO) 호출됨!");
		return sqlSession.selectList("mappers.MemberDAO-mapper.selectAllMember");
		// selectList에서 첫번째꺼 사용(string statement
	}

	// 회원 개별조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberDAOImplXML.selectMember(String id) 호출됨!");
		return sqlSession.selectOne("mappers.MemberDAO-mapper.selectMember", id);
		// selectOne에서 파라미터값받는 메소드사용
	}
}
