package com.human.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.DdipDAO;

@Service("ddipService")
public class DdipServiceImpl implements DdipService{
	
	@Autowired
	private DdipDAO ddipDAO;
	
	

}
