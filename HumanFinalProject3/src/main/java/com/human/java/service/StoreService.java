package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.BestplaceVO;
import com.human.java.domain.ConditionVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;
import com.human.java.domain.StoreVO;

public interface StoreService {

	List<StoreVO> getStoreList();

	List<StoreVO> getStoreList(String inputData);

	List<StoreVO> getStore(int store_id);

	List<StoreVO> getReviewList(int store_id);

	List<BestplaceVO> getBestPlace(int store_id);

	List<StoreVO> getStore2(DdipVO ddipVO);

	List<CustomerVO> getCustomerList(ConditionVO conditionVO);

	void deleteCustomer(String[] customerIdAry);

	List<CustomerVO> update(CustomerVO customerVO);

	CustomerVO getMyMoney(int customer_id);


}
