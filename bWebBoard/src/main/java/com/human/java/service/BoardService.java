package com.human.java.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.human.java.domain.BoardVO;
	
public interface BoardService {
	
	// 구현툴, 정의서, 무조건 상속 받아서 구현할 코드를 작성해야 사용할 수 있는 정의서, 추상화
	
	// CRUD 기능 구현
	// 테스트용 함수
	String timeTest();
	
	// 글 등록
	void insertBoard(BoardVO vo);
	
	// 글 수정
	void updateBoard(BoardVO vo);
	
	// 글 삭제
	void deleteBoard(BoardVO vo);
	
	// 글 상세 조회
	BoardVO getBoard(BoardVO vo);
	
	// 글 목록 조회
//	List<BoardVO> getBoardList();
	
	List<BoardVO> getBoardList(HashMap map);
	
}	
