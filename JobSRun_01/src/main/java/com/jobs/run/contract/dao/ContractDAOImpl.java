package com.jobs.run.contract.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.jobs.run.contract.vo.ContractVO;

@Repository
public class ContractDAOImpl implements ContractDAO {
	private static final Logger logger = LoggerFactory.getLogger(ContractDAOImpl.class);

	@Inject
	SqlSession sqlSession;
	@Override
	public int create(ContractVO contractVO) {
		logger.info("contractVO DAO 전달 값 :" + contractVO);
		return sqlSession.insert("mappers.ContractDAO-mapper.create",contractVO);
	}

}
