package com.myweb.boookfarm;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "standard/standard";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Locale locale, Model model) {
	
		return "detail/detail";
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
