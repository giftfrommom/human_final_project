package com.human.java.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.DdipVO;

@Repository("ddipDAO")
public class DdipDAOImpl implements DdipDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<DdipVO> getDdipList() {

		return mybatis.selectList("ddipDAO.getDdipList");
		
	}


	@Override
	public DdipVO getDdip(DdipVO vo) {
		
		return mybatis.selectOne("ddipDAO.getDdip",vo);
	}


	@Override
	public int ddipChk(DdipVO ddipVO) {
		
		return mybatis.selectOne("ddipDAO.ddipChk",ddipVO);
	}
	
	@Override
	public void setDdip(List<DdipVO> ddipList, int store_id) {
		
		Map<String, Object> paramMap = new HashMap<>();
		 
		 
	    paramMap.put("ddipList", ddipList);
	    paramMap.put("store_id", store_id);
	    mybatis.insert("ddipDAO.setDdip", paramMap);
	        
	    mybatis.insert("ddipDAO.setOrder_tbl", paramMap);	    	
	  
	    for(int i=0; i<ddipList.size(); i++) {
	    	mybatis.insert("ddipDAO.setOrder_tbl_detail", ddipList.get(i));	    	
	    }
		
	}

	@Override
	public void setDdip2(List<DdipVO> ddipList) {
		
		Map<String, Object> paramMap = new HashMap<>();
	 
	    paramMap.put("ddipList", ddipList);
	    
	    mybatis.insert("ddipDAO.setOrder_tbl2", paramMap);	    	
	  
	    for(int i=0; i<ddipList.size(); i++) {
	    	mybatis.insert("ddipDAO.setOrder_tbl_detail2", ddipList.get(i));	    	
	    }
	    
	    mybatis.update("ddipDAO.setCurcnt",paramMap);
	}
	

}
