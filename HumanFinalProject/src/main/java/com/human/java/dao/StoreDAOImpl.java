package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;
import com.human.java.domain.StoreVO;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<StoreVO> getStoreList() {
		
		return mybatis.selectList("storeDAO.getStoreList");
	}
	

}
