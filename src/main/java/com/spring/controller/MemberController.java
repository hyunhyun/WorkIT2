package com.spring.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.MemberVO;
import com.spring.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/member", method = RequestMethod.GET)
	@ResponseBody
	public List<MemberVO> allMembers(Locale locale, Model model,
		@RequestParam("search") String search) {
		//		return memberService.getMemberList();
		System.out.println("search : " + search);

		List<MemberVO> list = memberService.getListAutoComplete(search);
		System.out.println(list.size());
		return memberService.getListAutoComplete(search);
	}

	//	@RequestMapping(value = "/member/{teamID}", method = RequestMethod.GET)
	//	@
	//	public String teamMembers(Locale locale, Model model) {
	//		//		model.addAttribute("logintest", "login");
	//		//		return "login";
	//	}

}
