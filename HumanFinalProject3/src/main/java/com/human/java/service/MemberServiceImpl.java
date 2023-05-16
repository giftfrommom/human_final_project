package com.human.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.MemberDAO;
import com.human.java.domain.CustomerVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public CustomerVO idCheck_Login(CustomerVO vo) {
		
		return memberDAO.memberLogin(vo);
	}
	@Override
	public CustomerVO Login(CustomerVO vo) {
		System.out.println("여긴 서비스 로그인");
		return memberDAO.Login(vo);
	}

	@Override
	public int userInsert(CustomerVO vo) {
		// TODO Auto-generated method stub
		System.out.println("여긴 회원가입에서 service 임");
		
		return memberDAO.memberInsert(vo);
	}

	@Override
	public List<CustomerVO> memberInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerVO emailCheck_Login(CustomerVO vo) {
		System.out.println("==>> CustomerVO memberEmail service 진입");
		return memberDAO.memberEmail(vo);
	}
	
}
