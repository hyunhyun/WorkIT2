package com.spring.service;

import java.util.List;

import com.spring.model.TopicVO;

public interface TopicService {
	public void registerTopic(TopicVO vo);

	public TopicVO getTopic(int topicID);

	//	update

	public List<TopicVO> getTopiclist(int teamID);

	public int deleteTopic(int topicID);
}
