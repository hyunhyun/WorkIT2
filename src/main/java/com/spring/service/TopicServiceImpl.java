package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.TopicDAO;
import com.spring.model.TopicVO;

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

	@Override
	public int deleteTopic(int topicID) {
		return dao.deleteTopic(topicID);
	}

	@Override
	public ResponseEntity<Void> updateTopic(int topicID, String topicName) {
		TopicVO topicVO = new TopicVO();
		topicVO.setTopicID(topicID);
		topicVO.setTopicName(topicName);

		int rowCount = dao.updateTopic(topicVO);

		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
