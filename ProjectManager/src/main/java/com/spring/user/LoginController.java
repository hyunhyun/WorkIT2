package com.spring.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.user.impl.MemberDAO;

//@RestController 사용해서 @GetMapping이랑 이런걸로 하면 return 값 json으로\
//RestController("/users")
@Controller
public class LoginController {

	@Autowired
	MemberDAO dao;

	//GetMapping("/{id}")
	//	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@RequestMapping(value = "/login")
	//	public String login(MemberVO vo, MemberDAO userDAO, HttpSession session) {
	public String login(MemberVO vo, HttpSession session) {

		//		MemberVO user = userDAO.getMember(vo);
		MemberVO user = dao.getMember(vo);

		if (user != null) {
			session.setAttribute("memberID", user.getMemberID());
		}

		System.out.println("login");
		return "login";
	}

	@RequestMapping("/logout.do")
	public String logout(MemberVO vo, MemberDAO userDAO) {
		return "login.jsp";
	}
}
