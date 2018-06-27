package com.spring.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.dao.TeamDAO;
import com.spring.dao.TeamMemberDAO;
import com.spring.model.DBException;
import com.spring.model.MemberVO;
import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

@Service("teamMemberService")
public class TeamMemberServiceImpl implements TeamMemberService {
	@Autowired
	TeamDAO teamDao;
	
	@Autowired
	TeamMemberDAO teamMemberDao;

	@Override
	public int checkTeamMember(TeamMemberVO teamMemberVO) {
		return teamMemberDao.checkTeamMember(teamMemberVO);
	}

	@Override
	public List<TeamMemberVO> teamMemberAutoComplete(TeamMemberVO teamMemberVO) {
		return teamMemberDao.teamMemberAutoComplete(teamMemberVO);
	}
	
	@Override
	public int AddTeamMember(TeamMemberVO vo) throws DBException {
		
//		값이 있으면 추가하지 않음
		int checkExists = teamDao.checkTeamMember(vo);
		
		if(checkExists > 0) {
			return -1;
		}
		
		int rowCount = teamDao.registerTeamMember(vo);

		if(rowCount != 1) {
			throw new DBException("teamMember register Error");
		}
		
		return rowCount;
	}

}
