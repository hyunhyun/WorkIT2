package com.spring.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.TeamVO;
import com.spring.service.TeamService;

@Controller
public class TeamController {

	@Autowired
	TeamService teamService;

	@RequestMapping(value = "/team/page", method = RequestMethod.GET)
	public String showTeamPage(Model model) {
		return "teamRegister";
	}

	@RequestMapping(value = "/team/member", method = RequestMethod.POST)
	public void registerTeamMember(
		@RequestParam("teamID") int teamID,
		@RequestParam("memberID") String memberID) {}

	//TODO jsonarray 안들어옴 Map으로 매핑 안됨 처리하기
	@RequestMapping(value = "/team", method = RequestMethod.POST)
	//	public String makeTeam(@RequestBody TeamRegister data) {
	//	public String makeTeam(@RequestParam("teamMembers") String teamMembers,
	//		@RequestParam("madeBy") String madeBy,
	//		@RequestParam("teamName") String teamName) {
	public String makeTeam(@RequestBody String data) throws ParseException {

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject)jsonParser.parse(data);
		JSONArray jArray = (JSONArray)jsonObject.get("teamMembers");

		String madeBy = (String)jsonObject.get("madeBy");
		String teamName = (String)jsonObject.get("teamName");

		JSONArray teamMembers = (JSONArray)jsonObject.get("teamMembers");

		System.out.println(data);
		//
		//		List<Map<String, String>> teamMembersMap = new ArrayList<Map<String, Object>>();

		System.out.println("Controller start");
		TeamVO teamvo = new TeamVO();
		teamvo.setTeamName(teamName);
		teamvo.setmadeBy(madeBy);

		teamService.registerTeam(teamvo);
		int teamID = teamvo.getTeamID();
		teamService.registerTeamMember(teamMembers, teamID);

		System.out.println("Controller out");
		return "teamRegister";
	}

	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public String getTeam() {

		return "teamRegister";
	}

	@RequestMapping(value = "/team", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateTeamName(@RequestParam("teamID") int teamID,
		@RequestParam("teamName") String teamName) {
		//public String updateTeamName(@RequestBody String data) throws ParseException {
		//public String update(@RequestParam("teamID") int teamID, @RequestParam("teamName") String teamName) {
		System.out.println("team update Controller");
		//System.out.println(data);
		return teamService.updateTeamName(teamID, teamName);
		//JSONParser jsonParser = new JSONParser();

		//JSONObject jsonObject = (JSONObject)jsonParser.parse(data);
		//int teamID = (int)jsonObject.get("teamID");
		//System.out.println("teamID : " + teamID);

		//return "board";
	}

	//	@RequestMapping(value = "/team", method = RequestMethod.DELETE)
	//	public ResponseEntity<Void> deleteTeam(@RequestParam("teamID") int teamID) {
	//		System.out.println("team delete start");
	//		return teamService.deleteTeam(teamID);
	//	}

	@RequestMapping(value = "/team/{teamID}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteTeam(@PathVariable(value = "teamID") int teamID) {
		System.out.println("team delete start");
		return teamService.deleteTeam(teamID);
	}
}
