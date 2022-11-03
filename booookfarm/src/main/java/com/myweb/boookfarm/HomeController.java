package com.myweb.boookfarm;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.boookfarm.detail.model.BookDetailDTO;
import com.myweb.boookfarm.model.BookDTO;
import com.myweb.boookfarm.service.BookfarmService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class HomeController {
	
	@Autowired
	private BookfarmService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "standard/standard";
	}

	@GetMapping(value = "/list",produces="application/json; charset=utf-8")
	@ResponseBody
	public String bookList() {
		//등록된 모든 책 리스트
		List<BookDTO> datas = service.getData();
		int pageCnt = service.getDataCnt();
		
		JSONArray data_arr = new JSONArray();
		JSONObject rtn_data = new JSONObject();
		JSONObject page_arr = new JSONObject();
		for(BookDTO bookList : (List<BookDTO>) datas) {
			JSONObject json = new JSONObject();
			json.put("bookCode", bookList.getBookCode());
			json.put("bookTitle", bookList.getBookTitle());
			json.put("bookAuthor", bookList.getBookAuthor());
			json.put("bookInfo", bookList.getBookInfo());
			json.put("bookPrice", bookList.getBookPrice());
			json.put("bookDiscount", bookList.getBookDiscount());
			json.put("isbn", bookList.getIsbn());
			json.put("bookCategory", bookList.getBookCategory());
			json.put("stock", bookList.getStock());
			json.put("publisher", bookList.getPublisher());
			json.put("bookCondition", bookList.getBookCondition());
			json.put("bookConditionInfo", bookList.getBookConditionInfo());
			json.put("bookImgPath", bookList.getBookImgPath());
			json.put("createDate", bookList.getCreateDate());
			data_arr.add(json);
		}
		page_arr.put("Cnt", pageCnt);
		rtn_data.put("datas", data_arr);
		rtn_data.put("pages", page_arr);
		return rtn_data.toJSONString();
	}
}
