package com.human.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.service.CenterService;

@Controller
@RequestMapping("/center/")
public class CenterController {
	
	@Autowired
	private CenterService centerService;
	
//	@RequestMapping("/board/getBoardList.do")
	 
}













