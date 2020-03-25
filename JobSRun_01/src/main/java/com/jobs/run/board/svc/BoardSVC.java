package com.jobs.run.board.svc;

import java.util.List;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardVO;

public interface BoardSVC {
	//카테고리 읽어오기
	List<BoardCategoryVO> getCategory();
	
	//의뢰인, 해결사 글쓰기
	int write(BoardVO boardVO);
	
	//게시글 보기
	BoardVO view(String bnum);
	
	//전체 글 읽어오기
	List<BoardVO> list();
}
