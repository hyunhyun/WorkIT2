package com.spring.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.http.ResponseEntity;

import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

public interface TeamService {
	public void registerTeam(TeamVO vo);

	//	public void registerTeamMember(List<Map<String, String>> teamMembers, int teamID);
	public void registerTeamMember(JSONArray teamMembers, int teamID);

	public TeamVO getTeam(String teamID);

	public List<MyTeamVO> getmyTeamList(String memberID);

	public List<TeamMemberVO> getTeamMember(int teamID);
	//	public int getTeamId(TeamVO vo);

	public ResponseEntity<Void> updateTeamName(int teamID, String teamName);

	public ResponseEntity<Void> deleteTeam(int teamID);
}
