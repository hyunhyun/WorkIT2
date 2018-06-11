package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

}
