package com.spring.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.model.FileVO;
import com.spring.model.InputException;
import com.spring.model.MemoVO;
import com.spring.model.TeamMemberVO;
import com.spring.service.FileService;
import com.spring.service.MemoService;

@Controller
public class MemoController {
	@Autowired
	MemoService memoService;
	
	@Autowired
	FileService fileService;

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "/memo", method = RequestMethod.POST)
	public ResponseEntity<MemoVO> createMemo(Model model, HttpSession session,
		@RequestParam("title") String title,
		@RequestParam("content") String content,
//		@RequestParam("responsable") String responsable,
		@RequestParam("topicID") int topicID,
		@RequestParam("teamID") int teamID,  
		HttpServletRequest request) throws Exception {
//		@RequestParam("fileName[]") String[] fileName
		
		logger.info("/memo :POST createMemo title : "+title);
		logger.info("/memo :POST createMemo content : "+content);
		
		logger.info("/memo :POST createMemo topicID : "+topicID);
		
		String MemberID = (String)session.getAttribute("memberID");
		long retryDate = System.currentTimeMillis();
		MemoVO memoVO = new MemoVO();
		memoVO.setTitle(title);
		memoVO.setContent(content);
		
		String responsable = null;
		
		if(request.getParameter("responsable")!= null) {
			responsable = request.getParameter("responsable");
			memoVO.setResponsable(responsable);
			logger.info("/memo :POST createMemo responsable : "+responsable);
		}
		memoVO.setDate(new Timestamp(retryDate));
		memoVO.setTopicID(topicID);
		memoVO.setWriter(MemberID);
		memoVO.setTeamID(teamID);
		///file
		

		TeamMemberVO teamMemberVO = new TeamMemberVO();
		teamMemberVO.setMemberID(responsable);
		teamMemberVO.setTeamID(teamID);
		
		//String[] fileName = request.getParameterValues("fileName");
		//MultipartFile[] files = (MultipartFile[])request.getParameterValues("file");
		
		
		
		MemoVO createdVO = memoService.createMemo(memoVO, teamMemberVO);
		logger.info("createdMemo memoID: "+createdVO.getMemoID());
		
/*		if(request.getParameterValues("fileName")!= null) {
		String[] fileName = request.getParameterValues("fileName");
		
		int rowCount = 0;
		for(int i=0; i<fileName.length; i++) {
			FileVO vo = new FileVO();
			
			vo.setFileName(fileName[i]);
			vo.setMemoID(createdVO.getMemoID());
			
			logger.info("register Memo register File MemoID : "+vo.getMemoID());
			logger.info("register Memo register File FileName : "+vo.getFileName());
			rowCount += fileService.registerFile(vo);
			logger.info("registerMemo file Register rowCount : "+rowCount);
		}
		if(createdVO != null && rowCount == fileName.length) {		
			return new ResponseEntity<MemoVO>(createdVO, HttpStatus.OK);
		}else {
			return new ResponseEntity<MemoVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		}*/
//메모, file
		
		if(createdVO != null) {		
			return new ResponseEntity<MemoVO>(createdVO, HttpStatus.OK);
		}else {
			return new ResponseEntity<MemoVO>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@RequestMapping(value = "/memo/list/{topicID}", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> getTopicMemo(Model model, @PathVariable(value = "topicID") int topicID) {
		
		logger.info("/memo/list/{topicID} : GET topicID : "+topicID);
		List<MemoVO> memoList = memoService.getMemoList(topicID);

		logger.info("/memo/list/{topicID} memoList size : "+memoList.size());
		if (memoList != null && !memoList.isEmpty()) {
			model.addAttribute("topicMemo", memoList);
		}

		return memoList;

	}

	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getMemo(@PathVariable(value = "memoID") int memoID) throws Exception {
		logger.info("/memo/{memoID} GET memoID : "+memoID);
		
		MemoVO vo = memoService.getMemo(memoID);
		
		List<FileVO> fileList = fileService.getFileList(memoID);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memo", vo);
		map.put("files", fileList);
		
		return map;
	}

	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> deleteMemo(@PathVariable(value = "memoID") int memoID) {
		int rowCount = memoService.deleteMemo(memoID);
		
		logger.info("/memo/{memoID} DELETE memoID : "+memoID);
		logger.info("Memodelete rowCount : "+rowCount);
		
		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/memo/{memoID}", method = RequestMethod.PUT)
	public ResponseEntity<Void> updateMemo(@PathVariable(value = "memoID") int memoID,
		@RequestParam("title") String title,
		@RequestParam("content") String content,
		@RequestParam("responsable") String responsable) throws InputException {

		logger.info("/memo/{memoID} PUT updateMemo start");
		logger.info("updateMemo memoID : "+memoID);
		logger.info("updateMemo title : "+title);
		logger.info("updateMemo content : "+content);
		logger.info("updateMemo responsable : "+responsable);
		
		MemoVO memoVO = new MemoVO();
		memoVO.setMemoID(memoID);
		memoVO.setTitle(title);
		memoVO.setContent(content);
		memoVO.setResponsable(responsable);

		int rowCount = memoService.updateMemo(memoVO);
		logger.info("updateMemo rowCount : "+rowCount);
			
		if (rowCount > 0) {
			return new ResponseEntity<Void>(HttpStatus.OK);
		} else {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/memo/myList/{memberID}", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> myWorkMemoList(@PathVariable(value = "memberID") String memberID) {
		List<MemoVO> memoList = memoService.getMemoResponsable(memberID);
		return memoList;
	}

	/*@RequestMapping(value = "/memo", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> searchContentMemo(@RequestParam("searchContent") String search) {

		logger.info("updateMemo searchContent : "+search);
		List<MemoVO> memoList = memoService.searchMemoContent(search);

		logger.info("memoList search size : " + memoList.size());

		//		if (!memoList.isEmpty() && memoList != null) {
		//			return new ResponseEntity<Void>(HttpStatus.OK);
		//		} else {
		//			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		//		}

		return memoList;
	}*/

	
	@RequestMapping(value = "/memo", method = RequestMethod.GET)
	@ResponseBody
	public List<MemoVO> searchTeamContentMemo(@RequestParam("teamID") int teamID, @RequestParam("searchContent") String search) throws InputException, UnsupportedEncodingException {

	//	search = new String(search.getBytes("ISO-8859-1"), "UTF-8");

		logger.info("searchTeamContentMemo searchContent : "+search);
		logger.info("searchTeamContentMemo teamID "+teamID);
		//List<MemoVO> memoList = memoService.searchMemoContent(search);

		List<MemoVO> memoList = memoService.searchTeamMemoContent(search, teamID);
		logger.info("memoList search size : " + memoList.size());

		return memoList;
	}
	
}
