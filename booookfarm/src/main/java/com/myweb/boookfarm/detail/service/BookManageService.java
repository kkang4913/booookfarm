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
	
	public List<BookDetailDTO> getData() {
		List<BookDetailDTO> datas = dao.getData();
		return datas;
	}
}
