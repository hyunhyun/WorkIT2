package com.spring.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring.model.MemoVO;

public interface MemoService {
	public List<MemoVO> getMemoList(int topicID);

	public ResponseEntity<MemoVO> createMemo(MemoVO memoVO);

	public MemoVO getMemo(int memoID);

	public int deleteMemo(int memoID);
}
