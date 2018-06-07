package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.model.TopicVO;
import com.spring.persistence.TopicDAO;

@Service("topicService")
public class TopicServiceImpl implements TopicService {

	@Autowired
	TopicDAO dao;

	@Override
	public void registerTopic(TopicVO vo) {
		dao.registerTopic(vo);
	}

	@Override
	public TopicVO getTopic(int topicID) {
		return dao.getTopic(topicID);
	}

	//	update

	@Override
	public List<TopicVO> getTopiclist(int teamID) {
		return dao.getTopicList(teamID);
	}
}
