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

	//	team 留뚮뱾湲�, ��Id濡� �빐�떦 �� topic 媛��졇�삤湲�, 寃��깋�궡�슜 �떖湲�,�쁽�옱 硫ㅻ쾭 蹂쇱닔 �엳�뒗 踰꾪듉 (drop down)
	//mywork 蹂� �닔 �엳�뒗 踰꾪듉
	//	�빐�떦 topic 泥섏쓬 爰쇰줈 湲� 紐⑸줉 蹂댁뿬二쇨린

	//	@ModelAttribute("myWorkList")
	//	public List<ContentVO> getMyWork() {
	//
	//	}

	//	@ModelAttribute("members")
	//	public List<TeamMemberVO> getMembers(@RequestParam("teamID") int teamID) {
	//		List<TeamMemberVO> memberList = teamService.getTeamMember(teamID);
	//		return memberList;
	//	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView showMain(Locale locale, @RequestParam("teamID") int teamID, HttpSession session) {
		//		if (session.getAttribute("memberID") != null) {
		String memberID = (String)session.getAttribute("memberID");

		List<TopicVO> topicList = topicService.getTopiclist(teamID);

		List<TeamMemberVO> memberList = teamService.getTeamMember(teamID);

		logger.info("Mainpage teamID : " + teamID);
		logger.info("Mainpage session memberID"+memberID);

		ModelAndView mv = new ModelAndView();
		mv.addObject("topicList", topicList);
		mv.addObject("members", memberList);
		mv.addObject("teamID", teamID);
		mv.addObject("memberID", memberID);
		mv.setViewName("main");

		return mv;
		//		}
		//		else {
		//			ModelAndView mv = new ModelAndView();
		//			mv.setViewName("auth/login");
		//
		//			return mv;
		//		}

		//mywork
	}

}
