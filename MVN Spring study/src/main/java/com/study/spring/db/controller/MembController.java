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
		
			List<Memb> membList = membService.membList();
			model.addAttribute("membList", membList);
		
		return "Emp/membList";
	}
	
}
/**
    No suitable driver Error 해결..
    어처구니 없게도 Driver를 
    "\tomcat-9.0.8\apache-tomcat-9.0.8\lib"에 넣어주면 해결됨...
 */
