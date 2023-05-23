package com.human.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.service.DdipService;

@Controller
@RequestMapping("/ddip/")
public class DdipController {
	
	@Autowired
	private DdipService ddipService;
	
	@RequestMapping("{url}.do")
	public String userViewPage(@PathVariable String url) {
		
		
		return "/ddip/" + url;
	}
	
}













