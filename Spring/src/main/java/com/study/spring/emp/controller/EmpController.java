package com.study.spring.emp.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.study.spring.emp.service.EmpService;

@Controller
@RequestMapping("/emp")
public class EmpController {
    
  private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
  
  private EmpService empService;
  ServletContext sc;
  
  
  @RequestMapping("/list")
  public String hi() {
    //  http://localhost:8888/spring/emp/hi
    
    
    System.out.println("hi!");
    return "empList";
  }
  
  
  
  @RequestMapping("/empList")
  public ModelAndView empList(ModelAndView mv) {
    List<Map> empList = empService.empList();
    
    mv.addObject("empList", empList);
    mv.setViewName("emp/empList");
    
    return mv;
  }
}
