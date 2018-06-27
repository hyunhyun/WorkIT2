package com.spring.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.model.InputException;
import com.spring.model.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class.getName());

	@Resource
	private MemberDAO memberDao;

	@Override
	public MemberVO getMember(String memberID) throws InputException {
		if(memberID == null) {
			throw new InputException("no MemberID");
		}
		if(memberID.isEmpty()) {
			throw new InputException("no MemberID");
		}
		
		if(memberID.length() > 20) {
			throw new InputException("MemberID too Long");
		}
		return memberDao.get(memberID);
	}

	@Override
	public void register(MemberVO member) throws InputException {

		logger.info("memberID : "+member.getMemberID());
		logger.info("password : "+member.getPassword());
		logger.info("nickname : "+member.getNickname());
		
		if(member.getMemberID() == null) {
			throw new InputException("memberID required");
		}
		if(member.getMemberID().isEmpty()) {
			throw new InputException("memberID required");
		}
		if(member.getMemberID().length() > 20) {
			throw new InputException("memberID too Long");
		}
		
		if(member.getPassword() == null) {
			throw new InputException("password required");
		}
		if(member.getPassword().isEmpty()) {
			throw new InputException("password required");
		}
		if(member.getNickname() == null) {
			throw new InputException("nickname required");
		}
		if(member.getNickname().isEmpty()) {
			throw new InputException("nickname required");
		}
		if(member.getNickname().length() > 20) {
			throw new InputException("nickname too Long");
		}
		
		String hashedPW;

		try {
			hashedPW = hashWith256(member.getPassword());
			member.setPassword(hashedPW);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			logger.error("register error : NoSuchAlgorithm : SHA-256?");
		}

		memberDao.register(member);
		return;
	}

	String hashWith256(String textToHash) throws NoSuchAlgorithmException {
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] byteOfTextToHash = textToHash.getBytes(StandardCharsets.UTF_8);
		byte[] hashedByteArray = digest.digest(byteOfTextToHash);
		//	    String encoded = Base64.encode(hashedByetArray);
		String encoded = Base64.getEncoder().encodeToString(hashedByteArray);
		return encoded;
	}

	@Override
	public String login(MemberVO member) {
		
		String hashedPW = null;
		try {
			hashedPW = hashWith256(member.getPassword());
			member.setPassword(hashedPW);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		MemberVO vo = memberDao.get(member.getMemberID());
		if (vo == null) {
			return "no ID";
		} else if (!vo.getPassword().equals(hashedPW)) {
			return "authentication fail";
		} else {
			return "success";
		}

	}

	@Override
	public List<MemberVO> getMemberList() {
		return memberDao.getList();
	}

	@Override
	public List<MemberVO> getListAutoComplete(String search) {
		System.out.println("searchService : " + search);
		return memberDao.getListAutoComplete(search);
	}
}
