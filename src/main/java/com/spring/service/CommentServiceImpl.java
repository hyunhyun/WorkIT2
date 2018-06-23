package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.CommentDAO;
import com.spring.model.CommentVO;
import com.spring.model.InputException;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentDAO commentDao;

	@Override
	public int createComment(CommentVO vo) throws InputException {
		if(vo.getMemoID() == -1) {	//선택한 memoID가 안들어옴 -1은 초기값
			throw new InputException("댓글에 선택한 Memo가 없음");
		}
		if(vo.getContent() == null || vo.getContent()== "") {
			throw new InputException("댓글 내용이 없음");
		}
		int rowCount = commentDao.createComment(vo);

//		rowCount 1이여야지 정상 2이상이면 여러개 생김, 0 이면 안생김 -> exception throw 해줘야하나? 
		
		return rowCount;
	}

	@Override
	public List<CommentVO> getCommentList(int memoID) {
		return commentDao.getCommentList(memoID);
	}

//	@Override
//	public CommentVO getComment(int commentID) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int deleteComment(int commentID) {
		return commentDao.deleteComment(commentID);
	}

	@Override
	public int updateComment(CommentVO vo) {
		return commentDao.updateComment(vo);
	}

	@Override
	public CommentVO getComment(int commentID) {
		// TODO Auto-generated method stub
		return null;
	}

}
