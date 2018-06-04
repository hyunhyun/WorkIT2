package com.spring.model;

public class MemberVO {
	
	String memberID;
	String password;
	String nickname;
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberID=" + memberID + ", password=" + password + ", nickname=" + nickname + "]";
	}
}
