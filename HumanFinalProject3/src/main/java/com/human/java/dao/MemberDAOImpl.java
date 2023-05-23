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

		int aa = mybatis.insert("memberDAO.memberInsert", vo);
		for(int i=1; i<5; i++) {
			mybatis.insert("memberDAO.couponInsert"+i+"");			
		}
		return aa;
	}

	@Override
	public CustomerVO memberLogin(CustomerVO vo) {

		return mybatis.selectOne("memberDAO.memberLogin",vo);
	}

	@Override
	public List<CustomerVO> memberInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO memberEmail(CustomerVO vo) {

		return mybatis.selectOne("memberDAO.memberEmail",vo);
	}

	@Override
	public CustomerVO Login(CustomerVO vo) {
		
		return mybatis.selectOne("memberDAO.memberLogin",vo);
	}


}
