package com.spring.sc30;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TopicController {

	@RequestMapping(value = "/createTopic", method = RequestMethod.GET)
	public String home(Locale locale, Model model,
		@RequestParam("topicName") String topicName,
		@RequestParam("teamID") String teamID) {

		return "redirect:/main";
	}

}
