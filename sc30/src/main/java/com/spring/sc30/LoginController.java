package com.spring.sc30;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemberVO;
import com.spring.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		//		MemberVO vo = new MemberVO();
		//		vo.setMemberID("logintest");
		//		vo.setPassword("testpw");
		//		vo.setNickname("nk");
		//
		model.addAttribute("logintest", "logn");
		//
		//		memberService.register(vo);
		return "login";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest httpServletRequest, Model model, HttpSession session) {

		MemberVO vo = new MemberVO();
		vo.setMemberID(httpServletRequest.getParameter("memberID"));
		vo.setPassword(httpServletRequest.getParameter("password"));

		MemberVO member = memberService.getMember(vo.getMemberID());

		if (member == null) {
			model.addAttribute("logintest", "no ID");
		} else if (!vo.getPassword().equals(member.getPassword())) {
			model.addAttribute("logintest", "pw different");
		} else {
			model.addAttribute("logintest", "loginprocess" + member.toString());
			session.setAttribute("memberID", member.getMemberID());

			return "redirect:/main";
		}
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		//		model.addAttribute("logintest", "logout");
		model.addAttribute("logintest", "logout");

		return "redirect:/login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, @RequestParam(value = "memberID", required = true) String memberID,
		@RequestParam("password") String password,
		@RequestParam("nickname") String nickname) {

		MemberVO vo = new MemberVO();
		vo.setMemberID(memberID);
		vo.setPassword(password);
		vo.setNickname(nickname);

		memberService.register(vo);

		return "redirect:/login";
	}
}
