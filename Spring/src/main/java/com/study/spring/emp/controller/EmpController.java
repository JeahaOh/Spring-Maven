package com.study.spring.emp.controller;

import java.util.List;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.study.spring.emp.service.EmpService;

@Controller
@RequestMapping(value = "/emp", method = RequestMethod.GET)
public class EmpController {
    
  private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
  
  @Autowired
  private EmpService empService;
  ServletContext sc;
  
  
  @RequestMapping("/list")
  public String hi() {
    //  http://localhost:8888/spring/emp/list
    
    /**5가지 원인이 있는것 같다.
    1. Mapper Interface와 mapping되는 xml파일에 오타가 있는 경우 : 예를 들면 id와
      2. Interface에 메소드명이 일치하지 않는 경우
    3. classpath에 경로가 잘못된 경우
    4. xml이 저장될 경로는 잘못 생성한 경우
    5. mapper에서 namespace를 잘못 지정해준 경우
     */
    
    try {
      empService.empList();
    }   catch (Exception e ) {
      e.printStackTrace();
    }
    System.out.println("hi!");
    return "empList";
  }
  

  @RequestMapping("/empList")
  public ModelAndView empList(ModelAndView mv) {
    List<Object> empList = empService.empList();
    
    mv.addObject("empList", empList);
    mv.setViewName("emp/empList");
    
    return mv;
  }
}
//  참고? https://offbyone.tistory.com/18