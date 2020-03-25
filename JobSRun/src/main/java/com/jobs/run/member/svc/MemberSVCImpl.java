package com.jobs.run.member.svc;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.jobs.run.member.dao.MemberDAO;
import com.jobs.run.member.vo.MemberVO;

@Service // Business Layer에서 Service를 명시하기 위해서 사용
public class MemberSVCImpl implements MemberSVC {

	private static final Logger logger = LoggerFactory.getLogger(MemberSVCImpl.class);

	@Inject
	MemberDAO memberDAO;

	// 회원 등록
	@Override
	public int joinMember(MemberVO memberVO) {

		// 3) 회원사진 첨부파일 있는경우
		if (memberVO.getFile() != null && memberVO.getFile().getSize() > 0) {
			try {
				logger.info("파일 첨부: " + memberVO.getFile().getOriginalFilename());
				// 첨부파일명
				memberVO.setFname(memberVO.getFile().getOriginalFilename());
				// 첨부파일 크기
				memberVO.setFsize(memberVO.getFile().getSize());
				// 첨부파일
				memberVO.setPic(memberVO.getFile().getBytes());
				// 첨부파일 저장

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int cnt = memberDAO.joinMember(memberVO);
		logger.info("memberVO" + memberVO);
		return cnt;

	}

//아이디 중복체크
	@Override
	public int idCheck(String userId) {

		int result = memberDAO.idCheck(userId);
		return result;
	}

//로그인
	@Override
	public MemberVO loginMember(String id, String pw) {
		logger.info("MemberSVCImpl.loginMember(String id, String pw) 호출됨!");
		return memberDAO.loginMember(id, pw);
	}

//회원 전체조회
	@Override
	public List<MemberVO> selectAllMember() {
		logger.info("MemberSVCImpl.selectAllMember() 호출됨!");
		return memberDAO.selectAllMember();
	}

//회원 개별조회
	@Override
	public MemberVO selectMember(String id) {
		logger.info("MemberSVCImpl.selectMember(String id) 호출됨!");
		return memberDAO.selectMember(id);
	}

}
