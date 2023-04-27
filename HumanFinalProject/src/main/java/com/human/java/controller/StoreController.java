package com.human.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.java.service.StoreService;

@Controller
@RequestMapping("/store/")
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("ajaxtest")
	@ResponseBody
	public String ajaxtest() {
		System.out.println("실행됨");
		
		// DB 
		
		// 화면에 전송할 데이터 변환 ( 형태 : xml, json, String )
		
		String ajaxData = "success";
		return ajaxData;
	}
	 
}













