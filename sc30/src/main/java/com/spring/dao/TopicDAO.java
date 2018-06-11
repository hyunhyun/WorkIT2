package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.model.TopicVO;

@Repository
public class TopicDAO {
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.spring.mapper.TopicMapper";

	public int registerTopic(TopicVO vo) {
		return sqlSession.insert(namespace + ".registerTopic", vo);
	}

	public TopicVO getTopic(int topicID) {
		return sqlSession.selectOne(namespace + ".getTopic", topicID);
	}

	//	public TopicVO updateTopic

	public List<TopicVO> getTopicList(int teamID) {
		return sqlSession.selectList(namespace + ".getTopicList", teamID);
	}

	public int deleteTopic(int topicID) {
		return sqlSession.delete(namespace + ".deleteTopic", topicID);
	}

}
