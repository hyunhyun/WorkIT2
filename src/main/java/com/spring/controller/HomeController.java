package com.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.model.InputException;
import com.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws InputException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		//		MemberVO vo = new MemberVO();
		//		vo.setMemberID("test");
		//		vo.setPassword("ejpw");
		//		vo.setNickname("ejg");
		//		// DB�뿉 �꽔怨� DB�뀒�씠釉붿뿉�꽌 吏곸젒 �솗�씤�빐遊먯빞 �븳�떎.
		//		memberService.register(vo);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/bootstrap")
	public String bootstrap() {
		return "bootstrap3";
	}

	@RequestMapping(value = "/charts")
	public String chart() {
		return "charts";
	}

	@RequestMapping(value = "/cards")
	public String cards() {
		return "cards";
	}
	
	@RequestMapping(value = "/404")
	public String nopage() {
		return "404";
	}

}
