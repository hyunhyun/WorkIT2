package com.spring.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring.model.CommentVO;

public interface CommentService {

	public ResponseEntity<Void> createComment(CommentVO vo);

	public List<CommentVO> getCommentList(int memoID);

	public CommentVO getComment(int commentID);

	public int deleteComment(int commentID);

	public int updateComment(CommentVO vo);
}
