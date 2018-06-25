package com.spring.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.controller.CommentController;
import com.spring.dao.CommentDAO;
import com.spring.model.CommentVO;
import com.spring.model.InputException;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
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
		if(vo.getContent().length() > 255) {
			throw new InputException("comment content Too Long");
		}
		logger.info("service comment content : "+vo.getContent());
		int rowCount = commentDao.createComment(vo);

//		rowCount 1�̿����� ���� 2�̻��̸� ������ ����, 0 �̸� �Ȼ��� -> exception throw ������ϳ�? 
		
		return rowCount;
	}

	@Override
	public List<CommentVO> getCommentList(int memoID) {
		return commentDao.getCommentList(memoID);
	}

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
