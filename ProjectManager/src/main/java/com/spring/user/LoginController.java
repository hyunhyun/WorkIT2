package com.spring.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.user.impl.MemberDAO;

@Controller
public class LoginController {

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVO vo, MemberDAO userDAO, HttpSession session) {

		MemberVO user = userDAO.getMember(vo);

		if (user != null) {
			session.setAttribute("memberID", user.getMemberID());
		}
		return "login.jsp";
	}

	@RequestMapping("/logout.do")
	public String logout(MemberVO vo, MemberDAO userDAO) {
		return "login.jsp";
	}
}
