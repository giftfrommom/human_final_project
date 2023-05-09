package com.human.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.java.domain.StoreVO;
import com.human.java.service.MypageService;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("{url}.do")
	public String userViewPage(@PathVariable String url) {		
		return "/mypage/" + url;
	}
	 
}













