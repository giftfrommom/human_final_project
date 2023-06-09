package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.human.java.domain.BoardVO;
import com.human.java.domain.CouponVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;

public interface MypageService {

	public CustomerVO info(CustomerVO vo);

	public CustomerVO ChargeMoney(CustomerVO vo);

	CustomerVO Payment(CustomerVO vo);

	public CustomerVO edit(CustomerVO vo);


	public List<CouponVO> getCouponList(CouponVO vo);

	public List<DdipVO> getOrderList(DdipVO vo);

}
