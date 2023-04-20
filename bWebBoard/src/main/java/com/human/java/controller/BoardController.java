package com.human.java.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.human.java.domain.BoardVO;
import com.human.java.service.BoardService;

@Controller
public class BoardController {

	// 빈에서부터 BoardService라는 빈 객체를 생성해서 주입해라
	@Autowired
	private BoardService boardService;

	@RequestMapping("test.do")
	public String test() {

		// 메소드가 실행이 되면 어떠한 작업을 할것인지 코딩
		// DB와 관련된 작업을 하거나
		// 자바에서만 관련된 작업을 하거나
		// 아무 작업 없이 지나가거나

		System.out.println("=============");
		System.out.println("====테스트====");
		System.out.println("=============");

		// DB연결 > mybatis와 @Component (Service / Repository)
		// 1. 빈컨테이너 생성 > 자동으로 생성 > servlet-context.xml >
		// servlet-context.xml에서 component-scan을 실행했기 때문에 그 상황에 맞춰서 파일을 구성

		// Controller의 역할 : 사용자의 요청에 따라 맵핑된 메소드를 실행하고 (@RequestMapping)
		// 사용자에게 응답할 페이지의 정보를 보여주는 것 (return "페이지명")
		// 이외의 작업은 다른 자바 파일에게 전달 > service 라는 클래스 파일이 하겠다.
		// test() 메소드에서 Service 클래스를 호출하려면 객체가 필요합니다.
		// 이전에는 new를 통해서 객체를 생성했습니다. > Spring에서는 빈 + 빈컨테이너를 활용
		// 빈 + 빈컨테이너를 활용하여 미리 만들어 놓은 객체를 호출하여 사용하는 방식 : Autowired, comppnent-scan

		// 테스트용도의 작업
		System.out.println(boardService.timeTest());

		// /WEB-INF/views/test.jsp 파일로 사용자에게 응답
		return "test"; // viewresolver을 통해서 이 메소드가 맵핑된 메소드가 종료할때 사용자에게 보여줄 화면페이지 파일
	}

	@RequestMapping("getBoardList.do")
	public String getBoardList(Model model, String searchCondition, String searchKeyword) {

		System.out.println("===========================");
		System.out.println("====getBoardList.do 진입====");
		System.out.println("===========================");
		
		System.out.println("조건 : " + searchCondition);
		System.out.println("키워드 : " + searchKeyword);
		
		// >> mybatis는 하나의 자료형만 입력가능하기 때문에 여러개의 값을 가진 형태(배열)로 변경
		HashMap map = new HashMap();
		map.put("searchCondition",searchCondition);
		map.put("searchKeyword",searchKeyword);
		
		// 컨트롤러에서 할 역할 : 글 목록을 조회하기 위해서는 DB를 접근해야합니다.
		// 조회 기능 : DB에서 필요한 값 (파라미터, 인자) / DB에서 출력되는 값(return)
		List<BoardVO> bList = boardService.getBoardList(map);

//		for (BoardVO v : bList) {
//			System.out.println(v);
//		}

		// 데이터를 화면(jsp)에 전달 : model 객체를 이용 > 파라미터에 작성
		// addAttribute("화면에서 사용할 변수명", 저장할 값);
		model.addAttribute("boardList", bList);

		// viewresolver을 통해서 이 메소드가 맵핑된 메소드가 종료할때 사용자에게 보여줄 화면페이지 파일
		// /WEB-INF/views/ + 파일명 + .jsp의 파일을 응답용 페이지로 호출
		return "getBoardList";
	}

	@RequestMapping("insertBoard.do")
	public String insertBoard() {
		// 목록 > 글쓰기 버튼 클릭 > 글등록 페이지 응답
		// 컨트롤러에서 할 역할 : 단순하게 페이지 이동만
		// 목록 > 버튼 클릭 > 페이지 요청
		// 요청할때 사용자가 입력한 값도 없고, db를 접근할 이유도 없으니 단순 이동(페이지 호출)
		return "insertBoard";
	}
		
	@RequestMapping("saveBoard.do")
	public String saveBoard(BoardVO vo) { // BoardVO : 액션태그처럼 VO와 name속성명이 같으면 자동으로 입력
		// 컨트롤러에서 할 역할 : 사용자가 입력한 값을 DB에 저장을 해야합니다.
		// 사용자가 입력한 값은 메소드의 파라미터로 전달 >> DB로 전달
		
		// 파라미터에 title writer content를 쓰지 않고
		// 아래 코드도 없이 파라미터에 vo를 써서 입력 가능
//		BoardVO vo = new BoardVO();
//		vo.setTitle(title);
//		vo.setWriter(writer);
//		vo.setContent(content);
		
		System.out.println(">제목  : " + vo.getTitle());
		System.out.println(">작성  : " + vo.getWriter());
		System.out.println(">내용  : " + vo.getContent());
		
		// boardService를 호출
		boardService.insertBoard(vo);
		
		// 저장을 한 뒤 보여줄 페이지 > 목록페이지
//		return "getBoardList"; // 단순하게 페이지를 보여주기 한 것 우리는 데이터 베이스 갔다가 온 것을 원함
		
		return "redirect:/getBoardList.do"; // 컨트롤러 내에 있는 맵핑된 메소드를 직접 호출
	}	
	
	// saveBoard 와 getBoardList 를 만들었던 과정을 잘 협쳐주면 완성
//	@RequestMapping("getBoard.do")
//	public String getBoard(BoardVO vo, Model model) {
//		
//		// 데이터베이스에 가서 데이터를 가져와야합니다.
//		// 게시글 번호를 가지고 데이터를 조회해서 화면(view)전달
//		// 게시글 번호를 가지고 : saveBoard 만들때
//		// >>> 가지고 가는 방법 : 파라미터와 인자
//		// 데이터를 조회해서 화면(view) 전달 : getBoardList 만들때
//		// >>> 조회해서 화면 전달 : return, Model객체
//		BoardVO vo2 = boardService.getBoard(vo);	
//		model.addAttribute("board", vo2);
//		return "getBoard";
//		
//	}
	// 위에 코드 줄인거 깰끔
	@RequestMapping("getBoard.do")
	public void getBoard(BoardVO vo, Model model) {
		
		model.addAttribute("board", boardService.getBoard(vo));	
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		
		boardService.deleteBoard(vo);
		// redirect:/ 를 사용하면 컨트롤 내에 있는 맵핑된 메소드를 즉시 호출하는 키워드
		return "redirect:/getBoardList.do";
	}
}	












