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
    public String info(Model model) {
       System.out.println("02_info.do 호출 완료");
       
       System.out.println("데이터 필요 : id");
       // 가상으로 테스트
       
//       String userId = (String)session.getAttribute("CUSTOMER_LOGINID");
       String userId = "userid";
       CustomerVO vo = new CustomerVO();
       vo.setCUSTOMER_LOGINID(userId);

       CustomerVO vo2 = mypageService.info(vo);
       System.out.println(vo2);
       // 결과 변수 하나로 만드는거 : VO
       System.out.println("결과 데이터 출력 필요 : 이름, 이메일, 현재비밀번호, 주소, 상세주소");
       System.out.println(" 02_info.do : " + vo2.getCUSTOMER_LOGINID());
       System.out.println(" 02_info.do : " + vo2.getCUSTOMER_PASSWORD());
       System.out.println(" 02_info.do : " + vo2.getCUSTOMER_EMAIL());
       model.addAttribute("vo3", vo2);
       
       model.addAttribute("str", "안녕");
       
//       List<CustomerVO> cList = new ArrayList<CustomerVO>();
       
//       cList.add(vo2);
//       cList.add(vo2);
//       cList.add(vo2);
       
       
//       model.addAttribute("cList", cList);
       
       
       
       return "/mypage/02_info";
    }
   
   @RequestMapping("08_Payment.do")
   public String Payment() {
	   System.out.println("08_Payment.do 호출 완료");
	   System.out.println("충전할 금액: ");
	   
		
		CustomerVO vo = new CustomerVO();
		vo.getCustomer_money();
		 
       
		CustomerVO vo3 = mypageService.Payment(vo);
		System.out.println(vo3);
       
		/* model.addAttribute("chargeAmount", chargeAmount); */
	   
	   
	   return "/mypage/08_Payment";
   }
   
   @RequestMapping("08_ChargeMoney")
   public String ChargeMoney(int chargeAmount, Model model){
	   System.out.println(chargeAmount);
	   
	   CustomerVO vo = new CustomerVO();
	   vo.setCustomer_money(chargeAmount);
	   CustomerVO vo3 = mypageService.ChargeMoney(vo);
	   System.out.println(vo3);
	   
	   model.addAttribute(vo3);
	   
	   return "/mypage/08_Payment";
   }
   
   @RequestMapping("09_Orderdetails1.do")
   public String Orderdetails() {
	   System.out.println("09_Orderdetails1.do 호출 완료");
	   
	   
	   return "/mypage/09_Orderdetails1";
   }
}











