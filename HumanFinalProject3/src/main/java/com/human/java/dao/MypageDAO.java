package com.human.java.dao;


import java.util.List;

import com.human.java.domain.CouponVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;


public interface MypageDAO {
	
	public CustomerVO info(CustomerVO vo);

	CustomerVO ChargeMoney(CustomerVO vo);

	public CustomerVO Payment(CustomerVO vo);

	public CustomerVO edit(CustomerVO vo);

	public List<CouponVO> getCouponList(CouponVO vo);

	public List<DdipVO> getOrderList(DdipVO vo);

}
