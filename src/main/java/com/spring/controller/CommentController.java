package com.spring.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import com.spring.model.CommentVO;
import com.spring.model.InputException;
import com.spring.service.CommentService;

@Controller
public class CommentController {
	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	CommentService commentService;

	@RequestMapping(value = "/comment/{memoID}", method = RequestMethod.POST, 
			produces = "application/text; charset=utf8")
	public ResponseEntity<Void> createComment(Model model, HttpSession session,
		@PathVariable(value = "memoID") int memoID,
		@RequestParam("content") String content) throws InputException {
		
		
		logger.info("CommentController - /comment/{memoID} :POST");
		
		logger.info("Comment Register content : "+content); 
		
//		long retryDate = System.currentTimeMillis();
		CommentVO commentVO = new CommentVO();
		commentVO.setContent(content);
		commentVO.setMemoID(memoID);
//		commentVO.setDate(new Timestamp(retryDate));
		commentVO.setWriter((String)session.getAttribute("memberID"));

		int rowCount = commentService.createComment(commentVO);
		if(rowCount == 1) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		}else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}

	@RequestMapping(value = "/comment/{commentID}", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateComment(@PathVariable(value = "commentID") int commentID,
		@RequestParam("content") String content) {

		logger.info("CommentController = /comment/{commentID} : PUT");
		
		long retryDate = System.currentTimeMillis();
		CommentVO commentVO = new CommentVO();
		commentVO.setCommentID(commentID);
		commentVO.setContent(content);
		commentVO.setDate(new Timestamp(retryDate));

		int rowCount = commentService.updateComment(commentVO);

		logger.info("Comment update rowCount : "+rowCount);
		if (rowCount == 1) {

			CommentVO vo = null;
			vo = commentService.getComment(commentID);
			if (vo == null) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/comment/list/{memoID}", method = RequestMethod.GET)
	@ResponseBody
	public List<CommentVO> getMemoComment(Model model, @PathVariable(value = "memoID") int memoID) {
		List<CommentVO> commentList = commentService.getCommentList(memoID);

		logger.info("CommentController /comment/list/{memoID} : GET");
		logger.info("getMemoComment");
		
		logger.info("getMemoComment[0] date : "+commentList.get(0).getDate());
		//		if (commentList != null && !commentList.isEmpty()) {
		return commentList;
		//		}
	}

	@RequestMapping(value = "/comment/{commentID}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteComment(@PathVariable(value = "commentID") int commentID) {
		int rowCount = commentService.deleteComment(commentID);
		
		logger.info("Comment delete rowCount : "+rowCount);
		if (rowCount == 1) {

			CommentVO vo = null;
			vo = commentService.getComment(commentID);
			if (vo == null) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
