package com.spring.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring.model.CommentVO;
import com.spring.model.InputException;

public interface CommentService {

	public int createComment(CommentVO vo) throws InputException;

	public List<CommentVO> getCommentList(int memoID);

	public CommentVO getComment(int commentID);

	public int deleteComment(int commentID);

	public int updateComment(CommentVO vo);
}
