package com.spring.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.InputException;
import com.spring.model.MemberVO;
import com.spring.service.MemberService;

@Controller
@RequestMapping("/auth")
public class LoginController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		model.addAttribute("logintest", null);
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(Model model, HttpSession session,
		@RequestParam("memberID") String memberID,
		@RequestParam("password") String password) throws InputException {

		if(memberID.length() >20) {
			throw new InputException("memberID too Long");
		}
		
		String msg = "";
		if (!memberID.isEmpty() && !password.isEmpty()) {
			MemberVO vo = new MemberVO();
			vo.setMemberID(memberID);
			vo.setPassword(password);
			msg = memberService.login(vo);
		}

		if (msg.equals("success")) {
			session.setAttribute("memberID", memberID);
			model.addAttribute("logintest", null);
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
		@RequestParam("nickname") String nickname) throws InputException {
		
//		if (!memberID.isEmpty() && !password.isEmpty() && !nickname.isEmpty()) {
			MemberVO vo = new MemberVO();
			vo.setMemberID(memberID);
			vo.setPassword(password);
			vo.setNickname(nickname);

			memberService.register(vo);
//		}

		return "redirect:/auth/login";
//		return "login";
	}

	@RequestMapping(value = "/checkID", method = RequestMethod.GET)
	public ResponseEntity<Void> checkID(Model model,
		@RequestParam(value = "memberID", required = true) String memberID) throws InputException {
		logger.info("auth/checkID : GET");
		logger.info("checkID Request memberID : "+memberID);
		
		MemberVO checkvo = memberService.getMember(memberID);
		if (checkvo != null) {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		} else {
			return new ResponseEntity<Void>(HttpStatus.OK);
		}
	}
}
