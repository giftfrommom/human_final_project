package com.human.java.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.human.java.domain.CustomerVO;
import com.human.java.service.MypageService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
   
   @Autowired
      private MypageService mypageService;
   
   @RequestMapping("{url}.do")
   public String userViewPage(@PathVariable String url) {
      System.out.println("## user Controller 진입 ##" + url);
      return "/mypage/" + url;
   }
   
   @RequestMapping("01_Main.do")
    public String main1(String CUSTOMER_LOGINID, CustomerVO vo, HttpSession session) {
      
      
      System.out.println("입력한 값 " + vo.getCUSTOMER_LOGINID() );
      // session 저장
      session.setAttribute("CUSTOMER_LOGINID", CUSTOMER_LOGINID);
      
      return "/mypage/01_Main";
   }
   
   
   
   @RequestMapping("02_info.do")
    public String info(Model model,HttpSession session) {
	   
	   Object sessionChk = session.getAttribute("customer_id");
      
	   if(sessionChk != null) {
		   
		   String userId = "userid";
	       CustomerVO vo = new CustomerVO();
	       System.out.println("rr:"+Integer.parseInt(sessionChk.toString()));
	       vo.setCUSTOMER_ID(Integer.parseInt(sessionChk.toString()));

	       CustomerVO vo2 = mypageService.info(vo);
	      
	       model.addAttribute("vo3", vo2);
	       
	       model.addAttribute("str", "안녕");
	         
	       
	       return "/mypage/02_info";
		   
	   }else {
		   return "/member/13_Login";
	   }
	   
     
    }
   
   @RequestMapping("08_Payment.do")
   public String Payment(HttpSession session) {
	  		
	   Object sessionChk = session.getAttribute("customer_id");
	      
	   if(sessionChk != null) {
		   
		CustomerVO vo = new CustomerVO();
		vo.getCustomer_money();
		       
		CustomerVO vo3 = mypageService.Payment(vo);
		System.out.println(vo3);
        
	   return "/mypage/08_Payment";
	   
	   } else {
		   
		   return "/member/13_Login";
	   }
   }
   
   @RequestMapping("08_ChargeMoney")
   public String ChargeMoney(int chargeAmount, Model model){
 
	   CustomerVO vo = new CustomerVO();
	   vo.setCustomer_money(chargeAmount);
	   CustomerVO vo3 = mypageService.ChargeMoney(vo);
	   
	   model.addAttribute(vo3);
	   
	   return "/mypage/08_Payment";
   }
   
   @RequestMapping("09_Orderdetails1.do")
   public String Orderdetails() {
	   
	   return "/mypage/09_Orderdetails1";
   }
}











