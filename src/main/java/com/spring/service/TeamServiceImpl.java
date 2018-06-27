package com.spring.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.dao.TeamDAO;
import com.spring.model.MemberVO;
import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	TeamDAO teamDao;

	@Autowired
	MemberDAO memberDao;
	

	@Override
	public int registerTeam(TeamVO vo) throws Exception {		
		logger.info("registerTeam start");
		
		int rowCount = teamDao.registerTeam(vo);

		if(rowCount != 1){throw new Exception("team not Registered");}
		int teamID = vo.getTeamID();
		
		return rowCount;
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
	//	public void registerTeamMember(List<Map<String, String>> teamMembers, int teamID) {
	public void registerTeamMember(JSONArray teamMembers, int teamID) throws Exception {
		
		for (int i = 0; i < teamMembers.size(); i++) {
			JSONObject jobject = (JSONObject)teamMembers.get(i);
			String memberID = (String)jobject.get("memberID");
			
			//아이디 중복되는거 있는지 검사
			//중복되는 항목은 remove
			if(checkRepeatedID(teamMembers, i, memberID) != 1) {
				continue;	//중복되는 값은 건너뛰기
			}

			logger.info(memberID);
			TeamMemberVO vo = new TeamMemberVO();
			vo.setMemberID(memberID);
			vo.setTeamID(teamID);

			MemberVO checkvo = memberDao.get(memberID);
			if (checkvo != null) {		//teamMember should be a Member
				
				vo.setNickname(checkvo.getNickname());
				int rowCount = teamDao.registerTeamMember(vo);
				if(rowCount != 1) {
					throw new Exception("TeamMember not registered");
				}
			} else {
				logger.info("TeamMember not in Member Table");
			}
		}

		//		for (Map<String, String> item : teamMembers) {
		//			String memberID = item.get("memberID");
		//
		//			TeamMemberVO vo = new TeamMemberVO();
		//			vo.setMemberID(memberID);
		//			vo.setTeamID(teamID);
		//
		//			teamDao.registerTeamMember(vo);
		//		}
	}

	
	public int checkRepeatedID(JSONArray teamMembers, int i, String memberID) {
		for(int j=0; j<i; j++) {
			JSONObject compareObject = (JSONObject)teamMembers.get(j);
			String compareID = (String)compareObject.get("memberID");
			if(memberID.equals(compareID)) {
				return 1;	//같은 값이 있음
			}
		}
		return 0;	//같은 값이 없음
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
