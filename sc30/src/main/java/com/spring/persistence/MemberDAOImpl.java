package com.spring.persistence;

import org.springframework.stereotype.Repository;

import com.spring.model.MemberVO;

@Repository
public class MemberDAOImpl extends GenericDAOImpl<MemberVO, String> implements MemberDAO {

}
