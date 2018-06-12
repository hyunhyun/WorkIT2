package com.spring.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

		//writer
		///file

		return memoService.createMemo(memoVO);
	}

	// /memo/{memoID} PUT
	@RequestMapping(value = "/memo", method = RequestMethod.PUT)
	public void updateMemo(@RequestParam("memoID") int memoID) {}

	@RequestMapping(value = "/memo/list/{topicID}", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> getTopicMemo(Model model, @PathVariable(value = "topicID") int topicID) {
		System.out.println("controller start");

		List<MemoVO> memoList = memoService.getMemoList(topicID);
		System.out.println("getMemolist done");

		if (memoList != null && !memoList.isEmpty()) {
			model.addAttribute("topicMemo", memoList);

			System.out.println("before return if");
			//return new ResponseEntity<List<MemoVO>>(memoList, HttpStatus.OK);

			//before return if 까지찍힘
			//return 하고 문제 javascript랑 받는문제
		} else {

			System.out.println("before return else");
			//return new ResponseEntity<List<MemoVO>>(HttpStatus.SERVICE_UNAVAILABLE);
		}

		return memoList;

	}

	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	public MemoVO getMemo(@RequestParam("memoID") int memoID) {
		return null;
	}

	@RequestMapping(value = "/memo", method = RequestMethod.DELETE)
	public void deleteMemo(@RequestParam("memoID") int memoID) {}

	@RequestMapping(value = "/memo/mylist", method = RequestMethod.GET)
	public List<MemoVO> myWorkMemoList(@RequestParam("memberID") String memberID) {
		return null;
	}
}
