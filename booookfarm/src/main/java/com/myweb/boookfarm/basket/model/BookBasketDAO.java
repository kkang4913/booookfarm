package com.myweb.boookfarm.basket.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.boookfarm.detail.model.BookDetailDTO;

@Repository
public class BookBasketDAO {
	@Autowired
	private SqlSession session;
	
	private String mapper = "bookManageMapper.%s";
	//장바구니에 존재하는 책인지 확인
	public BookBasketDTO getBasketData(String bookCode) {
		String mapperId = String.format(mapper, "selectBasketData");
		BookBasketDTO basketData = session.selectOne(mapperId, bookCode);
		return basketData;
	}
	//장바구니에 존재하지 않는 책 추가 작업
	public boolean add_book_data(BookBasketDTO basket_add_data) {
		String mapperId = String.format(mapper, "insertBasketData");
		int add_book_data = session.insert(mapperId, basket_add_data);
		return add_book_data == 1 ? true : false;
	}
	//로그인한 아이디에 맞는 장바구니 리스트 정보 조회
	public List<BookDetailDTO> getBasketAllData(String memberId) {
		String mapperId = String.format(mapper, "selectAllBasketData");
		List<BookDetailDTO> basketAllData = session.selectList(mapperId, memberId);
		return basketAllData;
	}
}
