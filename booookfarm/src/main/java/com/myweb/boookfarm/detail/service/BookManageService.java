package com.myweb.boookfarm.detail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.boookfarm.detail.model.BookDetailDAO;
import com.myweb.boookfarm.detail.model.BookDetailDTO;

@Service
public class BookManageService {
	
	@Autowired
	private BookDetailDAO dao;
	
	public BookDetailDTO getData() {
		BookDetailDTO datas = dao.getData();
		return datas;
	}
	
	public List<BookDetailDTO> getDatas() {
		List<BookDetailDTO> data = dao.getDatas();
		return data;
	}
}
