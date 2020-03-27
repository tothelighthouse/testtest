package com.jobs.run.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jobs.run.common.Code;
import com.jobs.run.member.svc.MemberSVC;
import com.jobs.run.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberSVC memberSVC;

	@ModelAttribute
	public void initData(Model model) {
		// 성별
		List<Code> gender = new ArrayList<>();
		gender.add(new Code("남", "남자"));
		gender.add(new Code("여", "여자"));

		model.addAttribute("gender", gender);
	}

	// 회원 가입 약관 동의 양식 불러오기
	@GetMapping("/joinFormclause")
	public String joinFormclause(Model model) {
		return "member/joinFormclause";
	}

	// 약관동의후에 회원가입 양식 폼 불러오기
	@GetMapping("/joinForm")
	public String joinForm(Model model) {
		model.addAttribute("mvo", new MemberVO());
		return "member/joinForm";
	}

	// 회원 등록
	@RequestMapping("/join")
	public String memberJoin(@Valid @ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			Model model,
			HttpServletResponse response) throws IOException {
		logger.info(memberVO.toString());

		// 유효성 오류체크 중 오류가 발견되면 회원 가입 페이지로 이동
		if (result.hasErrors()) {
			return "member/joinForm";
		}

		// 3)회원 가입처리
		int cnt = memberSVC.joinMember(memberVO);
		if (cnt == 1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
//			out.println("<script>alert('계정이 등록 되었습니다'); location.href='/run/loginForm';</script>");
			out.println("<script>alert('계정이 등록 되었습니다')</script>");
			return "redirect:/loginForm";
		} else {
			return "redirect:/";
		}
	}

	// 아이디 중복체크 처리
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		int result = memberSVC.idCheck(id);
		return Integer.toString(result);
	}

	// 아이디 찾기 화면 양식
	@GetMapping("/findIDForm")
	public String findIDForm(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		return "member/findIDForm";
	}

	// 비밀번호 찾기 화면 양식
	@GetMapping("/findPWForm")
	public String findPWForm(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		return "member/findPWForm";
	}

	@GetMapping("/modifyForm")
	public String modifyForm(Model model) {
		MemberVO memberVO = new MemberVO();
		model.addAttribute("memberVO", memberVO);
		return "member/modifyForm";
	}

	@GetMapping("/myPage")
	public String myPage() {
		return "member/modifyForm";
	}

}
