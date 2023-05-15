package com.human.java.service;

import java.util.List;

import com.human.java.domain.CustomerVO;

public interface MemberService {

	public CustomerVO idCheck_Login( CustomerVO vo);
	
	public CustomerVO emailCheck_Login( CustomerVO vo);
	
	public int userInsert(CustomerVO vo );
	
	public List<CustomerVO> memberInfo();

	CustomerVO Login(CustomerVO vo);
	
	
}
