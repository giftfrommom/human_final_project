package com.human.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.MypageDAO;
import com.human.java.domain.CustomerVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public CustomerVO info(CustomerVO vo) {
		System.out.println("MypageServiceImpl :" + vo.getCUSTOMER_LOGINID());
		System.out.println("MypageServiceImpl :" + vo.getCUSTOMER_PASSWORD());
		System.out.println("MypageServiceImpl :" + vo.getCUSTOMER_EMAIL());
		
		return mypageDAO.info(vo);
	}

	@Override
	public CustomerVO Payment(CustomerVO vo) {
		System.out.println("MypageServiceImpl :" + vo.getCustomer_money());
		
		return mypageDAO.Payment(vo);
	}
	
	@Override
	public CustomerVO ChargeMoney(CustomerVO vo) {
		System.out.println(" MypageServiceImpl :" + vo.getCustomer_money());

		return mypageDAO.ChargeMoney(vo);
	}
}
