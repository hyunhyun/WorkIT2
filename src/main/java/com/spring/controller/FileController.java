package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.model.FileVO;
import com.spring.model.InputException;
import com.spring.service.FileService;

@Controller
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);

	@Autowired
	FileService fileService;
	
	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file, 
			@RequestParam("memoID") int memoID,
			HttpServletRequest request) throws IOException, InputException{
		
	 //참고, String filePath=request.getSession().getServletContext().getRealPath("upload");
	  //절대경로 : String filePath = "c:\\data\\" + file.getOriginalFilename();
		
	  // 파일을 실제 서버에 저장
	
	  // 웹서비스 root 경로​
	
	      String root_path = request.getSession().getServletContext().getRealPath("/");  
	
	      String attach_path = "resources/upload/";
	      String originalName = file.getOriginalFilename();


//	      UUID 36자
			UUID uuid = UUID.randomUUID();
			String saveName = uuid.toString() + "_" + originalName;
			
			if(saveName.length() > 255) {
				throw new InputException("fileName too Long");
			}
			
			File target = new File(root_path +attach_path, saveName);
			FileCopyUtils.copy(file.getBytes(), target);
			
			
			FileVO fileVO = new FileVO();
			fileVO.setFileName(saveName);
			fileVO.setMemoID(memoID);
			fileService.registerFile(fileVO);
			

			return saveName;
	}
	

}
