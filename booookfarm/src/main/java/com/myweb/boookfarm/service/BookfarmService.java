package com.myweb.boookfarm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myweb.boookfarm.member.model.PagingDTO;
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


	public Map<String,Object> getAll(int page, int limit) {
		int countPage = 5;
		int num_start = ((page-1) * limit) + 1;
		int num_end   = (page * limit);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("num_start", num_start);
		map.put("num_end", num_end);
		List<BookDTO> datas = dao.selectAll(map);
		int total = dao.getDataCnt(map);
		PagingDTO pager = new PagingDTO(total, page, limit);
		Map res_data = new HashMap<String, Object>();
		res_data.put("datas", datas);
		res_data.put("page_data", pager);
		return res_data;
	}
	
	
}
