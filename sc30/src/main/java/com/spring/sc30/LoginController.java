package com.spring.sc30;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
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
		model.addAttribute("logintest", "login");
		//
		//		memberService.register(vo);
		return "login";
	}

	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	public String loginProcess(HttpServletRequest httpServletRequest, Model model, HttpSession session)
		throws NoSuchAlgorithmException {

		MemberVO vo = new MemberVO();

		String id = httpServletRequest.getParameter("memberID");
		String password = httpServletRequest.getParameter("password");

		if (!id.isEmpty() && !password.isEmpty()) {
			vo.setMemberID(httpServletRequest.getParameter("memberID"));
			String hashedPW = hashWith256(password);

			vo.setPassword(hashedPW);
		}

		//		MessageDigest md = MessageDigest.getInstance("SHA-256");
		//		byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));

		MemberVO member = memberService.getMember(vo.getMemberID());

		if (member == null) {
			model.addAttribute("logintest", "no ID");
		} else if (!vo.getPassword().equals(member.getPassword())) {
			model.addAttribute("logintest", "pw different");
		} else {
			model.addAttribute("logintest", "loginprocess" + member.toString());
			session.setAttribute("memberID", member.getMemberID());

			return "redirect:/board";
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

		if (!memberID.isEmpty() && !password.isEmpty() && !nickname.isEmpty()) {
			MemberVO vo = new MemberVO();
			vo.setMemberID(memberID);
			//		vo.setPassword(password);

			try {
				String hashedPW = hashWith256(password);
				vo.setPassword(hashedPW);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setNickname(nickname);

			memberService.register(vo);
		}

		return "redirect:/login";
	}

	String hashWith256(String textToHash) throws NoSuchAlgorithmException {
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] byteOfTextToHash = textToHash.getBytes(StandardCharsets.UTF_8);
		byte[] hashedByteArray = digest.digest(byteOfTextToHash);
		//	    String encoded = Base64.encode(hashedByetArray);
		String encoded = Base64.getEncoder().encodeToString(hashedByteArray);
		return encoded;
	}

	@RequestMapping(value = "/checkID", method = RequestMethod.GET)
	public ResponseEntity<Void> checkID(Model model,
		@RequestParam(value = "memberID", required = true) String memberID) {
		System.out.println("checkId");
		MemberVO checkvo = memberService.getMember(memberID);
		if (checkvo != null) {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
			//model.addAttribute("checkID", true);
		} else {
			return new ResponseEntity<Void>(HttpStatus.OK);
			//model.addAttribute("checkID", false);HttpStatus.OK
		}
	}
}
