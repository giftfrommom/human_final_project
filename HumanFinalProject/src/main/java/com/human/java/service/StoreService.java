package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.BoardVO;
import com.human.java.domain.StoreVO;

public interface StoreService {

	List<StoreVO> getStoreList();

	List<StoreVO> getStoreList(String inputData);

	List<StoreVO> getStore(int store_id);

	List<StoreVO> getReviewList(int store_id);

}
