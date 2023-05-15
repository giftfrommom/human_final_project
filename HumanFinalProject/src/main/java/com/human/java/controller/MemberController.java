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
	System.out.println("## user memberController 진입 ## " + url);
	 
		
	return "/member/" + url; // 응답할 파일이 있다면 정상 / 없다면 비정상
	}
	
	@RequestMapping("/userInsert.do")
	public String userInsert(CustomerVO vo,Model model) {
		System.out.println("## user userInsert 진입 ## " );
		System.out.println("vo1 : "+vo);
		int result = memberService.userInsert(vo);
		System.out.println("결과" + result );
	
		
		return "/member/13_Login"; 
	}
	@RequestMapping("/login.do")
	public String login(CustomerVO vo, HttpSession session) {
		System.out.println("## 로그인 진입 ## " );
		System.out.println("vo1 : "+vo.getCUSTOMER_LOGINID());
		System.out.println("vo1 : "+vo.getCUSTOMER_PASSWORD());
		CustomerVO result = memberService.Login(vo);
		
		System.out.println("결과" + result );
		
		if(result == null) {
			
			return "redirect:/member/13_Login.do";
		}else {
			System.out.println("[" +result.getCUSTOMER_LOGINID()+"] 님 로그인 성공");
			
			
			
			return "redirect:/mypage/01_Main.do"; 
		}
		
	}
	 
//	public String getCustomerList(CustomerVO model) {
//		System.out.println("## getCustomerList.do 진입 ##");
//		// 세션의 놀라운 점
////		System.out.println("session ID :"+session.getAttribute("userName"));
//		
//		List<BoardVO> bList = memberService.getBoardList();
////		
//		model.addAttribute("boardList",bList);
////		
//		return "/board/getBoardList";
//		
//	}
	// ajax테스트로 jsp가 아닌 controller을 사용할때
		// produces : 메소드가 끝나면 return 되는 데이터의 형태를 정의
		@RequestMapping(value="idCheck.do", produces = "application/text; charset=utf8")
		@ResponseBody		// 화면전환이 되지않고 비동기통신이 가능하도록 만들어주는 어노테이션. ajax 랑 같이쓰는
		public String idCheck(CustomerVO vo) {
			
			System.out.println("=====ID중복체크====");
			System.out.println(vo.getCUSTOMER_LOGINID());
//			System.out.println(userId);
			
			
			// 아이디가 있냐 없냐 조회
			// id조회할때 쿼리
			// SELECT * FROM member WHERE userid = ?;
			// 로그인조회할때 쿼리
			// SELECT * FROM member WHERE userid = ? AND userpass = ?;
			CustomerVO resultVO = memberService.idCheck_Login(vo);
			
			String result ="ID가 사용가능합니다.";	
			if(resultVO != null) result = "중복된 ID입니다.";
					
			
			
			// controller 상의 return 기능 : 응답할때 보여줄 페이지 이름
			// @ResponseBody 때문에 return 의 의미가 변경
			// >> 요청에 의해서 응답할 값을 전달하는 기능 , out.print()의 기능
			return result;
			
		}
	
		// ajax테스트로 jsp가 아닌 controller을 사용할때
		// produces : 메소드가 끝나면 return 되는 데이터의 형태를 정의
		@RequestMapping(value="emailCheck.do", produces = "application/text; charset=utf8")
		@ResponseBody		// 화면전환이 되지않고 비동기통신이 가능하도록 만들어주는 어노테이션. ajax 랑 같이쓰는
		public String emailCheck(CustomerVO vo) {
			
			System.out.println("=====email중복체크====");
			System.out.println(vo.getCUSTOMER_EMAIL());
//			System.out.println(userId);
			
			
			// 아이디가 있냐 없냐 조회
			// id조회할때 쿼리
			// SELECT * FROM member WHERE userid = ?;
			// 로그인조회할때 쿼리
			// SELECT * FROM member WHERE userid = ? AND userpass = ?;
			CustomerVO resultVO = memberService.emailCheck_Login(vo);
			
			String result ="email 사용가능합니다.";	
			if(resultVO != null) result = "중복된 email입니다.";
			
			
			
			// controller 상의 return 기능 : 응답할때 보여줄 페이지 이름
			// @ResponseBody 때문에 return 의 의미가 변경
			// >> 요청에 의해서 응답할 값을 전달하는 기능 , out.print()의 기능
			return result;
			
		}
	
		
		// mapping 5개를 만들어줘야합니다.
		   @RequestMapping("01_Main.do")   // 요청한 주소이름 1.do >> return 1 가 아닙니다
		   public String test() { // 파라미터 를통해서 요청시에 값을 가져오기
		      System.out.println("01_Main.do 호출 완료 ");
		      System.out.println("데이터 필요 : 이름, 이메일 등등..");
		      System.out.println("결과 데이터 출력 필요 : ");
		      // 나만의 코딩 , 기능 
		      // 기능 : 필요한 데이터 > 파라미터로 가져오기, 화면에서 가져오기 > service + dao + db
		      // 결과  : 화면에 공유할 결과, 데이터 , model, session 응답 객체
		      return "/mypage/02_info"; // 요청 에 대한 응답 >> 보여줄 파일 경로
		      
		                     //
		   }
}














