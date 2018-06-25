package com.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	// xml�뿉 �꽕�젙�맂 由ъ냼�뒪 李몄“
	// bean�쓽 id媛� uploadPath�씤 �깭洹몃�� 李몄“
//	@Resource(name = "uploadPath")
//	String uploadPath;
//
//	// �뾽濡쒕뱶 �쓲由� : �뾽濡쒕뱶 踰꾪듉�겢由� => �엫�떆�뵒�젆�넗由ъ뿉 �뾽濡쒕뱶=> 吏��젙�맂 �뵒�젆�넗由ъ뿉 ���옣 => �뙆�씪�젙蹂닿� file�뿉 ���옣
//	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.GET)
//	public void uploadForm() {
//		// upload/uploadForm.jsp(�뾽濡쒕뱶 �럹�씠吏�)濡� �룷�썙�뵫
//	}
//
//	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
//	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav) throws Exception {
//		// �뙆�씪�쓽 �썝蹂몄씠由� ���옣
//		String savedName = file.getOriginalFilename();
//
//		logger.error("�뙆�씪�씠由� :" + file.getOriginalFilename());
//		logger.error("�뙆�씪�겕湲� : " + file.getSize());
//		logger.error("而⑦뀗�듃 ���엯 : " + file.getContentType());
//
//		// �옖�뜡�깮�꽦+�뙆�씪�씠由� ���옣
//		// �뙆�씪紐� �옖�뜡�깮�꽦 硫붿꽌�뱶�샇異�
//		savedName = uploadFile(savedName, file.getBytes());
//
//		File target = new File(uploadPath, savedName);
//
//		//		mav.setViewName("upload/uploadResult");
//		mav.setViewName("uploadResult");
//		mav.addObject("savedName", savedName);
//
//		return mav; // uploadResult.jsp(寃곌낵�솕硫�)濡� �룷�썙�뵫
//	}
//
//	// �뙆�씪紐� �옖�뜡�깮�꽦 硫붿꽌�뱶
//	private String uploadFile(String originalName, byte[] fileData) throws Exception {
//		// uuid �깮�꽦(Universal Unique IDentifier, 踰붿슜 怨좎쑀 �떇蹂꾩옄)
//		UUID uuid = UUID.randomUUID();
//		// �옖�뜡�깮�꽦+�뙆�씪�씠由� ���옣
//		String savedName = uuid.toString() + "_" + originalName;
//		File target = new File(uploadPath, savedName);
//		// �엫�떆�뵒�젆�넗由ъ뿉 ���옣�맂 �뾽濡쒕뱶�맂 �뙆�씪�쓣 吏��젙�맂 �뵒�젆�넗由щ줈 蹂듭궗
//		// FileCopyUtils.copy(諛붿씠�듃諛곗뿴, �뙆�씪媛앹껜)
//		FileCopyUtils.copy(fileData, target);
//		return savedName;
//	}
//
//	// produces="text/plain;charset=utf-8" : �뙆�씪 �븳湲�泥섎━
//	@ResponseBody
//	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
//	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
//
//		System.out.println("upload/uploadAjax");
//		logger.error("originalName : " + file.getOriginalFilename());
//		logger.error("size : " + file.getSize());
//		logger.error("contentType : " + file.getContentType());
//		return new ResponseEntity<String>(
//			UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
//	}
}
