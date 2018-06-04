package com.spring.sc30;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.MemberService;

@Controller
public class MainController {
	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "main";
	}
}
