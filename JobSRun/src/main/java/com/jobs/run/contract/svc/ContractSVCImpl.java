package com.jobs.run.contract.svc;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jobs.run.contract.dao.ContractDAO;
import com.jobs.run.contract.vo.ContractVO;

@Service
public class ContractSVCImpl implements ContractSVC {
	private static final Logger logger = LoggerFactory.getLogger(ContractSVCImpl.class);
	
	@Inject
	ContractDAO contractDAO;
	//계약 생성
	@Override
	public int create(ContractVO contractVO) {
		logger.info("createSVC 실행");
		return contractDAO.create(contractVO);
	}

}
;