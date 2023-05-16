package com.human.java.dao;


import com.human.java.domain.CustomerVO;


public interface MypageDAO {
	
	public CustomerVO info(CustomerVO vo);

	CustomerVO ChargeMoney(CustomerVO vo);

	public CustomerVO Payment(CustomerVO vo);
}
