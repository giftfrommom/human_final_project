package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	

}
