package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;
import com.spring.persistence.TeamDAO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {
	@Autowired
	TeamDAO teamDao;

	@Override
	public void registerTeam(TeamVO vo) {
		teamDao.registerTeam(vo);
		return;
	}

	@Override
	public void registerTeamMember(TeamMemberVO vo) {
		teamDao.registerTeamMember(vo);
	}

	@Override
	public TeamVO getTeam(String teamID) {
		return teamDao.getTeam(teamID);
	}

	@Override
	public List<MyTeamVO> getmyTeamList(String memberID) {
		return teamDao.getmyTeamList(memberID);
	}

	@Override
	public List<TeamMemberVO> getTeamMember(int teamID) {
		return teamDao.getTeamMember(teamID);
	}

	//	@Override
	//	public int getTeamId(TeamVO vo) {
	//		return teamDao.getTeamId(vo);
	//	}

}
