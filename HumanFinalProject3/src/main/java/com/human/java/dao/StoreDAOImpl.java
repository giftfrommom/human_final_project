package com.human.java.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BestplaceVO;
import com.human.java.domain.ConditionVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;
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
		
		return mybatis.selectList("storeDAO.getReviewList",store_id);
	}

	@Override
	public List<BestplaceVO> getBestPlace(int store_id) {
		
		return mybatis.selectList("storeDAO.getBestPlace",store_id);
	}

	@Override
	public List<StoreVO> getStore2(DdipVO ddipVO) {
		
		return mybatis.selectList("storeDAO.getStore2",ddipVO);
	}

	@Override
	public List<CustomerVO> getCustomerList(ConditionVO conditionVO) {
		
		List<CustomerVO> aa = mybatis.selectList("storeDAO.getCustomerList",conditionVO);
	
		return aa;
		
	}

	@Override
	public void deleteCustomer(String[] customerIdAry) {
		
		for(int i =0; i<customerIdAry.length; i++) {
			mybatis.delete("storeDAO.deleteCustomer",customerIdAry[i]);
		}
		
	}

	@Override
	public List<CustomerVO> update(CustomerVO customerVO) {
		mybatis.update("storeDAO.update",customerVO);
		return null;
	}

	@Override
	public CustomerVO getMyMoney(int customer_id) {
		
		return mybatis.selectOne("storeDAO.getMyMoney",customer_id);
	}

	@Override
	public List<CustomerVO> reviewWrite(StoreVO storeVO) {
		mybatis.insert("storeDAO.reviewWrite", storeVO);
		return null;
	}

	@Override
	public void reviewDelete(StoreVO storeVO) {
		
		mybatis.delete("storeDAO.reviewDelete", storeVO);
		
	}
	

}
