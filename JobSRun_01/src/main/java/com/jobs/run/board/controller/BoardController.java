package com.jobs.run.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jobs.run.board.svc.BoardSVC;
import com.jobs.run.board.vo.BoardCategoryVO;
import com.jobs.run.board.vo.BoardVO;
import com.jobs.run.common.Code;
import com.jobs.run.common.IntCode;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	BoardSVC boardSVC;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@ModelAttribute
	public void initJobData(Model model) {
		List<Code> job = new ArrayList<>();
		job.add(new Code("청소","청소"));
		job.add(new Code("이삿짐","이삿짐"));
		job.add(new Code("경비","경비"));
		job.add(new Code("카운터","카운터"));
		job.add(new Code("카운터","카운터"));
		model.addAttribute("job", job);
	}
//	@ModelAttribute
//	public void initDurationData(Model model) {
//		List<Code> duration = new ArrayList<>();
//		duration.add(new Code("30","30분"));
//		duration.add(new Code("60","1시간"));
//		duration.add(new Code("90","1시간 30분"));
//		duration.add(new Code("120","2시간"));
//		model.addAttribute("duration", duration);
//	}
//	
//	@ModelAttribute
//	public void initPaymentData(Model model) {
//		List<Code> payment = new ArrayList<>();
//		payment.add(new Code("5000","5천원"));
//		payment.add(new Code("10000","1만원"));
//		payment.add(new Code("15000","1만 5천원"));
//		payment.add(new Code("20000","2만원"));
//		model.addAttribute("payment", payment);
//	}
	
	@ModelAttribute
	public void init2PaymentData(Model model) {
		List<IntCode> payment = new ArrayList<>();
		payment.add(new IntCode(5000,"5천원"));
		payment.add(new IntCode(10000,"1만원"));
		payment.add(new IntCode(15000,"1만 5천원"));
		payment.add(new IntCode(20000,"2만원"));
		model.addAttribute("payment", payment);
	}

	@ModelAttribute
	public void init2DurationData(Model model) {
		List<IntCode> duration = new ArrayList<>();
		duration.add(new IntCode(30,"30분"));
		duration.add(new IntCode(60,"1시간"));
		duration.add(new IntCode(90,"1시간 30분"));
		duration.add(new IntCode(120,"2시간"));
		model.addAttribute("duration", duration);
	}
	
	@ModelAttribute
	public void getCategory(Model model) {
		List<BoardCategoryVO> boardCategoryVO = boardSVC.getCategory();
		logger.info(boardCategoryVO.toString());
		model.addAttribute("boardCategoryVO", boardCategoryVO);
	}
	
	@GetMapping("/writeForm")
	public String writeForm(Model model) {
		model.addAttribute("boardVO",new BoardVO());
		return "board/writeForm";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute BoardVO boardVO) {
		boardVO.setSdatetime(java.sql.Timestamp.valueOf(boardVO.combineDatetime()));
		logger.info(boardVO.toString());
		boardSVC.write(boardVO);
		logger.info("글쓰기 controller");
		return "redirect:/board/list";
	}
	
	@GetMapping("/view/{bnum}")
	public String view(
			@PathVariable("bnum") String bnum,
			Model model
			) {
		model.addAttribute(boardSVC.view(bnum));
		return "board/viewForm";
	}
	
	//목록보기
	@GetMapping("/list")
	public String list(Model model) {
		logger.info("listAll 실행");
		List<BoardVO> list = boardSVC.list();
		logger.info(list.toString());
		for(BoardVO item : list) {
			String[] sdateTime = item.splitDatetime();
			String sdate = sdateTime[0];
			String stime = sdateTime[1];
			item.setSdate(sdate);
			item.setStime(stime);
		}
		model.addAttribute("list", list);
		return "board/list";
	}
}
