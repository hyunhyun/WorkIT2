package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.CommentDAO;
import com.spring.model.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDAO commentDao;

	@Override
	public ResponseEntity<Void> createComment(CommentVO vo) {
		int rowCount = commentDao.createComment(vo);

		if (rowCount > 0) {
			CommentVO checkVO = commentDao.getComment(vo.getCommentID());
			if (checkVO != null) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@Override
	public List<CommentVO> getCommentList(int memoID) {
		return commentDao.getCommentList(memoID);
	}

	@Override
	public CommentVO getComment(int commentID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteComment(int commentID) {
		return commentDao.deleteComment(commentID);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return commentDao.updateComment(vo);
	}

}
