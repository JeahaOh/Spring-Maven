package com.study.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.study.spring.my.service.MyService;

@Controller
@RequestMapping("/my")
public class MyController {
    
  private static final Logger logger = LoggerFactory.getLogger(MyController.class);
  
  private MyService myService;
  ServletContext sc;
  
  @RequestMapping("/list")
  public ModelAndView myList(ModelAndView mv) {
    List<Map> myList = myService.myList();
    
    mv.addObject("myList", myList);
    mv.setViewName("my/myList");
    
    return mv;
  }
}
//  참고? https://offbyone.tistory.com/18