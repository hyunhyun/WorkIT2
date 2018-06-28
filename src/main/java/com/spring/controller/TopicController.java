package com.spring.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.InputException;
import com.spring.model.TopicVO;
import com.spring.service.MemoService;
import com.spring.service.TopicService;

@Controller
public class TopicController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	@Autowired
	TopicService topicService;

	@Autowired
	MemoService memoService;

	@RequestMapping(value = "/topic", method = RequestMethod.POST)
	public ResponseEntity<Void> createTopic(Locale locale, Model model,
		@RequestParam("topicName") String topicName,
		@RequestParam("teamID") int teamID) throws InputException {

		logger.info("topicName : " + topicName);
		logger.info("teamID : " + teamID);
		//create topic

		if(teamID == -1) {
			throw new InputException("team not Selected");
		}
		if (topicName.length() > 10) {
			throw new InputException("topicName too Long");
			//return new ResponseEntity<Void>(HttpStatus.LENGTH_REQUIRED);
		}else if(topicName.length() == 0) {
			throw new InputException("topicName required");
		}
		else {
			TopicVO vo = new TopicVO();
			vo.setTopicName(topicName);
			vo.setTeamID(teamID);

			topicService.registerTopic(vo);

			int topicID = vo.getTopicID();
			TopicVO checkVo = null;
			checkVo = topicService.getTopic(topicID);

			if (checkVo != null) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}

		//return "redirect:/main";
	}

	@RequestMapping(value = "/topic", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateTopic(@RequestParam("topicID") int topicID,
		@RequestParam("topicName") String topicName) throws InputException {
		
		if(topicName.equals("")) {
			throw new InputException("topicName required");
		}
		return topicService.updateTopic(topicID, topicName);
	}

	/*@RequestMapping(value = "/topic", method = RequestMethod.GET)
	public void getTeamTopic() {}*/

	@RequestMapping(value = "/topic", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteTopic(@RequestParam("topicID") int topicID) throws InputException {
		logger.info("topicDelete start");
		logger.info("topicDelete topicID : "+topicID);
		
		if(topicID == -1) {
			throw new InputException("topicID required select topic");
		}
		
		int deletedRowCount = topicService.deleteTopic(topicID);
		if (deletedRowCount == 1) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
