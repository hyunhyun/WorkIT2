package com.spring.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MyTeamVO;
import com.spring.service.TeamService;

//git repository name changed
@Controller
public class BoardController {
	@Autowired
	TeamService teamService;

	//	@ModelAttribute("listTeam")
	//	public List<MyTeamVO> initData(HttpSession session) {
	//		String memberID = (String)session.getAttribute("memberID");
	//		List<MyTeamVO> listTeam = teamService.getmyTeamList(memberID);
	//
	//		//		List<TeamVO> listTeam = new ArrayList<>();
	//		//		TeamVO vo = new TeamVO();
	//		//		vo.setmadeBy("test");
	//		//		vo.setTeamName("he");
	//		//
	//		//		TeamVO vo2 = new TeamVO();
	//		//		vo2.setmadeBy("test");
	//		//		vo2.setTeamName("she");
	//		//		listTeam.add(vo);
	//		//		listTeam.add(vo2);
	//
	//		return listTeam;
	//	}
	//
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String showBoard(Locale locale, Model model, HttpSession session) {
		String memberID = (String)session.getAttribute("memberID");
		//		if (memberID == null || memberID.equals("")) {
		//			return "auth/login";
		//		}

		List<MyTeamVO> listTeam = teamService.getmyTeamList(memberID);

		model.addAttribute("listTeam", listTeam);
		return "board";
	}

	@RequestMapping(value = "/board", method = RequestMethod.POST)
	public String selectTeam(Locale locale, Model model,
		@RequestParam("topicID") int topicID) {

		return "board";
	}
}
