package com.human.java.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.CustomerVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public CustomerVO idCheck(CustomerVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberInsert(CustomerVO vo) {
		System.out.println("vo : "+vo);
		System.out.println("여긴 회원가입에서 DAO");
		
		return mybatis.insert("memberDAO.memberInsert", vo);
	}

	@Override
	public CustomerVO memberLogin(CustomerVO vo) {
		System.out.println("==>> CustomerVO memberLogin DAO 진입");
		return mybatis.selectOne("memberDAO.memberLogin",vo);
	}

	@Override
	public List<CustomerVO> memberInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO memberEmail(CustomerVO vo) {
		System.out.println("==>> CustomerVO memberEmail DAO 진입");
		return mybatis.selectOne("memberDAO.memberEmail",vo);
	}

	@Override
	public CustomerVO Login(CustomerVO vo) {

		System.out.println("여긴 로그인 DAO ");
		
		return mybatis.selectOne("memberDAO.memberLogin",vo);
	}


}
