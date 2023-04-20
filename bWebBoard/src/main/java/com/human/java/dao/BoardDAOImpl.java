package com.human.java.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.human.java.domain.BoardVO;
import com.human.java.service.BoardService;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO { 

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public String timeTest() {
		
		// DB연결 해야합니다. >> mybatis 이용해서 SQL문장과도 분리
		// 코드한줄 mybatis.메소드();
		// selectOne : 한줄조회하는 명령어
		// selectOne( mapper의 네임스페이스, 태그id)
		
//		String str = mybatis.selectOne("testMapper.getTime");
//		return str;
		
		return mybatis.selectOne("testMapper.getTime");
	}

	@Override
	public void insertBoard(BoardVO vo) {
		mybatis.insert("boardDAO.insertBoard",vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("boardDAO.deleteBoard",vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return mybatis.selectOne("boardDAO.getBoard",vo);
	}

	@Override
	public List<BoardVO> getBoardList(HashMap map) {
		// DAO에서 할 역할 : 글 목록을 조회하기 위해서는 DB를 접근해야합니다. > mybatis 객체를 통해서 DB에 쿼리 실행
		// 조회 기능 : DB에서 필요한 값 (파라미터, 인자) / DB에서 출력되는 값(return)
		System.out.println("==> DAO호출");
		System.out.println("==> 조건 : " + map.get("searchCondition"));
		System.out.println("==> 키워드 :" + map.get("searchKeyword"));
		
		// selectList( mapper의 네임스페이스.태그id , 전달할 값) >> DB결과를 리턴, List형태로
		return mybatis.selectList("boardDAO.getBoardList",map);
	}

}
