package com.myweb.boookfarm;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.json.JSONObject;
import org.json.simple.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.boookfarm.basket.model.BookBasketDTO;
import com.myweb.boookfarm.bookmanage.service.BookManageService;
import com.myweb.boookfarm.detail.model.BookDetailDTO;

@Controller
public class BookManageController {
	
	@Autowired
	private BookManageService service;
	
	@GetMapping(value="/detail", produces="application/json; charset=utf-8")
	public String detail_view(@RequestParam("bookcode") String bookCode, Model model) {
		model.addAttribute("book_code", bookCode);
		BookDetailDTO data = service.getData();
		model.addAttribute("book_info", data);
		return "detail/detail";
	}
	
	@GetMapping(value = "/view",produces="application/json; charset=utf-8")
	@ResponseBody
	public String detail(@RequestParam("bookCode") String bookCode) {
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
		
		return json.toString();
	}
	
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
		return list_data.toString();
	}
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basketView(Locale locale, Model model) {
	
		return "basket/basket";
	}
	
	@PostMapping(value = "/basket_info",produces="application/json; charset=utf-8")
	@ResponseBody
	public String basket_add_list (@RequestBody BookDetailDTO parm) throws Exception {
		JSONObject json = new JSONObject();
		BookBasketDTO bookBasketData = service.getBasketData(parm.getBookCode()); //북코드로 책정보가 장바구니에 존재하는지 확인
		BookBasketDTO basket_add_data = new BookBasketDTO();
		basket_add_data.setMemberId("user01"); // 로그인 데이타에서 받아와야함
		basket_add_data.setBookCode(parm.getBookCode());
		basket_add_data.setQuantity(parm.getStock()); 
		basket_add_data.setDeliveryFee(3000); // 배달비는 3천원 고정 산간지역은 추후 추가
		if(bookBasketData == null) {//장바구니에 존재하지 않는 책정보면 INSERT작업
			boolean detail_book_data = service.add_book_data(basket_add_data);
			json.put("code", "success");
			return json.toString();
		}else {
			json.put("code", "fail");
			return json.toString();
		}
	}
	
	@GetMapping(value = "/basket_info",produces="application/json; charset=utf-8")
	@ResponseBody
	public String basket_select_list()  {
		List<BookDetailDTO> Basket_all_book_Data = service.getBasketAllData("user01");// 로그인 아이디에 맞는 모든 장바구니 리스트
		JSONArray data_arr = new JSONArray();
		JSONObject list_data = new JSONObject();
		for(BookDetailDTO bookList : (List<BookDetailDTO>) Basket_all_book_Data) {
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
		
		
		return list_data.toString();
	}
	@RequestMapping(value = "/locker", method = RequestMethod.GET)
	public String locker(Locale locale, Model model) {
		
		return "basket/locker";
	}

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(Locale locale, Model model) {
	
		return "basket/payment";
	}
	
}
