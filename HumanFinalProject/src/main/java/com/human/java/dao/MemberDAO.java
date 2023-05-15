package com.human.java.dao;

import java.util.List;

import com.human.java.domain.CustomerVO;

public interface MemberDAO {
	

	/**
	 * id 중복체크 기능 구현
	 */	
	CustomerVO  idCheck( CustomerVO vo );
	
	/**
	 * 회원가입기능 구현
	 */
	int memberInsert(CustomerVO vo);
	
	/**
	 * 로그인 확인 기능 구현
	 */
	CustomerVO memberLogin(CustomerVO vo);
	CustomerVO Login(CustomerVO vo);
	
	CustomerVO memberEmail(CustomerVO vo);

	
	public List<CustomerVO> memberInfo();
	
}
