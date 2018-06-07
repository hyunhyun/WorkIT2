package com.spring.service;

import java.util.List;

import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

public interface TeamService {
	public void registerTeam(TeamVO vo);

	public void registerTeamMember(TeamMemberVO vo);

	public TeamVO getTeam(String teamID);

	public List<MyTeamVO> getmyTeamList(String memberID);

	public List<TeamMemberVO> getTeamMember(int teamID);
	//	public int getTeamId(TeamVO vo);
}
