package com.human.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.StoreDAO;
import com.human.java.domain.BestplaceVO;
import com.human.java.domain.ConditionVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;
import com.human.java.domain.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreDAO storeDAO;

	@Override
	public List<StoreVO> getStoreList() {
			
		return storeDAO.getStoreList();
	}
	
	@Override
	public List<StoreVO> getStoreList(String inputData) {
			
		return storeDAO.getStoreList(inputData);
	}

	@Override
	public List<StoreVO> getStore(int store_id) {
		
		return storeDAO.getStore(store_id);
	}

	@Override
	public List<StoreVO> getReviewList(int store_id) {
		
		return storeDAO.getReviewList(store_id);
	}

	@Override
	public List<BestplaceVO> getBestPlace(int store_id) {
		
		return storeDAO.getBestPlace(store_id);
	}

	@Override
	public List<StoreVO> getStore2(DdipVO ddipVO) {
		
		return storeDAO.getStore2(ddipVO);
	}

	@Override
	public List<CustomerVO> getCustomerList(ConditionVO conditionVO) {
		
		return storeDAO.getCustomerList(conditionVO);
	}

	@Override
	public void deleteCustomer(String[] customerIdAry) {
		
		storeDAO.deleteCustomer(customerIdAry);
		
	}

	@Override
	public List<CustomerVO> update(CustomerVO customerVO) {
	
		return storeDAO.update(customerVO);
	}

	@Override
	public CustomerVO getMyMoney(int customer_id) {
		
		return storeDAO.getMyMoney(customer_id);
	}

	@Override
	public List<CustomerVO> reviewWrite(StoreVO storeVO) {
		
		return storeDAO.reviewWrite(storeVO);
	}

	@Override
	public void reviewDelete(StoreVO storeVO) {
		
		storeDAO.reviewDelete(storeVO);
		
	}

	
	

}
