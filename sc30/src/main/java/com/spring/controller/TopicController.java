package com.spring.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.TopicVO;
import com.spring.service.MemoService;
import com.spring.service.TopicService;

@Controller
public class TopicController {
	@Autowired
	TopicService topicService;

	@Autowired
	MemoService memoService;

	@RequestMapping(value = "/topic", method = RequestMethod.POST)
	public ResponseEntity<Void> createTopic(Locale locale, Model model,
		@RequestParam("topicName") String topicName,
		@RequestParam("teamID") int teamID) {

		System.out.println("topicName : " + topicName);
		System.out.println("teamID : " + teamID);
		//create topic

		if (topicName.length() > 10) {
			return new ResponseEntity<Void>(HttpStatus.LENGTH_REQUIRED);
		} else {
			TopicVO vo = new TopicVO();
			vo.setTopicName(topicName);
			vo.setTeamID(teamID);

			topicService.registerTopic(vo);
			//해당 id로 검색하고 있는지 확인

			int topicID = vo.getTopicID();
			TopicVO checkVo = null;
			checkVo = topicService.getTopic(topicID);

			if (checkVo != null) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			} else {
				//db에 저장이 안됨
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}

		//return "redirect:/main";
	}

	@RequestMapping(value = "/topic", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateTopic(@RequestParam("topicID") int topicID,
		@RequestParam("topicName") String topicName) {

		return topicService.updateTopic(topicID, topicName);
	}

	@RequestMapping(value = "/topic", method = RequestMethod.GET)
	public void getTeamTopic() {}

	@RequestMapping(value = "/topic", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteTopic(@RequestParam("topicID") int topicID) {
		//	public ResponseEntity<Void> deleteTopic(@RequestBody String topicID) {
		System.out.println("topicDelete start");
		System.out.println(topicID);
		int deletedRowCount = topicService.deleteTopic(topicID);
		if (deletedRowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		//		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
