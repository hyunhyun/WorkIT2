package com.spring.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.TeamDAO;
import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {
	@Autowired
	TeamDAO teamDao;

	@Override
	public void registerTeam(TeamVO vo) {

		System.out.println("registerTeam start");
		teamDao.registerTeam(vo);

		int teamID = vo.getTeamID();

		//그룹 만든 사용자 멤버로 등록
		TeamMemberVO gm = new TeamMemberVO();
		gm.setTeamID(teamID);
		gm.setMemberID(vo.getmadeBy());

		teamDao.registerTeamMember(gm);

		return;
	}

	//	@Override
	//	public void registerTeamMember(List<Map<String, String>> teamMembers, int teamID) {
	//		for (Map<String, String> map : teamMembers) {
	//			String ID = map.get("memberID");
	//
	//			TeamMemberVO vo = new TeamMemberVO();
	//			vo.setMemberID(ID);
	//			vo.setTeamID(teamID);
	//
	//			teamDao.registerTeamMember(vo);
	//		}
	//	}

	@Override
	public void registerTeamMember(JSONArray teamMembers, int teamID) {
		for (int i = 0; i < teamMembers.size(); i++) {
			JSONObject jobject = (JSONObject)teamMembers.get(i);
			String memberID = (String)jobject.get("memberID");

			TeamMemberVO vo = new TeamMemberVO();
			vo.setMemberID(memberID);
			vo.setTeamID(teamID);

			teamDao.registerTeamMember(vo);
		}
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

	@Override
	public ResponseEntity<Void> updateTeamName(int teamID, String teamName) {
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamName(teamName);
		teamVO.setTeamID(teamID);

		System.out.println("service update");
		int rowCount = teamDao.updateTeamName(teamVO);

		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Override
	public ResponseEntity<Void> deleteTeam(int teamID) {
		int rowCount = teamDao.deleteTeam(teamID);

		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	//	@Override
	//	public int getTeamId(TeamVO vo) {
	//		return teamDao.getTeamId(vo);
	//	}

}
