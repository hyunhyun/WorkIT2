package com.spring.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.http.ResponseEntity;

import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

public interface TeamMemberService {
	public int checkTeamMember(TeamMemberVO teamMemberVO);
	public List<TeamMemberVO> teamMemberAutoComplete(TeamMemberVO teamMemberVO);
	
}
