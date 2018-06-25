package com.spring.controller;

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

import com.spring.model.InputException;
import com.spring.model.TeamVO;
import com.spring.service.TeamService;

@Controller
public class TeamController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	TeamService teamService;

	@RequestMapping(value = "/team/page", method = RequestMethod.GET)
	public String showTeamPage(Model model) {
		return "teamRegister";
	}

	@RequestMapping(value = "/team", method = RequestMethod.POST)
	//	public String makeTeam(@RequestBody TeamRegister data) {
	//	public String makeTeam(@RequestParam("teamMembers") String teamMembers,
	//		@RequestParam("madeBy") String madeBy,
	//		@RequestParam("teamName") String teamName) {
	@ResponseBody
	public String makeTeam(@RequestBody String data) throws Exception {

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject)jsonParser.parse(data);
		JSONArray jArray = (JSONArray)jsonObject.get("teamMembers");

		String madeBy = (String)jsonObject.get("madeBy");
		String teamName = (String)jsonObject.get("teamName");
		
		if(teamName.length() > 20) {
			throw new InputException("teamName too Long");
		}else if(teamName.length() == 0) {
			throw new InputException("teamName required");
		}

		JSONArray teamMembers = (JSONArray)jsonObject.get("teamMembers");

		logger.info("/team POST data: "+data);

		TeamVO teamvo = new TeamVO();
		teamvo.setTeamName(teamName);
		teamvo.setmadeBy(madeBy);
				
		
		try {
			teamService.registerTeam(teamvo);
		} catch (Exception e) {
			return e.getMessage();
			//message: team Not registered
		}
			
		int teamID = teamvo.getTeamID();
		teamService.registerTeamMember(teamMembers, teamID);

		logger.info("registerTeam registered TeamID :"+teamID);
		return "teamRegister";
	}

	@RequestMapping(value = "/team", method = RequestMethod.GET)
	public String getTeam() {

		return "teamRegister";
	}

	@RequestMapping(value = "/team", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateTeamName(@RequestParam("teamID") int teamID,
		@RequestParam("teamName") String teamName) {
		
		logger.info("/team PUT updateTeamName");
		return teamService.updateTeamName(teamID, teamName);
	}

	//	@RequestMapping(value = "/team", method = RequestMethod.DELETE)
	//	public ResponseEntity<Void> deleteTeam(@RequestParam("teamID") int teamID) {
	//		System.out.println("team delete start");
	//		return teamService.deleteTeam(teamID);
	//	}

	@RequestMapping(value = "/team/{teamID}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteTeam(@PathVariable(value = "teamID") int teamID) {
		logger.info("/team/{teamID} team delete start");
		return teamService.deleteTeam(teamID);
	}
}
