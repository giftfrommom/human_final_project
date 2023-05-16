package com.human.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.CenterDAO;

@Service("centerService")
public class CenterServiceImpl implements CenterService{
	
	@Autowired
	private CenterDAO centerDAO;


}
