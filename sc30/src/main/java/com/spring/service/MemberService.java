package com.spring.service;

import java.util.List;

import com.spring.model.MemberVO;

public interface MemberService {
	MemberVO getMember(String memberID);

	void register(MemberVO member);

	String login(MemberVO member);

	List<MemberVO> getMemberList();

	List<MemberVO> getListAutoComplete(String search);
}
