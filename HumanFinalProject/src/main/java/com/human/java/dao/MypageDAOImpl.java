package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;
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
	
	

}
