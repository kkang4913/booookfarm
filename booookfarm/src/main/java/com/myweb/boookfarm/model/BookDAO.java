package com.myweb.boookfarm.model;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class BookDAO {
	
	@Autowired
	private SqlSession session;
	
	private String mapper = "bookTestMapper.%s";

	public List<BookDTO> getData() {
		String mapperId = String.format(mapper, "selectAll");
		List<BookDTO> datas = session.selectList(mapperId);
		return datas;
	}

	public int getDataCnt() {
		String mapperId = String.format(mapper, "selectCnt");
		int datas = session.selectOne(mapperId);
		return datas;
	}



}
