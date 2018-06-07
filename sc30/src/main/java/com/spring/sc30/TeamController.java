package com.spring.sc30;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;
import com.spring.service.TeamService;

@Controller
public class TeamController {

	@Autowired
	TeamService teamService;

	//	@RequestMapping(value = "/registerTeam", method = RequestMethod.POST)
	//	public String makeTeam(Model model,
	//		@RequestParam("teamName") String teamName,
	//		@RequestParam("madeBy") String madeBy) {
	//
	//		TeamVO teamvo = new TeamVO();
	//		teamvo.setTeamName(teamName);
	//		teamvo.setmadeBy(madeBy);
	//
	//		teamService.registerTeam(teamvo);
	//		int teamID = teamService.getTeamId(teamvo);
	//
	//		//그룹 만든 사용자 멤버로 등록
	//		TeamMemberVO gm = new TeamMemberVO();
	//		gm.setTeamID(teamID);
	//		gm.setMemberID(madeBy);
	//
	//		teamService.registerTeamMember(gm);
	//
	//		return "s";
	//	}
	//

	@RequestMapping(value = "/registerTeam", method = RequestMethod.GET)
	public String registerTeam(Model model) {
		return "teamRegister";
	}

	@RequestMapping(value = "/registerTeamMember", method = RequestMethod.POST)
	public void registerMember(
		@RequestParam("teamID") int teamID,
		@RequestParam("memberID") String memberID) {

		TeamMemberVO vo = new TeamMemberVO();
		vo.setTeamID(teamID);
		vo.setMemberID(memberID);

		teamService.registerTeamMember(vo);
	}

	@RequestMapping(value = "/registerTeam", method = RequestMethod.POST)
	public String makeTeam(Model model,
		@RequestParam("teamName") String teamName,
		@RequestParam("memberID") String memberID,
		@RequestParam("madeBy") String madeBy) {

		System.out.println("registerTeam");
		System.out.println(teamName);
		System.out.println(memberID);
		System.out.println(madeBy);

		TeamVO teamvo = new TeamVO();
		teamvo.setTeamName(teamName);
		teamvo.setmadeBy(madeBy);

		teamService.registerTeam(teamvo);
		//		int teamID = teamService.getTeamId(teamvo);

		int teamID = teamvo.getTeamID();

		//그룹 만든 사용자 멤버로 등록
		TeamMemberVO gm = new TeamMemberVO();
		gm.setTeamID(teamID);
		gm.setMemberID(madeBy);

		teamService.registerTeamMember(gm);

		return "teamRegister";
	}

	//	@RequestMapping(value = "/board", method = RequestMethod.POST)
	//	public void board() {}
}
