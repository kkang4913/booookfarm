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
import com.myweb.boookfarm.member.model.PagingDTO;
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
	public String bookList(@RequestParam(defaultValue = "1", required = false) int page //현재페이지
			,@RequestParam("page_count")int pagecount) {
		//등록된 모든 책 리스트
		Map res_data = service.getAll(page, pagecount);
		List datas = (List) res_data.get("datas"); // 가져온 데이터 리스트
		PagingDTO pager = (PagingDTO) res_data.get("page_data"); // 가져온 페이징 객체
		JSONArray data_arr = new JSONArray(); // 가져온 데이터 리스트를 넣는 배열
		JSONObject page_obj = new JSONObject(); // 가져온 페이징 데이터를 넣는 객체
		JSONObject rtn_data = new JSONObject(); // 결과값
		for (BookDTO bfarm : (List<BookDTO>) datas) {
			JSONObject json = new JSONObject();
			json.put("bookCode", bfarm.getBookCode());
			json.put("bookTitle", bfarm.getBookTitle());
			json.put("bookAuthor", bfarm.getBookAuthor());
			json.put("bookPrice", bfarm.getBookPrice());
			json.put("bookDiscount", bfarm.getBookDiscount());
			json.put("isbn", bfarm.getIsbn());
			json.put("bookCategory", bfarm.getBookCategory());
			json.put("publisher", bfarm.getPublisher());
			json.put("bookCondition", bfarm.getBookCondition());
			json.put("bookImgPath", bfarm.getBookImgPath());
			json.put("createDate", bfarm.getCreateDate());
			data_arr.add(json);
		}
		page_obj.put("c_page", pager.getCurrentPageNumber());
		page_obj.put("pagelist", pager.getPageList());
		page_obj.put("n_page", pager.getNextPageNumber());
		page_obj.put("p_page", pager.getPrevPageNumber());
		page_obj.put("is_npage", pager.isNextPage());
		page_obj.put("is_ppage", pager.isPrevPage());
		rtn_data.put("datas", data_arr);
		rtn_data.put("pager", page_obj);
		return rtn_data.toJSONString();
	}
}
