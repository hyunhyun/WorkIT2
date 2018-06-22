package com.spring.controller;

import java.util.List;
import java.util.Locale;

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

import com.spring.model.MemberVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;
import com.spring.service.TeamMemberService;
import com.spring.service.TeamService;

@Controller
public class TeamMemberController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	TeamService teamService;

	@Autowired
	TeamMemberService teamMemberService;

	@RequestMapping(value = "/team/member", method = RequestMethod.GET)
	public void registerTeamMember(
		@RequestParam("teamID") int teamID,
		@RequestParam("memberID") String memberID) {
		
//		teamService.getTeamMember(teamID);
	}
	
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
