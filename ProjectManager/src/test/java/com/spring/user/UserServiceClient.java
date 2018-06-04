package com.spring.user;

import java.sql.SQLException;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.user.impl.MemberDAO;

//이 테스트 코드는 스프링 먼저 올려야함 - 그게 이 아래 RunWith 저거 annotation
//autowired 같은 어노테이션 할려먼 테스트코드에는 runwith 이거 해야함
//아니면 직점 new 해서 넣어줘얗ㅁ
@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceClient {
	@Autowired
	static MemberDAO dao;

	public static void main(String[] args) throws SQLException {

		System.out.println(dao);

		MemberVO vo = new MemberVO();
		vo.setMemberID("testID");
		vo.setPassword("testPW");
		vo.setNickname("testNKName");

		dao.insertMember(vo);

		//MemberVO returnVO = memberDAO.getMember(vo);

		dao.getMember(vo);
		System.out.println("UserServiceClient");
		//System.out.println(returnVO.toString());
	}
}
