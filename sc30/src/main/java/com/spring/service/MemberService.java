package com.spring.service;

import com.spring.model.MemberVO;

public interface MemberService {
	MemberVO getMember(String memberID);

	void register(MemberVO member);

	String login(MemberVO member);
}
