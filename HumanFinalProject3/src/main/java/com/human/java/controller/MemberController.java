package com.human.java.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.MvcNamespaceHandler;

import com.human.java.domain.CustomerVO;
import com.human.java.service.MemberService;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 모든요청을 받아들이는 것
	@RequestMapping("{url}.do")
	public String userViewPage(@PathVariable String url) {
	
		return "/member/" + url; 
	}
	
	@RequestMapping("/userInsert.do")
	public String userInsert(CustomerVO vo,Model model) {

		int result = memberService.userInsert(vo);
	
		return "redirect:/mypage/01_Main.do";  
	}
	
	@RequestMapping("/login.do")
	public String login(CustomerVO vo, HttpSession session) {
		
		CustomerVO result = memberService.Login(vo);
		
		
		if(result == null) {
			
			return "redirect:/member/13_Login.do";
			
		}else {
	
			session.setAttribute("customer_id", result.getCUSTOMER_ID());
			
			return "redirect:/mypage/01_Main.do"; 
			
		}
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(CustomerVO vo, HttpSession session) {
		
		session.removeAttribute("customer_id");
		
		return "redirect:/mypage/01_Main.do"; 	
	}
	 
	@RequestMapping(value="idCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody		// 화면전환이 되지않고 비동기통신이 가능하도록 만들어주는 어노테이션. ajax 랑 같이쓰는
	public String idCheck(CustomerVO vo) {

		CustomerVO resultVO = memberService.idCheck_Login(vo);
		
		String result ="ID가 사용가능합니다.";	
		if(resultVO != null) result = "중복된 ID입니다.";

		return result;
		
	}
	
	@RequestMapping(value="emailCheck.do", produces = "application/text; charset=utf8")
	@ResponseBody		// 화면전환이 되지않고 비동기통신이 가능하도록 만들어주는 어노테이션. ajax 랑 같이쓰는
	public String emailCheck(CustomerVO vo) {
		
		CustomerVO resultVO = memberService.emailCheck_Login(vo);
		
		String result ="email 사용가능합니다.";	
		if(resultVO != null) result = "중복된 email입니다.";
		
		return result;
		
	}
	
		
   @RequestMapping("01_Main.do")
   public String test() {
     
      return "/mypage/02_info"; 
      
                
   }
   
} 














