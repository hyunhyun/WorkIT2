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

	public int createMemo(MemoVO memoVO) {
		return sqlSession.insert(namespace + ".createMemo", memoVO);
	}

	public MemoVO getMemo(int memoID) {
		return sqlSession.selectOne(namespace + ".getMemo", memoID);
	}

	public int deleteMemo(int memoID) {
		return sqlSession.delete(namespace + ".deleteMemo", memoID);
	}

	public int updateMemo(MemoVO memoVO) {
		return sqlSession.update(namespace + ".updateMemo", memoVO);
	}
}
