package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.MemoVO;

@Repository
public class MemoDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.spring.mapper.MemoMapper";

	public List<MemoVO> getMemoList(int topicID) {
		return sqlSession.selectList(namespace + ".getMemoList", topicID);
	}
}
