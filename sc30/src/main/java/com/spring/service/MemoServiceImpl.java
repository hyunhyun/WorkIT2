package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.MemoDAO;
import com.spring.model.MemoVO;

@Service("memoService")
public class MemoServiceImpl implements MemoService {
	@Autowired
	MemoDAO memoDao;

	@Override
	public List<MemoVO> getMemoList(int topicID) {
		return memoDao.getMemoList(topicID);
	}

	@Override
	public ResponseEntity<MemoVO> createMemo(MemoVO memoVO) {
		int rowCount = memoDao.createMemo(memoVO);

		if (rowCount > 0) {
			int memoID = memoVO.getMemoID();
			MemoVO createdMemo = memoDao.getMemo(memoID);

			return new ResponseEntity<MemoVO>(createdMemo, HttpStatus.OK);
		} else {
			return new ResponseEntity<MemoVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
