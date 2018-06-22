package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

@Repository
public class TeamMemberDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.spring.mapper.TeamMapper";

	public int checkTeamMember(TeamMemberVO vo) {
		return sqlSession.selectOne(namespace + ".checkTeamMember", vo);
		//return count(*)
	}
	
	public List<TeamMemberVO> teamMemberAutoComplete(TeamMemberVO teamMemberVO){
		return sqlSession.selectList(namespace + ".teamMemberAutoComplete", teamMemberVO);
	}
}
