package com.spring.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.DBException;
import com.spring.model.InputException;
import com.spring.model.MemberVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;
import com.spring.service.MemberService;
import com.spring.service.TeamMemberService;
import com.spring.service.TeamService;

@Controller
public class TeamMemberController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	TeamService teamService;

	@Autowired
	TeamMemberService teamMemberService;

	@RequestMapping(value = "/team/member", method = RequestMethod.POST)
	@ResponseBody
	public TeamMemberVO registerTeamMember(
		@RequestParam("teamID") int teamID,
		@RequestParam("memberID") String memberID,
		HttpServletRequest request) throws InputException, DBException {
		
		String nickname = null;
		
		if(request.getParameter("nickname") != null) {
			//memberID로 검색해서 nickname가져오기
			MemberVO memberVO = memberService.getMember(memberID);
			nickname = memberVO.getNickname();
		}else {
			nickname = request.getParameter("nickname");
		}
		
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setMemberID(memberID);
		teamMemberVO.setTeamID(teamID);
		teamMemberVO.setNickname(nickname);
		
		int check = teamMemberService.AddTeamMember(teamMemberVO);
		//여기서 error 발생시 서비스에서 Exception throw 됨
		
		if(check == -1) {
			return null;
		}
				
		return teamMemberVO;
	}
	
//	@RequestMapping(value = "/team/member", method = RequestMethod.GET)
//	public void getTeamMember(
//		@RequestParam("teamID") int teamID,
//		@RequestParam("memberID") String memberID) {
//		
//	}
	
	
	@RequestMapping(value = "/team/member/auto", method = RequestMethod.GET)
	@ResponseBody
	public List<TeamMemberVO> teamMemberAutoComplete(
		@RequestParam("teamID") int teamID, 
		@RequestParam("memberID") String memberID) {
		
		logger.info("/team/member :GET get TeamMembers search(Autocomplete) : " + memberID);
		
		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setMemberID(memberID);
		teamMemberVO.setTeamID(teamID);
		
		List<TeamMemberVO> list = teamMemberService.teamMemberAutoComplete(teamMemberVO);
		logger.info("TeamMemeber autocomple listSize : "+list.size());
		
		return list;
	}
	
}
