package com.spring.dao;

import org.springframework.stereotype.Repository;

import com.spring.model.MemberVO;

@Repository
public class MemberDAOImpl extends GenericDAOImpl<MemberVO, String> implements MemberDAO {

}
