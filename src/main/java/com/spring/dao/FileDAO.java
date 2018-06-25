package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.FileVO;
import com.spring.model.MyTeamVO;
import com.spring.model.TeamMemberVO;
import com.spring.model.TeamVO;

@Repository
public class FileDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.spring.mapper.FileMapper";

	public int registerFile(FileVO vo) {
		return sqlSession.insert(namespace + ".registerFile", vo);
	}

	public FileVO getFile(int fileID) {
		return sqlSession.selectOne(namespace+".getFile", fileID);
	}
	
	public List<FileVO> getFileList(int memoID){
		return sqlSession.selectList(namespace+".getFileList", memoID);
	}
	
	public int deleteFile(int fileID) {
		return sqlSession.delete(namespace+".deleteFile", fileID);
	}
	
}
