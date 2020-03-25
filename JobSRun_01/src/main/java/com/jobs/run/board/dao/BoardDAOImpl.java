package com.jobs.run.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	@Inject
	SqlSession sqlSession;
	
	//카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return sqlSession.selectList("mappers.BoardDAO-mapper.getCategory");
	}
	
	//게시글 보기
	@Override
	public BoardVO view(String bnum) {
		return sqlSession.selectOne("mappers.BoardDAO-mapper.view",Long.valueOf(bnum));
	}

	
	//게시글 전체 읽어오기
	@Override
	public List<BoardVO> list() {
		logger.info("BoardDAOImpl 실행!!!");
		List<BoardVO> list = sqlSession.selectList("mappers.BoardDAO-mapper.list");
		System.out.println("DAOlist.toString()==> " + list.toString());
		return list;

	}

	@Override
	public int write(BoardVO boardVO) {
//		String startdate = boardVO.getStartdate();
//		logger.info("startdate : "+startdate);
//		String starttime = boardVO.getStarttime();
//		logger.info("starttime : "+starttime);
//		String datetime = startdate + " " + starttime + ":00";
//		logger.info("datetime : "+datetime);
//		Timestamp dt = java.sql.Timestamp.valueOf(datetime);
//		logger.info(String.valueOf(dt));
//		boardVO.setStime(dt);
		
		return sqlSession.insert("mappers.BoardDAO-mapper.write",boardVO);
	}
	

}