package com.human.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("## user Controller 진입 ##" + url);
		
		return "/ddip/" + url;
	}
	@RequestMapping("03_StoreList.do")
	public String getStoreList(Model model) {
		System.out.println("들어옴");
		List<StoreVO> storeList = storeService.getStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "/ddip/03_StoreList";
	}
	
	@RequestMapping("03_Tabmove")
	@ResponseBody
	public Map<String, List<StoreVO>> test(String inputData) {
		System.out.println(inputData);
		List<StoreVO> storeList = storeService.getStoreList();
		Map<String, List<StoreVO>> storeMap = new HashMap<String,List<StoreVO>>();
		storeMap.put("storeList", storeList);
		
		System.out.println(storeMap.get("storeList") );
		
		return storeMap;		
	}
}	
	
	

	 














