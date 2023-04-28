package com.human.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("{url}.do")

	public String userViewPage(@PathVariable String url) {
	System.out.println("## user Controller 진입 ##" + url);
	 
	return "/member/" + url;
	}
	 
}














