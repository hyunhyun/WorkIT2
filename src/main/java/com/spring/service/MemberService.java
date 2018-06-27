package com.spring.service;

import java.util.List;

import com.spring.model.InputException;
import com.spring.model.MemberVO;

public interface MemberService {
	MemberVO getMember(String memberID) throws InputException;

	void register(MemberVO member) throws InputException;

	String login(MemberVO member) throws InputException;

	List<MemberVO> getMemberList();

	List<MemberVO> getListAutoComplete(String search);
	
	int deleteMember(String memberID) throws InputException;
}
