package com.human.java.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.CustomerVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public CustomerVO info(CustomerVO vo) {
		System.out.println(" MypageDAOImpl : " + vo.getCUSTOMER_LOGINID());
		System.out.println(" MypageDAOImpl : " + vo.getCUSTOMER_PASSWORD());
		System.out.println(" MypageDAOImpl : " + vo.getCUSTOMER_EMAIL());
		
		return mybatis.selectOne("memberDAO.info",vo);
	}
	
	@Override
	public CustomerVO ChargeMoney(CustomerVO vo) {
	
		CustomerVO aa = mybatis.selectOne("mypageDAO.ChargeMoney",vo);
		System.out.println("확인"+aa);
		return aa;
	}

	@Override
	public CustomerVO Payment(CustomerVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
