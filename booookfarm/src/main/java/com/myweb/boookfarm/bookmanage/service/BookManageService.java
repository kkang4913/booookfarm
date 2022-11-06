package com.myweb.boookfarm.bookmanage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.boookfarm.basket.model.BookBasketDAO;
import com.myweb.boookfarm.basket.model.BookBasketDTO;
import com.myweb.boookfarm.detail.model.BookDetailDAO;
import com.myweb.boookfarm.detail.model.BookDetailDTO;

@Service
public class BookManageService {
	
	@Autowired
	private BookDetailDAO dao;
	
	@Autowired
	private BookBasketDAO basketDao;
	
	// bookTable 관련
	public BookDetailDTO getData() {
		BookDetailDTO data = dao.getData();
		return data;
	}
	
	public List<BookDetailDTO> getDatas() {
		List<BookDetailDTO> datas = dao.getDatas();
		return datas;
	}
	// basketTable 관련
	public BookBasketDTO getBasketData(String bookCode) {
		BookBasketDTO basketData = basketDao.getBasketData(bookCode);
		return basketData;
	}

	public boolean add_book_data(BookBasketDTO basket_add_data) {
		boolean detail_book_data = basketDao.add_book_data(basket_add_data);
		return detail_book_data;
	}

	public List<BookDetailDTO> getBasketAllData(String memberId) {
		List<BookDetailDTO> BasketAllData = basketDao.getBasketAllData(memberId);
		System.out.println("확인"+BasketAllData);
		return BasketAllData;
	}
}
