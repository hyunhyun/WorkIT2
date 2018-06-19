package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.CommentVO;

@Repository
public class CommentDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.spring.mapper.CommentMapper";

	public int createComment(CommentVO vo) {
		return sqlSession.insert(namespace + ".createComment", vo);

	}

	public List<CommentVO> getCommentList(int memoID) {
		return sqlSession.selectList(namespace + ".getCommentList", memoID);
	}

	public CommentVO getComment(int commentID) {
		return sqlSession.selectOne(namespace + ".getComment", commentID);
	}

	public int deleteComment(int commentID) {
		return sqlSession.delete(namespace + ".deleteComment", commentID);
	}

	public int updateComment(CommentVO vo) {
		return sqlSession.update(namespace + ".updateComment", vo);
	}
}
