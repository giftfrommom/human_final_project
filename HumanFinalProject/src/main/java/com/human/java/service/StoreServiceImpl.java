package com.human.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.StoreDAO;
import com.human.java.domain.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreDAO storeDAO;

	@Override
	public List<StoreVO> getStoreList() {
			
		return storeDAO.getStoreList();
	}
	

}
