package com.myweb.boookfarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.boookfarm.model.BookDAO;
import com.myweb.boookfarm.model.BookDTO;

@Service
public class BookfarmService {
	
	@Autowired
	private BookDAO dao;

	public List<BookDTO> getData() {
		List<BookDTO> datas = dao.getData();
		return datas;
	}

	public int getDataCnt() {
		int datas = dao.getDataCnt();
		return datas;
	}
	
	
}
