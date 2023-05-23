package com.human.java.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.CouponVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public CustomerVO info(CustomerVO vo) {

		
		return mybatis.selectOne("mypageDAO.info",vo);
	}
	
	@Override
	public CustomerVO ChargeMoney(CustomerVO vo) {
	
		CustomerVO aa = mybatis.selectOne("mypageDAO.ChargeMoney",vo);
		mybatis.update("mypageDAO.updatemoney", aa);
		return aa;
	}

	@Override
	public CustomerVO Payment(CustomerVO vo) {
		CustomerVO aa = mybatis.selectOne("mypageDAO.Payment",vo);
		return aa;
	}

	@Override
	public CustomerVO edit(CustomerVO vo) {
		
		mybatis.update("mypageDAO.edit",vo);
		CustomerVO aa = mybatis.selectOne("mypageDAO.editcome",vo);
			
		return aa;
	}


	@Override
	public List<CouponVO> getCouponList(CouponVO vo) {
		
		List<CouponVO> aa = mybatis.selectList("mypageDAO.getCouponList",vo);
		
		return aa;
	}

	@Override
	public List<DdipVO> getOrderList(DdipVO vo) {

		List<DdipVO> aa = mybatis.selectList("mypageDAO.getOrderList",vo);
		
		return aa;
	}

}
