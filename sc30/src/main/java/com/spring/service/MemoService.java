package com.spring.service;

import java.util.List;

import com.spring.model.MemoVO;

public interface MemoService {
	public List<MemoVO> getMemoList(int topicID);
}
