package com.study.spring.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.study.spring.db.domain.Memb;
import com.study.spring.db.service.MembService;

@Controller
@RequestMapping("/memb")
public class MembController {
	
	@Autowired MembService membService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		try {
			List<Memb> membList = membService.membList();
			model.addAttribute("membList", membList);
		}	catch (Exception e) {
			e.printStackTrace();
		}
		
		return "dbList";
	}
	
}
