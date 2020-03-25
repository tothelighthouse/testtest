package com.jobs.run.contract.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobs.run.contract.svc.ContractSVC;
import com.jobs.run.contract.vo.ContractVO;

@Controller
@RequestMapping("/contract")
public class ContractController {

	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);
	@Inject
	ContractSVC contractSVC;
	
//	@PostMapping("/create")
//	public String create(@ModelAttribute ContractVO contractVO) {
//		logger.info("create실행");
//		logger.info(contractVO.toString());
//		//게시글 수정
//		
//		//계약 생성
//		contractSVC.create(contractVO);
//		
//		return "redirect:/member/myPage";
//	}
	@ResponseBody
	@PostMapping("/create")
	public ResponseEntity<String> create(@RequestBody ContractVO contractVO) {
		logger.info("create실행");
		logger.info(contractVO.toString());
		ResponseEntity<String> res = null;
		
		
		//게시글 수정
		
		//계약 생성
		int cnt = contractSVC.create(contractVO);
		if(cnt == 1) {
			res = new ResponseEntity<String>("success",HttpStatus.OK);
		}else {
			res = new ResponseEntity<String>("success",HttpStatus.OK);
		};
		return res;
	}
}
