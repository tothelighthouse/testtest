package com.jobs.run.board.dao;

import java.util.List;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardVO;

public interface BoardDAO {
	List<BoardCategoryVO> getCategory();
	
	//의뢰글 작성
	int write(BoardVO boardVO);
	
	//게시글 보기
	BoardVO view(String bnum);
	
	//게시글 전체 불러오기
	List<BoardVO> list();
	
	
}
