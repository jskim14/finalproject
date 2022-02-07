package com.nb.spring.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.common.PageFactory;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productManage")
	public ModelAndView productManage(@RequestParam(name = "cPage",defaultValue = "1")int cPage,
			@RequestParam(value="numPerPage",defaultValue="5")int numPerPage,ModelAndView mv) {
		log.debug("{}",numPerPage);
		int pageBarSize = 3;
		int totalData = productService.selectWaitingCount();
		
		
		Map<String,Integer> param = Map.of("cPage",cPage,"numPerPage",numPerPage);
		
		List<Product> list = productService.selectWaitingPermission(param);
		
		mv.addObject("numPerPage",numPerPage);
		mv.addObject("waitList", list);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerPage, pageBarSize, "/admin/productManage"));
		mv.setViewName("admin/productManage");
	
		return mv;
	}
	
	@RequestMapping("/productConfirmDetail")
	public ModelAndView productConfirmDetail(String productNo,ModelAndView mv) {
		log.debug(productNo);
		Product product = productService.selectOneProductNo(productNo);
		log.debug("{}",product);
		mv.addObject("product", product);
		mv.setViewName("detail/productConfirmDetail");
		return mv;
	}
	
}
