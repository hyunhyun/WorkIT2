package com.spring.controller;

import java.util.List;
import java.util.Locale;

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
	@Autowired
	MemberService memberService;

	@Autowired
	TopicService topicService;

	@Autowired
	TeamService teamService;

	@Autowired
	MemoService memoService;

	//	team 만들기, 팀Id로 해당 팀 topic 가져오기, 검색내용 달기,현재 멤버 볼수 있는 버튼 (drop down)
	//mywork 볼 수 있는 버튼
	//	해당 topic 처음 꺼로 글 목록 보여주기

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
	public ModelAndView home(Locale locale, @RequestParam("teamID") int teamID) {
		//화면 키자마자 보여야할거 - 해당 팀의 topic,(첫번째 topic의 글 리스트)

		List<TopicVO> topicList = topicService.getTopiclist(teamID);

		List<TeamMemberVO> memberList = teamService.getTeamMember(teamID);

		System.out.println("teamID : " + teamID);

		ModelAndView mv = new ModelAndView();
		mv.addObject("topicList", topicList);
		mv.addObject("members", memberList);
		mv.addObject("teamID", teamID);
		mv.setViewName("main");

		//mywork

		return mv;
	}

}
