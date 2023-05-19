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
		System.out.println(" MypageDAOImpl : " + vo.getCUSTOMER_LOGINID());
		System.out.println(" MypageDAOImpl : " + vo.getCUSTOMER_PASSWORD());
		System.out.println(" MypageDAOImpl : " + vo.getCUSTOMER_EMAIL());
		
		return mybatis.selectOne("memberDAO.info",vo);
	}
	
	@Override
	public CustomerVO ChargeMoney(CustomerVO vo) {
		System.out.println("vo:         "+vo);
		mybatis.update("mypageDAO.updatemoney", vo);
		CustomerVO aa = mybatis.selectOne("mypageDAO.SelectMoney",vo);
		System.out.println("확인"+aa);
		return aa;
	}

	@Override
	public CustomerVO Payment(CustomerVO vo) {
		CustomerVO aa = mybatis.selectOne("mypageDAO.Payment",vo);
		System.out.println("확인b"+aa);
		return aa;
	}

	@Override
	public CustomerVO edit(CustomerVO vo) {
		mybatis.update("mypageDAO.edit",vo);
		CustomerVO aa = mybatis.selectOne("mypageDAO.editcome",vo);
		
		System.out.println("확인c"+aa);
		
		return aa;
	}


	@Override
	public List<CouponVO> getCouponList(CouponVO vo) {
		
		List<CouponVO> aa = mybatis.selectList("mypageDAO.getCouponList",vo);
		System.out.println("확인d"+aa);
		
		return aa;
	}

	@Override
	public List<DdipVO> getOrderList(DdipVO vo) {
		System.out.println("확인e"+vo);
		List<DdipVO> aa = mybatis.selectList("mypageDAO.getOrderList",vo);
		System.out.println("확인e"+aa);
		
		return aa;
	}

}
