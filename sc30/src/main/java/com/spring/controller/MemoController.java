package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.MemoVO;
import com.spring.service.MemoService;

@Controller
public class MemoController {
	@Autowired
	MemoService memoService;

	@RequestMapping(value = "/memo", method = RequestMethod.POST)
	public ResponseEntity<Void> createMemo(Model model, HttpServletRequest httpServletRequest) {
		return null;
		//		httpServletRequest.getAttribute("title");
		//		httpServletRequest.getAttribute("content");
		//		httpServletRequest.getAttribute("responsable");
		//
	}

	// /memo/{memoID} PUT
	@RequestMapping(value = "/memo", method = RequestMethod.PUT)
	public void updateMemo(@RequestParam("memoID") int memoID) {}

	@RequestMapping(value = "/memo/list", method = RequestMethod.GET)
	public ResponseEntity<Void> getTopicMemo(Model model, @RequestParam("topicID") int topicID) {

		List<MemoVO> memoList = memoService.getMemoList(topicID);
		if (memoList != null && !memoList.isEmpty()) {
			model.addAttribute("topicMemo", memoList);

			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}
	}

	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	public MemoVO getMemo(@RequestParam("memoID") int memoID) {
		return null;
	}

	@RequestMapping(value = "/memo", method = RequestMethod.DELETE)
	public void deleteMemo(@RequestParam("memoID") int memoID) {}

	@RequestMapping(value = "/memo/mylist", method = RequestMethod.GET)
	public List<MemoVO> myWorkMemoList(@RequestParam("membeID") String memberID) {
		return null;
	}
}
