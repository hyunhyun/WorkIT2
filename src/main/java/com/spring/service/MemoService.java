package com.spring.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring.model.MemoVO;
import com.spring.model.TeamMemberVO;

public interface MemoService {
	public List<MemoVO> getMemoList(int topicID);

//	public ResponseEntity<MemoVO> createMemo(MemoVO memoVO);
//	public int createMemo(MemoVO memoVO) throws Exception;
	public MemoVO createMemo(MemoVO memoVO, TeamMemberVO teamMemberVO) throws Exception;

	public MemoVO getMemo(int memoID);

	public int deleteMemo(int memoID);

	public int updateMemo(MemoVO memoVO);

	public List<MemoVO> getMemoResponsable(String memberID);

	public List<MemoVO> searchMemoContent(String content);
}
