package com.study.spring.db.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.study.spring.db.domain.Code;
import com.study.spring.db.service.CodeService;

@Controller
@RequestMapping("/code")
public class CodeController {
  
  private static final Logger logger = LoggerFactory.getLogger(CodeController.class);

  @Autowired CodeService codeService;

  @RequestMapping(value="/manage", method = RequestMethod.GET)
  public String list(HttpSession session, Model model) {
    logger.debug("/code/manage -->", session);
    
    model.addAttribute("codeList", codeService.showAll());
    return "codeManage";
  }
  
  @PostMapping("/add")
  public String add() {
    
    return "redirect:/spring/code/manage";
  }
  
  @PostMapping("/update")
  public String update(
      HttpServletRequest req
      //String CDNO, int CDLVL, String UPCD, String CDNAME, String USEYN
      ) {
   // System.out.println(CDNO + "\n" + CDLVL + "\n" +  UPCD + "\n" + CDNAME + "\n" + USEYN);
    System.out.println(req.toString());
    logger.debug("/code/update -->", req);
    
    Code code = new Code();
//    code.setCDNO(CDNO);
//    code.setCDLVL(CDLVL);
//    code.setUPCD(UPCD);
//    code.setCDNAME(CDNAME);
//    code.setUSEYN(USEYN);
    
    System.out.println(code);
    /*
    if(!codeService.update(code)) {
      return "redirect:/spring/err/codeErr";
    }
    */
    return "redirect:/code/manage";
  }
}
