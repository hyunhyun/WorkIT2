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

	// xml에 설정된 리소스 참조
	// bean의 id가 uploadPath인 태그를 참조
	@Resource(name = "uploadPath")
	String uploadPath;

	// 업로드 흐름 : 업로드 버튼클릭 => 임시디렉토리에 업로드=> 지정된 디렉토리에 저장 => 파일정보가 file에 저장
	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
		// upload/uploadForm.jsp(업로드 페이지)로 포워딩
	}

	@RequestMapping(value = "/upload/uploadForm", method = RequestMethod.POST)
	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav) throws Exception {
		// 파일의 원본이름 저장
		String savedName = file.getOriginalFilename();

		logger.error("파일이름 :" + file.getOriginalFilename());
		logger.error("파일크기 : " + file.getSize());
		logger.error("컨텐트 타입 : " + file.getContentType());

		// 랜덤생성+파일이름 저장
		// 파일명 랜덤생성 메서드호출
		savedName = uploadFile(savedName, file.getBytes());

		File target = new File(uploadPath, savedName);

		//		mav.setViewName("upload/uploadResult");
		mav.setViewName("uploadResult");
		mav.addObject("savedName", savedName);

		return mav; // uploadResult.jsp(결과화면)로 포워딩
	}

	// 파일명 랜덤생성 메서드
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		// 랜덤생성+파일이름 저장
		String savedName = uuid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	// produces="text/plain;charset=utf-8" : 파일 한글처리
	@ResponseBody
	@RequestMapping(value = "/upload/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {

		System.out.println("upload/uploadAjax");
		logger.error("originalName : " + file.getOriginalFilename());
		logger.error("size : " + file.getSize());
		logger.error("contentType : " + file.getContentType());
		return new ResponseEntity<String>(
			UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
}
