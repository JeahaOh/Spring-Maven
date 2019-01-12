package com.study.spring.db.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/db")
//	http://localhost:8888/spring/db
@Controller
public class DBController {
	
	private static final Logger logger = LoggerFactory.getLogger(DBController.class);
	
	@RequestMapping("/list")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		return "dbList";
	}
	
}
