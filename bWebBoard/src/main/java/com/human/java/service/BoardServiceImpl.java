package com.human.java.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.java.dao.BoardDAO;
import com.human.java.domain.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	 
	@Override
	public String timeTest() {
	 	// Service의 역할 : Controller와 DAO의 중간다리 역할
	 	// 1. 단순하게 이동
	 	// 2. Controller에서 넘겨준 데이터를 추가, 변경, 삭제하여 DAO에게 전달
	 	// 3. DAO 에서 넘겨준 데이터를 추가, 변경, 삭제하여 Controller에게 전달
	 	
	 	return boardDAO.timeTest();
	}
    
	@Override
	public void insertBoard(BoardVO vo) {
	 	boardDAO.insertBoard(vo); 	
	}
     
	@Override
	public void updateBoard(BoardVO vo) {
		
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(HashMap map) {
		
		// 서비스에서 할 역할 : 글 목록을 조회하기 위해서는 DB를 접근해야합니다. > boardDAO 와 연결 
		// 조회 기능 : DB에서 필요한 값 (파라미터, 인자) / DB에서 출력되는 값(return)
		return boardDAO.getBoardList(map);
	}

}







