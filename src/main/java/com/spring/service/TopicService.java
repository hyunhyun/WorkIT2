package com.spring.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring.model.TopicVO;

public interface TopicService {
	public void registerTopic(TopicVO vo);

	public TopicVO getTopic(int topicID);

	public List<TopicVO> getTopiclist(int teamID);

	public int deleteTopic(int topicID);

	public ResponseEntity<Void> updateTopic(int topicID, String topicName);
}
