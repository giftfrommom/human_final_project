package com.human.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.domain.CustomerVO;
import com.human.java.service.DdipService;
import com.human.java.service.MypageService;

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
	 
	
	@RequestMapping("02_info.do")
    public String info(Model model) {
       System.out.println("02_info.do 호출 완료");

       System.out.println("데이터 필요 : id");
       // 가상으로 테스트
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
       
       
       return "/mypage/02_info";
    }

}












