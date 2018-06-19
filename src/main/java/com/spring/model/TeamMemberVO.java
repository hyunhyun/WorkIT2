package com.spring.model;

//join 결과 위해서 필요한 VO
public class TeamMemberVO {
	private int teamID;
	private String memberID;

	public int getTeamID() {
		return teamID;
	}

	public void setTeamID(int teamID) {
		this.teamID = teamID;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

}
