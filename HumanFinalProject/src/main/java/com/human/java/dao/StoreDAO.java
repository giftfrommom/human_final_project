package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.BoardVO;
import com.human.java.domain.StoreVO;

public interface StoreDAO {

	List<StoreVO> getStoreList();

	List<StoreVO> getStoreList(String inputdata);

	List<StoreVO> getStore(int store_id);

	List<StoreVO> getReviewList(int store_id);

}
