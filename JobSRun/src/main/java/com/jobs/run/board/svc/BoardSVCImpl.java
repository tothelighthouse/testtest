package com.jobs.run.board.svc;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jobs.run.board.dao.BoardDAO;
import com.jobs.run.board.vo.BoardCategoryVO;
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

	@Override
	public int write(BoardVO boardVO) {
		return boardDAO.write(boardVO);
	}
	@Override
	public List<BoardVO> list() {
		logger.info("boardSVC.list() :" + boardDAO.list().toString());
		List<BoardVO> list = boardDAO.list();
		System.out.println("list.toString()==> " + list.toString());
		return list;
	}

	
}