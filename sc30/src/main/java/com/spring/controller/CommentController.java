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

import com.spring.model.CommentVO;
import com.spring.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/comment/{memoID}", method = RequestMethod.POST)
	public ResponseEntity<Void> createMemo(Model model, HttpSession session,
		@PathVariable(value = "memoID") int memoID,
		@RequestParam("content") String content) {

		long retryDate = System.currentTimeMillis();
		CommentVO commentVO = new CommentVO();
		commentVO.setContent(content);
		commentVO.setMemoID(memoID);
		commentVO.setDate(new Timestamp(retryDate));
		commentVO.setWriter((String)session.getAttribute("memberID"));

		return commentService.createComment(commentVO);
	}

	@RequestMapping(value = "/comment/{commentID}", method = RequestMethod.PUT)
	public void updateMemo(@PathVariable(value = "commentID") int commentID) {
		//TODO update
	}

	@RequestMapping(value = "/comment/list/{memoID}", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentVO> getMemoComment(Model model, @PathVariable(value = "memoID") int memoID) {
		List<CommentVO> commentList = commentService.getCommentList(memoID);

		//		if (commentList != null && !commentList.isEmpty()) {
		return commentList;
		//		}
	}

	//	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.GET)
	//	@ResponseBody
	//	public MemoVO getMemo(@PathVariable(value = "memoID") int memoID) {
	//		//		MemoVO vo = commentService.getMemo(memoID);
	//
	//		return vo;
	//	}

}
