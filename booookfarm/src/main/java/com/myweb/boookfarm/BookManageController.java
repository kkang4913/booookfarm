package com.myweb.boookfarm;

import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.boookfarm.detail.model.BookDetailDTO;
import com.myweb.boookfarm.detail.service.BookManageService;

@Controller
public class BookManageController {
	
	@Autowired
	private BookManageService service;
	
	@GetMapping(value="/detail", produces="application/json; charset=utf-8")
	public String detail_view(@RequestParam("bookcode") String bookCode, Model model) {
		model.addAttribute("book_code", bookCode);
		return "detail/detail";
	}
	
	@GetMapping(value = "/view",produces="application/json; charset=utf-8")
	@ResponseBody
	public String detail(@RequestParam("bookCode") String bookCode) {
		System.out.println("확인 :" + bookCode);
		BookDetailDTO data = service.getData();
		JSONObject json = new JSONObject();
			json.put("bookCode", data.getBookCode());
			json.put("bookTitle", data.getBookTitle());
			json.put("bookAuthor", data.getBookAuthor());
			json.put("bookInfo", data.getBookInfo());
			json.put("bookPrice", data.getBookPrice());
			json.put("bookDiscount", data.getBookDiscount());
			json.put("isbn", data.getIsbn());
			json.put("bookCategory", data.getBookCategory());
			json.put("stock", data.getStock());
			json.put("publisher", data.getPublisher());
			json.put("bookCondition", data.getBookCondition());
			json.put("bookConditionInfo", data.getBookConditionInfo());
			json.put("bookImgPath", data.getBookImgPath());
			json.put("createDate", data.getCreateDate());
		
		return json.toJSONString();
	}
	
	/*
	@GetMapping(value = "/view",produces="application/json; charset=utf-8")
	@ResponseBody
	public String detail(@RequestParam("bookCode") String bookCode) {
		System.out.println("확인 :" + bookCode);
		List<BookDetailDTO> data = service.getData();
		List<BookDetailDTO> dataList = service.getDatas();
		JSONArray data_arr = new JSONArray();
		JSONArray datalist_arr = new JSONArray();
		JSONObject rtn_data = new JSONObject();
		for(BookDetailDTO bookData : (List<BookDetailDTO>) data) {
			JSONObject json = new JSONObject();
			json.put("bookCode", bookData.getBookCode());
			json.put("bookTitle", bookData.getBookTitle());
			json.put("bookAuthor", bookData.getBookAuthor());
			json.put("bookInfo", bookData.getBookInfo());
			json.put("bookPrice", bookData.getBookPrice());
			json.put("bookDiscount", bookData.getBookDiscount());
			json.put("isbn", bookData.getIsbn());
			json.put("bookCategory", bookData.getBookCategory());
			json.put("stock", bookData.getStock());
			json.put("publisher", bookData.getPublisher());
			json.put("bookCondition", bookData.getBookCondition());
			json.put("bookConditionInfo", bookData.getBookConditionInfo());
			json.put("bookImgPath", bookData.getBookImgPath());
			json.put("createDate", bookData.getCreateDate());
			data_arr.add(json);
		}
		for(BookDetailDTO bookList : (List<BookDetailDTO>) dataList) {
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
			datalist_arr.add(json);
		}
		rtn_data.put("datas", data_arr);
		rtn_data.put("dataList", datalist_arr);
		return rtn_data.toJSONString();
	}
	*/
	
	@GetMapping(value = "/detailList",produces="application/json; charset=utf-8")
	@ResponseBody
	public String detail_list(@RequestParam("bookCode") String bookCode) {
		List<BookDetailDTO> dataList = service.getDatas();
		JSONArray data_arr = new JSONArray();
		JSONObject list_data = new JSONObject();
		for(BookDetailDTO bookList : (List<BookDetailDTO>) dataList) {
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
			data_arr.add(json);
		}
		
		list_data.put("dataList", data_arr);
		return list_data.toJSONString();
	}
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basketView(Locale locale, Model model) {
	
		return "basket/basket";
	}
	
	@PostMapping(value = "/basket/add",produces="application/json; charset=utf-8")
	public String basket_page () {
		return "";
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(Locale locale, Model model) {
	
		return "basket/payment";
	}
	
	@RequestMapping(value = "/locker", method = RequestMethod.GET)
	public String locker(Locale locale, Model model) {
	
		return "basket/locker";
	}
}
