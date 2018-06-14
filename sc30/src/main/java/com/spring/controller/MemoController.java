package com.spring.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.model.MemoVO;
import com.spring.service.MemoService;

@Controller
public class MemoController {
	@Autowired
	MemoService memoService;

	@RequestMapping(value = "/memo", method = RequestMethod.POST)
	public ResponseEntity<MemoVO> createMemo(Model model, HttpSession session,
		@RequestParam("title") String title,
		@RequestParam("content") String content,
		@RequestParam("responsable") String responsable,
		@RequestParam("topicID") int topicID) {
		//		httpServletRequest.getAttribute("title");
		//		httpServletRequest.getAttribute("content");
		//		httpServletRequest.getAttribute("responsable");

		long retryDate = System.currentTimeMillis();
		MemoVO memoVO = new MemoVO();
		memoVO.setTitle(title);
		memoVO.setContent(content);
		memoVO.setResponsable(responsable);
		memoVO.setDate(new Timestamp(retryDate));
		memoVO.setTopicID(topicID);
		memoVO.setWriter((String)session.getAttribute("memberID"));
		///file

		return memoService.createMemo(memoVO);
	}

	// /memo/{memoID} PUT
	@RequestMapping(value = "/memo", method = RequestMethod.PUT)
	public void updateMemo(@RequestParam("memoID") int memoID) {

	}

	@RequestMapping(value = "/memo/list/{topicID}", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> getTopicMemo(Model model, @PathVariable(value = "topicID") int topicID) {
		List<MemoVO> memoList = memoService.getMemoList(topicID);

		if (memoList != null && !memoList.isEmpty()) {
			model.addAttribute("topicMemo", memoList);
		}

		return memoList;

	}

	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.GET)
	@ResponseBody
	public MemoVO getMemo(@PathVariable(value = "memoID") int memoID) {
		MemoVO vo = memoService.getMemo(memoID);

		return vo;
	}

	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteMemo(@PathVariable(value = "memoID") int memoID) {
		int rowCount = memoService.deleteMemo(memoID);

		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateMemo(@PathVariable(value = "memoID") int memoID,
		@RequestParam("title") String title,
		@RequestParam("content") String content,
		@RequestParam("responsable") String responsable) {

		MemoVO memoVO = new MemoVO();
		memoVO.setTitle(title);
		memoVO.setContent(content);
		memoVO.setResponsable(responsable);

		int rowCount = memoService.updateMemo(memoVO);

		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/memo/myList/{memberID}", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> myWorkMemoList(@PathVariable(value = "memberID") String memberID) {
		List<MemoVO> memoList = memoService.getMemoResponsable(memberID);
		return memoList;
	}

}
