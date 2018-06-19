package com.spring.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemberVO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/auth")
public class LoginController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("logintest", "login");
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(Model model, HttpSession session,
		@RequestParam("memberID") String memberID,
		@RequestParam("password") String password) {

		String msg = "";
		//		if (!memberID.isEmpty() && !password.isEmpty()) {
		if (!memberID.isEmpty() && !password.isEmpty()) {
			MemberVO vo = new MemberVO();
			vo.setMemberID(memberID);
			vo.setPassword(password);
			msg = memberService.login(vo);
		}

		if (msg.equals("success")) {
			session.setAttribute("memberID", memberID);
			model.addAttribute("logintest", "login Succeed");
			return "redirect:/board";
		} else {
			model.addAttribute("logintest", msg);
			return "login";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logintest", "logout");

		return "redirect:/auth/login";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Model model, @RequestParam("memberID") String memberID,
		@RequestParam("password") String password,
		@RequestParam("nickname") String nickname) {

		if (!memberID.isEmpty() && !password.isEmpty() && !nickname.isEmpty()) {
			MemberVO vo = new MemberVO();
			vo.setMemberID(memberID);
			vo.setPassword(password);
			vo.setNickname(nickname);

			try {
				memberService.register(vo);
			} catch (Exception e) {

			}
		}

		return "redirect:/login";
	}

	@RequestMapping(value = "/checkID", method = RequestMethod.GET)
	public ResponseEntity<Void> checkID(Model model,
		@RequestParam(value = "memberID", required = true) String memberID) {
		System.out.println("checkID");
		MemberVO checkvo = memberService.getMember(memberID);
		if (checkvo != null) {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.OK);
		}
	}
}