package com.myweb.boookfarm.model;


import java.util.ArrayList;
import java.util.HashMap;
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

	public BookDTO getData(String BCode) {
		String mapperId = String.format(mapper, "selectData");
		BookDTO datas = session.selectOne(mapperId,BCode);
		return datas;
	}

	public int getDataCnt(Map<String, Object> map) {
		String mapperId = String.format(mapper, "selectCnt");
		int datas = session.selectOne(mapperId,map);
		return datas;
	}

	public List<BookDTO> selectAll(Map<String, Object> map) {
		String mapperId = String.format(mapper, "selectAll");
		List<BookDTO> datas = session.selectList(mapperId, map); 
		return datas;
	}

	public String selectBookBasketList(List<String> bookCode, String memberId) {
		
		
		 String result = "";
		 
		  String mapperId = String.format(mapper, "selectBookList"); String mapperId1 =
		  String.format(mapper, "insertBook");
		  
		  for(String m : bookCode) {
		  
		  Map<String, Object> map = new HashMap<String, Object>();
		  
		  map.put("memberId", memberId); map.put("bookCode", m);
		  
		 String param = session.selectOne(mapperId, map);
		  
		  if(param == null) { session.insert(mapperId1, map); result = "true"; }else {
		  result = "false"; } }
	
		return "true";

	}

}
