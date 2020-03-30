package com.jobs.run.board.svc;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jobs.run.board.dao.BoardDAO;
import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardFileVO;
import com.jobs.run.board.vo.BoardVO;

@Service
public class BoardSVCImpl implements BoardSVC {
	private static final Logger logger = LoggerFactory.getLogger(BoardSVCImpl.class);
	
	@Inject
	BoardDAO boardDAO;

	@Override
	public List<BoardCategoryVO> getCategory() {
		return boardDAO.getCategory();
	}
	
	//게시글 보기
	@Override
	public BoardVO view(String bnum) {
		return boardDAO.view(bnum);
	}
	//게시글 작성
	@Transactional
	@Override
	public int write(BoardVO boardVO) {
		//1) 게시글 작성
		int cnt = boardDAO.write(boardVO);
		
		//2) 첨부파일 있는 경우
		logger.info("첨부개수 :" + boardVO.getBfiles());
		logger.info("if 문 이전 첨부파일 내역 : " + boardVO.getBfiles().toString() );
		if(boardVO.getBfiles()!=null && boardVO.getBfiles().size() > 0) {// 크기가 0인 파일이 전달 되지 않도록 체크
			for(MultipartFile file : boardVO.getBfiles()) {
				logger.info("첨부파일 내역 :" + file.toString());
			}
			fileWrite(boardVO.getBfiles(), boardVO.getBnum());//bnum 가져오기 => mybatis : selectkey 사용
		}
		return cnt;
	}
	
	//첨부파일 저장
	private void fileWrite(List<MultipartFile> files, long bnum) {
		for(MultipartFile file : files) {
			try {
				logger.info("파일 첨부:" + file.getOriginalFilename());
				BoardFileVO boardFileVO = new BoardFileVO();
				//게시글 번호
				boardFileVO.setBnum(bnum);
				//첨부파일 명
				boardFileVO.setFname(file.getOriginalFilename());
				//첨부파일 크기
				boardFileVO.setFsize(file.getSize());
				//첨부파일 타입
				boardFileVO.setFtype(file.getContentType());
				//첨부파일
				boardFileVO.setFdata(file.getBytes());
				logger.info("boardFileVO 상세 내역: " + boardFileVO.toString());
				//첨부파일 저장
				if(file.getSize() > 0) {
					boardDAO.fileWrite(boardFileVO);
				}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	//목록보기
	@Override
	public List<BoardVO> list() {
//		logger.info("boardSVC.list() :" + boardDAO.list().toString());
		List<BoardVO> list = boardDAO.list();
//		System.out.println("list.toString()==> " + list.toString());
		return list;
	}
	//게시글에 대한 지원과 지원철회
	@Override
	public int application(BoardVO boardVO) {
		return boardDAO.application(boardVO);
	}

	
}

















