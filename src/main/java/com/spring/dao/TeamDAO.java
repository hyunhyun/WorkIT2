package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

@Repository
public class TeamDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.spring.mapper.TeamMapper";

	public void registerTeam(TeamVO vo) {
		sqlSession.insert(namespace + ".registerTeam", vo);
	}

	public void registerTeamMember(TeamMemberVO vo) {
		sqlSession.insert(namespace + ".registerTeamMember", vo);
	}

	public TeamVO getTeam(String groupID) {
		return sqlSession.selectOne(namespace + ".getTeam", groupID);
	}

	public List<TeamVO> teamDao(String memberID) {
		return sqlSession.selectList(namespace + ".getmyTeamList");
	}

	public List<TeamMemberVO> getTeamMember(int groupID) {
		return sqlSession.selectList(namespace + ".getTeamMember");
	}

	//	public int getTeamId(TeamVO vo) {
	//		return sqlSession.selectOne(namespace + ".getTeamId", vo);
	//	}

	public List<MyTeamVO> getmyTeamList(String memberID) {

		List<MyTeamVO> listTeam = sqlSession.selectList(namespace + ".getMyTeamList", memberID);

		return listTeam;
	}

	public int updateTeamName(TeamVO teamVO) {
		return sqlSession.update(namespace + ".updateTeamName", teamVO);
	}

	public int deleteTeam(int teamID) {
		return sqlSession.delete(namespace + ".deleteTeam", teamID);
	}
	
	
}
