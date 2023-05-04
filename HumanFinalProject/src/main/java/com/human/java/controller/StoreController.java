package com.human.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.java.domain.StoreVO;
import com.human.java.service.StoreService;

@Controller
@RequestMapping("/store/")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("{url}.do")
	public String userViewPage(@PathVariable String url) {		
		return "/ddip/" + url;
	}
	
	@RequestMapping("ajaxtest")
	@ResponseBody
	public int test() {
		System.out.println("dd");
		return 1;
	}
	
	@RequestMapping("03_StoreList.do")
	public String getStoreList(Model model) {

		List<StoreVO> storeList = storeService.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "/ddip/03_StoreList";
	}
	
	@RequestMapping("03_Tabmove")
	@ResponseBody
	public Map<String, List<StoreVO>> test(String inputData) {

		List<StoreVO> storeList = storeService.getStoreList(inputData);
		Map<String, List<StoreVO>> storeMap = new HashMap<String,List<StoreVO>>();
		storeMap.put("storeList1", storeList);
		
		return storeMap;		
	}
	
	@RequestMapping("04_Tabmove")
	@ResponseBody
	public Map<String, List<StoreVO>>getReviewList(int store_id){
		System.out.println(store_id);
		List<StoreVO> reviewList = storeService.getReviewList(store_id);
		Map<String, List<StoreVO>> reviewMap = new HashMap<String,List<StoreVO>>();
		reviewMap.put("reviewMap",reviewList);
		
		return reviewMap;
	}
	
	@RequestMapping("04_Store")
	public String getStore(@RequestParam("id") int store_id, Model model) {
		
		List<StoreVO> storeInfo = storeService.getStore(store_id);
		model.addAttribute("storeInfo", storeInfo);
		
		return "/ddip/04_Store";
	}
}	
	
	

	 














