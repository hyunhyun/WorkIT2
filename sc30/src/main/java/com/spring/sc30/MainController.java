package com.spring.sc30;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemoVO;
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
	public String home(Locale locale, Model model, @RequestParam("teamID") int teamID) {
		//화면 키자마자 보여야할거 - 해당 팀의 topic,(첫번째 topic의 글 리스트)

		List<TopicVO> topicList = topicService.getTopiclist(teamID);
		model.addAttribute("topicList", topicList);

		List<TeamMemberVO> memberList = teamService.getTeamMember(teamID);
		model.addAttribute("members", memberList);

		//mywork

		return "main";
	}

	@RequestMapping(value = "/getTopicMemo", method = RequestMethod.GET)
	public ResponseEntity<Void> getTeamTopic(Model model, @RequestParam("topicID") int topicID) {

		List<MemoVO> memoList = memoService.getMemoList(topicID);
		if (memoList != null && !memoList.isEmpty()) {
			model.addAttribute("topicMemo", memoList);

			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}
	}

}
