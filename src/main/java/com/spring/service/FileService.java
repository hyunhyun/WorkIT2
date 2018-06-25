package com.spring.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.spring.model.CommentVO;
import com.spring.model.FileVO;
import com.spring.model.InputException;

public interface FileService {

	public int registerFile(FileVO vo) throws InputException;
	public FileVO getFile(int fileID);
	public List<FileVO> getFileList(int memoID) throws Exception;
	public int deleteFile(int fileID);
}
