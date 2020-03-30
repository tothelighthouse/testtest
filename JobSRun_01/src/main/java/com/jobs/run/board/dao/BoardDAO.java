package com.jobs.run.board.dao;

import java.util.List;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardFileVO;
import com.jobs.run.board.vo.BoardVO;

public interface BoardDAO {
	List<BoardCategoryVO> getCategory();
	
	//게시글작성
	int write(BoardVO boardVO);
	int fileWrite(BoardFileVO boardFileVO);
	
	//게시글 보기
	BoardVO view(String bnum);
	
	//게시글 전체 불러오기
	List<BoardVO> list();
	
	//게시글에 대한 지원과 지원철회
	int application(BoardVO boardVO);
	
}
