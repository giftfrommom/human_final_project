package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.BoardVO;
import com.human.java.domain.DdipVO;

public interface DdipDAO {

	void setDdip(List<DdipVO> ddipList, int store_id);

	List<DdipVO> getDdipList();

	DdipVO getDdip(DdipVO vo);

	int ddipChk(DdipVO ddipVO);

	void setDdip2(List<DdipVO> ddipList);

	void minusMoney(int menuSum, int customer_id);

}
