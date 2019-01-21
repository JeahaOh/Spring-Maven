package com.study.spring.db.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.study.spring.db.domain.Code;
import com.study.spring.db.domain.Item;
import com.study.spring.db.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
  
  private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

  @Autowired ItemService itemService;

  @RequestMapping(value="/manage", method = RequestMethod.GET)
  public String list(HttpSession session, Model model) {
    logger.debug("/itme/manage -->", session);
    
    model.addAttribute("catagoList", itemService.getCatagoList());
    return "itemManage";
  }
  
  @PostMapping("/detailList")
  public @ResponseBody List<Code> add(
      HttpServletRequest req,
      @RequestParam(value="cdno", required=true) String cdno) {
    logger.debug("/code/detailList -->", req);
    
    return itemService.getDetailList(cdno);
  }
  
  @PostMapping("/searchItems")
  public @ResponseBody List<Item> searchItems (
      HttpServletRequest req,
      @RequestParam(value="cdno", required=true) String cdno){
    logger.debug("\n/code/searchList -->", req);
    System.out.println("Controller Recieve : \n\t" + cdno);
    
    return itemService.getSearchItems(cdno);
  }
}
