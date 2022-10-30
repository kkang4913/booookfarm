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
	public String detail_test(Model model) {
		List<BookDetailDTO> datas = service.getData();
		String book__code="";
		for(BookDetailDTO t_data : datas) {
			book__code=t_data.getBookCode();
		}
		model.addAttribute("book__code",book__code);
		return "detail/detail";
	}
	
	@GetMapping(value = "/detail/{bookCode}",produces="application/json; charset=utf-8")
	@ResponseBody
	public String detail(@PathVariable("bookCode") String bookCode) {
		System.out.println("확인 :" + bookCode);
		List<BookDetailDTO> datas = service.getData();
		JSONArray data_arr = new JSONArray();
		JSONObject rtn_data = new JSONObject();
		for(BookDetailDTO bookData : (List<BookDetailDTO>) datas) {
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
		rtn_data.put("datas", data_arr);
		return rtn_data.toJSONString();
	}
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basket(Locale locale, Model model) {
	
		return "basket/basket";
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
