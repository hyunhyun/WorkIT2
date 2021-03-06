package com.spring.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.model.FileVO;
import com.spring.model.InputException;
import com.spring.service.FileService;

@Controller
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);

	@Autowired
	FileService fileService;
	
//	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
//	@ResponseBody
//	public String upload(@RequestParam("file") MultipartFile file, 
//			@RequestParam("memoID") int memoID,
//			HttpServletRequest request) throws IOException, InputException{
//		
//	 //참고, String filePath=request.getSession().getServletContext().getRealPath("upload");
//	  //절대경로 : String filePath = "c:\\data\\" + file.getOriginalFilename();
//		
//	  // 파일을 실제 서버에 저장
//	
//	  // 웹서비스 root 경로​
//	
//	      String root_path = request.getSession().getServletContext().getRealPath("/");  
//	
//	      String attach_path = "resources/upload/";
//	      String originalName = file.getOriginalFilename();
//
//
////	      UUID 36자
//			UUID uuid = UUID.randomUUID();
//			String saveName = uuid.toString() + "_" + originalName;
//			
//			if(saveName.length() > 255) {
//				throw new InputException("fileName too Long");
//			}
//			
//			File target = new File(root_path +attach_path, saveName);
//			FileCopyUtils.copy(file.getBytes(), target);
//			
//			
//			FileVO fileVO = new FileVO();
//			fileVO.setFileName(saveName);
//			fileVO.setMemoID(memoID);
//			fileService.registerFile(fileVO);
//			
//
//			return saveName;
//	}
	
	/*@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("file[]") MultipartFile[] file, 
			@RequestParam("memoID") int memoID,
			HttpServletRequest request) throws IOException, InputException{
		
	 //참고, String filePath=request.getSession().getServletContext().getRealPath("upload");
	  //절대경로 : String filePath = "c:\\data\\" + file.getOriginalFilename();
		
	  // 파일을 실제 서버에 저장
	
	  // 웹서비스 root 경로​
		logger.info("/fileUPload list file: "+file);
		 
	      String root_path = request.getSession().getServletContext().getRealPath("/");  
	
	      String attach_path = "resources/upload/";
	      
	      String saveName = null;
	      
	      logger.info("multipartFile length : "+file.length);
	      for(int i=0; i<file.length ; i++) {
	      String originalName = file[i].getOriginalFilename();

	      logger.info("/fileUPload list originalName: "+originalName);
	      
//	      UUID 36자
			UUID uuid = UUID.randomUUID();
			saveName = uuid.toString() + "_" + originalName;
			
			if(saveName.length() > 255) {
				throw new InputException("fileName too Long");
			}
			
			File target = new File(root_path +attach_path, saveName);
			FileCopyUtils.copy(file[i].getBytes(), target);
			
			
			FileVO fileVO = new FileVO();
			fileVO.setFileName(saveName);
			fileVO.setMemoID(memoID);
			fileService.registerFile(fileVO);
			
	      }

			return saveName;
	}*/
	
	
	@RequestMapping(value="/fileUpload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(MultipartHttpServletRequest multi) throws IOException, InputException{
		
		//참고, String filePath=request.getSession().getServletContext().getRealPath("upload");
		  //절대경로 : String filePath = "c:\\data\\" + file.getOriginalFilename();		
		  // 파일을 실제 서버에 저장
	
		  // 웹서비스 root 경로​
			 
		      String root_path = multi.getSession().getServletContext().getRealPath("/");  
		
		      String attach_path = "resources/upload/";
	
				
		      String saveName = null;
				
				   Iterator<String> files = multi.getFileNames();	    
				   
				      while(files.hasNext()){
				            String uploadFile = files.next();
				                         
				            logger.info("uploadFile : "+uploadFile);
				            MultipartFile mFile = multi.getFile(uploadFile);
				            String fileName = mFile.getOriginalFilename();

				            fileName = new String(fileName.getBytes("8859_1"),"utf-8");
				            
				            String[] str =fileName.split("\\.");
				            
				            String exp = str[1];

				            logger.info(" 실제 파일 이름 : " +fileName);
				            
				            UUID uuid = UUID.randomUUID();
							//saveName = uuid.toString() + "_" + fileName;
				            
				            saveName = uuid.toString()+"."+exp;
				            
							if(fileName.length() > 255) {
							throw new InputException("fileName too Long");
						}
							logger.info("saveName uuid : "+saveName);
				            
							File directory = new File(root_path + attach_path);

							if(!directory.exists()){
							    directory.mkdir();
							 }						
							
			            	File target = new File(root_path +attach_path, saveName);
			    			FileCopyUtils.copy(mFile.getBytes(), target);
			    			
			    			FileVO fileVO = new FileVO();
			    			fileVO.setFileName(fileName);
			    			fileVO.setUuid(uuid.toString());
			    			fileVO.setMemoID(Integer.parseInt(multi.getParameter("memoID")));
			    			fileVO.setUuid(saveName);
			    			int fileRowCount = fileService.registerFile(fileVO);
			    			//logger.info("fileRowCount : "+fileRowCount);
				        }	      
			
			//File target = new File(root_path +attach_path, saveName);
			//FileCopyUtils.copy(file[i].getBytes(), target);
   
			return saveName;
	}
	
	
	@RequestMapping(value="/file/{fileID}", method= RequestMethod.DELETE)
	@ResponseBody
	public int deleteFile(@PathVariable(value="fileID") int fileID, @RequestParam("uuid") String uuid, HttpServletRequest request) throws Exception {
		logger.info("fileID : "+fileID);
		logger.info("uuid : "+uuid);
		
		//fileName = new String(fileName.getBytes("8859_1"),"utf-8");
		
		return fileService.deleteFile(fileID, uuid, request);

		
	}

}
