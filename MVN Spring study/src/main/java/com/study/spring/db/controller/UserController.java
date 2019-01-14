package com.study.spring.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.study.spring.db.domain.User;
import com.study.spring.db.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
      
      @Autowired UserService userService;
      
      @RequestMapping(value = "/manage", method = RequestMethod.GET)
      public String list(Model model) {
          return "user";
      }
      
      @RequestMapping(value = "/login", method = RequestMethod.POST)
      public Boolean login(String userId, String userPwd, Model model) {
        
        System.out.println(userId + ", " + userPwd);
        try {
          User user = userService.login(userId, userPwd);
          
          if(user == null) {
//            model.addAttribute("errMsg", "확인할 수 없는 계정입니다. 다시 시도해 주세요.");
            return false;
          }
        } catch (Exception e) {
          e.printStackTrace();
        }
        return true;
      }
}
