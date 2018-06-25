package com.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.controller.CommentController;
import com.spring.dao.FileDAO;
import com.spring.dao.MemoDAO;
import com.spring.dao.TeamMemberDAO;
import com.spring.model.FileVO;
import com.spring.model.InputException;
import com.spring.model.MemoVO;
import com.spring.model.TeamMemberVO;

@Service("memoService")
public class MemoServiceImpl implements MemoService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	MemoDAO memoDao;
	
	@Autowired
	TeamMemberDAO TeamMemberDao;

	@Autowired
	FileDAO fileDao;
	
	@Override
	public List<MemoVO> getMemoList(int topicID) {
		memoDao.getMemoList(topicID);

		return memoDao.getMemoList(topicID);

	}

//	@Override
//	public ResponseEntity<MemoVO> createMemo(MemoVO memoVO) {
//		int rowCount = memoDao.createMemo(memoVO);
//
//		if (rowCount > 0) {
//			int memoID = memoVO.getMemoID();
//			MemoVO createdMemo = memoDao.getMemo(memoID);
//
//			return new ResponseEntity<MemoVO>(createdMemo, HttpStatus.OK);
//		} else {
//			return new ResponseEntity<MemoVO>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//	}
//	@Override
//	public MemoVO createMemo(MemoVO memoVO, TeamMemberVO teamMemberVO, List) throws InputException {		//return값  잘 생성 되었을때 생성된 Memo의 MemoID, 에러시 -1
//		
//		if(memoVO.getTitle() == null || memoVO.getTitle().length() == 0) {
//			throw new InputException("Memo Title Required");
//		}
//		if(memoVO.getContent() == null || memoVO.getContent().length() == 0) {
//			throw new InputException("Memo Content Required");
//		}
//		if(memoVO.getTitle().length() > 30) {
//			throw new InputException("Memo Title too Long");
//		}
//		if(memoVO.getContent().length() > 255) {
//			throw new InputException("Memo Content too long");
//		}
//		
//		if(memoVO.getTopicID() == -1) {
//			throw new InputException("Memo topicID required Bad Request");
//		}
//		
//		if(teamMemberVO.getTeamID() == -1) {
//			throw new InputException("Memo teamID required Bad Request");
//		}
//		
//		String responsableID = memoVO.getResponsable();
//			
//		if(responsableID != null) {//responsable있을때만
//			int checkMemberCount = TeamMemberDao.checkTeamMember(teamMemberVO);
//			if(checkMemberCount == 0) {
//				throw new InputException("Responsable Must be a TeamMember");
//			}
//		}
//				
//		int rowCount = memoDao.createMemo(memoVO);
//			
//		if(rowCount == 1) {
////			int memoID = memoVO.getMemoID();
//			return memoVO;
//		}else {
////			rowCount 1이 아니면 mysql insert error발생 Exception throw될 것임
//			return null;
//		}
//	}
	

	

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public MemoVO createMemo(MemoVO memoVO, TeamMemberVO teamMemberVO) throws Exception{		//return값  잘 생성 되었을때 생성된 Memo의 MemoID, 에러시 -1
		
		memoVOCheckLength(memoVO);
		
		if(teamMemberVO.getTeamID() == -1) {
			throw new InputException("Memo teamID required Bad Request");
		}
		
		String responsableID = memoVO.getResponsable();
			
		if(responsableID != null) {//responsable있을때만
			int checkMemberCount = TeamMemberDao.checkTeamMember(teamMemberVO);
			if(checkMemberCount == 0) {
				throw new InputException("Responsable Must be a TeamMember");
			}
		}
				
		int rowCount = memoDao.createMemo(memoVO);
						
		if(rowCount == 1) {
			return memoVO;
		}else {
			return null;
		}
		
	}

	
	
	
	@Override
	public MemoVO getMemo(int memoID) {
		MemoVO vo = memoDao.getMemo(memoID);
		return vo;
	}

	@Override
	public int deleteMemo(int memoID) {
		return memoDao.deleteMemo(memoID);
	}

	@Override
	public int updateMemo(MemoVO memoVO) throws InputException {		
		memoVOCheckLength(memoVO);
			
		logger.info("updateMemo content : "+memoVO.getContent());
		return memoDao.updateMemo(memoVO);
	}

	@Override
	public List<MemoVO> getMemoResponsable(String memberID) {
		return memoDao.getMemoResponsable(memberID);
	}

	@Override
	public List<MemoVO> searchMemoContent(String content) {
		return memoDao.searchMemoContent(content);
	}
	
	
	public void memoVOCheckLength(MemoVO memoVO) throws InputException {
		if(memoVO.getTitle() == null || memoVO.getTitle().length() == 0) {
			throw new InputException("Memo Title Required");
		}
		if(memoVO.getContent() == null || memoVO.getContent().length() == 0) {
			throw new InputException("Memo Content Required");
		}
		if(memoVO.getTitle().length() > 30) {
			throw new InputException("Memo Title too Long");
		}
		if(memoVO.getContent().length() > 255) {
			throw new InputException("Memo Content too long");
		}
		
		if(memoVO.getTopicID() == -1) {
			throw new InputException("Memo topicID required Bad Request");
		}
	}

}
