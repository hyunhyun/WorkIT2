package com.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.spring.controller.FileController;
import com.spring.dao.CommentDAO;
import com.spring.dao.FileDAO;
import com.spring.model.CommentVO;
import com.spring.model.FileVO;
import com.spring.model.InputException;

@Service("FileService")
public class FileServiceImpl implements FileService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
	public int deleteFile(int fileID, String uuid, HttpServletRequest request) throws Exception {
		
		//업로드된 파일 위치에서 파일 지우기
		logger.info("fileID : "+fileID);
		logger.info("uuid + 확장자: "+uuid);
		
		 String root_path = request.getSession().getServletContext().getRealPath("/");  
	
	      String attach_path = "resources/upload/";
	      
//		new File();
	      
	    
		
		File fileToDelete = new File(root_path+attach_path+uuid);
	    
//		try{
			boolean success = fileToDelete.delete();  //not successful -> IOException}
//		}catch(IOException ioException){
//			throw ioException;
			
//		}
	    logger.info("succes check : "+success);
	      
//		FileUtils.forceDelete(root_path + attach_path + fileName);
//		
//		//NullPointerException ->directory not found
//		//FileNotFoundException ->
//		//IOException ->delete not successful
		
		
		//db에서 저장한 파일 이름 지우기
		int rowCount = fileDao.deleteFile(fileID);
		
		logger.info("delete rowCount : "+rowCount);
		if(rowCount != 1) {
			throw new Exception("file not deleted well");
		}
		
		return rowCount;
		
		//throw new Exception("this is test 뭐라고 뜰까나");
	}
		
	
	
}
