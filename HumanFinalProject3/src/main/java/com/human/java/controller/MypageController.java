package com.human.java.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.human.java.domain.ConditionVO;
import com.human.java.domain.CouponVO;
import com.human.java.domain.CustomerVO;
import com.human.java.domain.DdipVO;
import com.human.java.service.MypageService;
import com.human.java.service.StoreService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
   
   @Autowired
   private MypageService mypageService;
   
   @Autowired
   private StoreService storeService;
   
   @RequestMapping("{url}.do")
   public String userViewPage(@PathVariable String url,Model model, HttpSession session) {
      
	   Object customer_id = session.getAttribute("customer_id");

		if (customer_id != null) {
			
			CustomerVO customerVO = storeService.getMyMoney((int) customer_id);
			model.addAttribute("myMoney", customerVO.getCustomer_money());

		} 
	   
      return "/mypage/" + url;
   }
   
   @RequestMapping("01_Main.do")
    public String main1(String CUSTOMER_LOGINID,Model model, CustomerVO vo, HttpSession session) {
      
	   Object customer_id = session.getAttribute("customer_id");

		if (customer_id != null) {
			
			CustomerVO customerVO = storeService.getMyMoney((int) customer_id);
			model.addAttribute("myMoney", customerVO.getCustomer_money());

		} 
      
      // session 저장
      session.setAttribute("CUSTOMER_LOGINID", CUSTOMER_LOGINID);
      
      return "/mypage/01_Main";
   }
   
   @RequestMapping("02_info.do")
   public String info(Model model,HttpSession session) {
	   
	   Object sessionChk = session.getAttribute("customer_id");
     
	   if(sessionChk != null) {
		   
	       CustomerVO vo = new CustomerVO();
	     
	       vo.setCUSTOMER_ID(Integer.parseInt(sessionChk.toString()));

	       CustomerVO vo2 = mypageService.info(vo);
	      
	       model.addAttribute("vo2", vo2);

	       return "/mypage/02_info";
		   
	   }else {
		   return "/member/13_Login";
	   }
	   
    
   }
   
   @RequestMapping("02_edit")
   public String edit(CustomerVO vo, Model model, HttpSession session) {
	   
	   vo.setCUSTOMER_ID(((int) session.getAttribute("customer_id")));
	   CustomerVO vo2 = mypageService.edit(vo);

	   model.addAttribute("vo2", vo2);
	   
	   return "/mypage/02_info";
   }
   
   @RequestMapping("08_Payment.do")
   public String Payment(Model model , HttpSession session) {
	  		
	   Object sessionChk = session.getAttribute("customer_id");
	      
	   if(sessionChk != null) {
		   
		CustomerVO vo = new CustomerVO();
		vo.getCustomer_money();
		vo.setCUSTOMER_ID(((int) session.getAttribute("customer_id")));
		       
		CustomerVO vo3 = mypageService.Payment(vo);
		
		model.addAttribute("vo3", vo3);
        
	   return "/mypage/08_Payment";
	   
	   } else {
		   
		   return "/member/13_Login";
	   }
   }
   
   @RequestMapping("08_ChargeMoney")
   public String ChargeMoney(int chargeAmount, Model model,HttpSession session){
   
	   CustomerVO vo = new CustomerVO();
	   vo.setCustomer_money(chargeAmount);
	   vo.setCUSTOMER_ID(((int) session.getAttribute("customer_id")));
	   
	   CustomerVO vo3 = mypageService.ChargeMoney(vo);
	   
	   model.addAttribute("vo3",vo3);
	   
	   return "/mypage/08_Payment";
   }
   
   @RequestMapping("09_Orderdetails1.do")
   public String Orderdetails(Model model,HttpSession session) {
	   
	   Object sessionChk = session.getAttribute("customer_id");
	      
	   if(sessionChk != null) {
	   
	   DdipVO vo = new DdipVO();
	   vo.setCustomer_id(((int) session.getAttribute("customer_id")));
	   
	   List<DdipVO> OrderList = mypageService.getOrderList(vo);
	   
	   model.addAttribute("OrderList", OrderList);
	   
	  
	   return "/mypage/09_Orderdetails1";
	   
	   } else {
		   
		   return "/member/13_Login";
	   }
   }
   
   @RequestMapping("10_coupone.do")
   public String coupon(Model model, HttpSession session) {
	   
	   Object sessionChk = session.getAttribute("customer_id");
	      
	   if(sessionChk != null) {
		   
	   int userId = 3000;
	   CouponVO vo = new CouponVO();
	   vo.setCUSTOMER_ID(3000);
	   
	   List<CouponVO> CouponList = mypageService.getCouponList(vo);
	   
	   model.addAttribute("CouponList", CouponList);
	   
	   return "/mypage/10_coupone";
   
		} else {
			   
			   return "/member/13_Login";
		}
   }
   
     
}











