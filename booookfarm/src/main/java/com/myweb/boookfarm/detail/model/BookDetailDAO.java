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
	
	
	public List<BookDetailDTO> getData() {
		String mapperId = String.format(mapper, "selectData");
		List<BookDetailDTO> datas = session.selectList(mapperId);
		return datas;
	}

}
