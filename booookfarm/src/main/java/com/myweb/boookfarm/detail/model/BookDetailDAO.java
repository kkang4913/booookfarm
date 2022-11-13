package com.myweb.boookfarm.detail.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.boookfarm.basket.model.BookBasketDTO;

@Repository
public class BookDetailDAO {
	@Autowired
	private SqlSession session;
	
	private String mapper = "bookManageMapper.%s";
	
	
	public BookDetailDTO getData(String bookCode) {
		String mapperId = String.format(mapper, "selectData");
		BookDetailDTO data = session.selectOne(mapperId, bookCode);
		return data;
	}
	
	public List<BookDetailDTO> getDatas(){
		String mapperId = String.format(mapper, "selectSort");
		List<BookDetailDTO> datas = session.selectList(mapperId);
		return datas;
	}

}
