package com.human.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.service.MypageService;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
//	@RequestMapping("/board/getBoardList.do")
	 
}













