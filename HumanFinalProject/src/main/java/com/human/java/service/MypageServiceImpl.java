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
	
	

}
