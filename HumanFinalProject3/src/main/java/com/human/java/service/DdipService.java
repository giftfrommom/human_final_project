package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import com.human.java.domain.BoardVO;
import com.human.java.domain.DdipVO;

public interface DdipService {

	void setDdip(List<DdipVO> ddipList, int store_id);

	List<DdipVO> getDdipList();

	DdipVO getDdip(DdipVO vo);


}
