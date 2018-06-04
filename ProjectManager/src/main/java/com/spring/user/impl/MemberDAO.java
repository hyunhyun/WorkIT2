package com.spring.user.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.user.MemberVO;

/*@Repository*/
@Component
public class MemberDAO {
	@Autowired
	static SqlSession mybatis;

	@Inject
	SqlSession sqlSession;

	//	private final String USER_GET = "SELECT * FROM Memeber WHERE memberID = ? AND password = ?";
	//
	//	public MemberVO getUser(MemberVO vo) {
	//		MemberVO user = null;
	//		return user;
	//	}
	/*
		public MemberDAO() {
			mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
		}
	*/

	public int insertMember(MemberVO vo) {
		return mybatis.insert("MemberDAO.insertMember");
	}

	public MemberVO getMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.selectMember");
	}

	public int deleteMember(MemberVO vo) {
		int deleted;

		deleted = mybatis.delete("MemberDAO.deleteMember");
		return deleted;

	}

}
