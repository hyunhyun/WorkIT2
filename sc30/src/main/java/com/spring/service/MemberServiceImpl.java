package com.spring.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.model.MemberVO;
import com.spring.persistence.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDao;

	@Override
	public MemberVO getMember(String memberID) {
		return memberDao.get(memberID);
	}

	@Override
	public void register(MemberVO member) {

		// DB에 넣고 DB테이블에서 직접 확인해봐야 한다.

		memberDao.register(member);
		return;
	}
}
