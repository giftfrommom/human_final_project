package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.StoreVO;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<StoreVO> getStoreList() {
		
		return mybatis.selectList("storeDAO.getStoreList");
	}
	
	@Override
	public List<StoreVO> getStoreList(String inputData) {
		 
		return mybatis.selectList("storeDAO.getStoreTypeList",inputData);
	}

	@Override
	public List<StoreVO> getStore(int store_id) {
		
		List<StoreVO> slist = mybatis.selectList("storeDAO.getStore",store_id);
		return slist;
	}

	@Override
	public List<StoreVO> getReviewList(int store_id) {
		List<StoreVO> aa = mybatis.selectList("storeDAO.getReviewList",store_id);
		System.out.println(aa);
		return aa;
	}
	

}
