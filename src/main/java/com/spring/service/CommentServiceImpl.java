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
		if(vo.getMemoID() == -1) {	//������ memoID�� �ȵ��� -1�� �ʱⰪ
			throw new InputException("��ۿ� ������ Memo�� ����");
		}
		if(vo.getContent() == null || vo.getContent()== "") {
			throw new InputException("��� ������ ����");
		}
		int rowCount = commentDao.createComment(vo);

//		rowCount 1�̿����� ���� 2�̻��̸� ������ ����, 0 �̸� �Ȼ��� -> exception throw ������ϳ�? 
		
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
