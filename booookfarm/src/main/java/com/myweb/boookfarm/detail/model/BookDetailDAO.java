package com.myweb.boookfarm.detail.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BookDetailDAO {
	@Autowired
	private SqlSession session;
	
	private String mapper = "bookManageMapper.%s";
	
	
	public BookDetailDTO getData() {
		String mapperId = String.format(mapper, "selectData");
		BookDetailDTO datas = session.selectOne(mapperId);
		return datas;
	}
	
	public List<BookDetailDTO> getDatas(){
		String mapperId = String.format(mapper, "selectSort");
		List<BookDetailDTO> data = session.selectList(mapperId);
		return data;
	}

}
