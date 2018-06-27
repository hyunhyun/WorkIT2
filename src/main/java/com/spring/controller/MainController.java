package com.spring.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.TeamMemberVO;
import com.spring.model.TopicVO;
import com.spring.service.MemberService;
import com.spring.service.MemoService;
import com.spring.service.TeamService;
import com.spring.service.TopicService;

@Controller
public class MainController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberService memberService;

	@Autowired
	TopicService topicService;

	@Autowired
	TeamService teamService;

	@Autowired
	MemoService memoService;

	

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView showMain(Locale locale, @RequestParam("teamID") int teamID, HttpSession session) {
		//		if (session.getAttribute("memberID") != null) {
		String memberID = (String)session.getAttribute("memberID");

		List<TopicVO> topicList = topicService.getTopiclist(teamID);

		List<TeamMemberVO> memberList = teamService.getTeamMember(teamID);

		logger.info("Mainpage teamID : " + teamID);
		logger.info("Mainpage session memberID"+memberID);
		logger.info("memberList size : " + memberList.size());

		for(int i=0; i<memberList.size(); i++) {
			logger.info("memberList "+i+" memberID : "+memberList.get(i).getMemberID());
			logger.info("memberList "+i+" nickname : "+memberList.get(i).getNickname());
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("topicList", topicList);
		mv.addObject("memberList", memberList);
		mv.addObject("teamID", teamID);
		mv.addObject("memberID", memberID);
		mv.setViewName("main");

		return mv;
		
	}

}
