package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.dao.CommentDAO;
import com.spring.dao.FileDAO;
import com.spring.model.CommentVO;
import com.spring.model.FileVO;
import com.spring.model.InputException;

@Service("FileService")
public class FileServiceImpl implements FileService {
	@Autowired
	FileDAO fileDao;

	@Override
	public int registerFile(FileVO vo) throws InputException {
		if(vo.getMemoID() == -1) {
			throw new InputException("file Register needs MemoID");
		}
		if(vo.getFileName() == null) {
			throw new InputException("FileName is null");
		}
		
		return fileDao.registerFile(vo);
	}

	@Override
	public FileVO getFile(int fileID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FileVO> getFileList(int memoID) throws Exception {
		if(memoID == -1){
			throw new Exception("file Register needs MemoID");
		}
		return fileDao.getFileList(memoID);
	}

	@Override
	public int deleteFile(int fileID) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	

}
