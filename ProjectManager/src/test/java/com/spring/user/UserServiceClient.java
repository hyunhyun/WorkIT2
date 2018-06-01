package com.spring.user;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.user.impl.MemberDAO;

public class UserServiceClient {
	@Autowired
	static MemberDAO dao;

	public static void main(String[] args) throws SQLException {

		System.out.println(dao);

		MemberVO vo = new MemberVO();
		vo.setMemberID("testID");
		vo.setPassword("testPW");
		vo.setNickname("testNKName");

		//MemberVO returnVO = memberDAO.getMember(vo);

		dao.getMember(vo);
		System.out.println("UserServiceClient");
		//System.out.println(returnVO.toString());
	}
}
