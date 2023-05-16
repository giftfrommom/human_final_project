package com.human.java.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.DdipDAO;
import com.human.java.domain.DdipVO;

@Service("ddipService")
public class DdipServiceImpl implements DdipService{
	
	@Autowired
	private DdipDAO ddipDAO;


	@Override
	public void setDdip(List<DdipVO> ddipList, int store_id) {
		
		ddipDAO.setDdip(ddipList,store_id);
		
	}


	@Override
	public List<DdipVO> getDdipList() {
		
		return ddipDAO.getDdipList();
	}
	
	

}
