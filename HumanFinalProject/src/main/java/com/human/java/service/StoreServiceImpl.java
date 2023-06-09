package com.human.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.StoreDAO;
import com.human.java.domain.BestplaceVO;
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

	

}
