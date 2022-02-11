package com.nb.spring.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.nb.spring.common.PageFactory;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;

@Controller
public class MainController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/")
	public ModelAndView mainView(ModelAndView mv) {
		int startNum = 0;
		int finishNum = 3;
		mv.addObject("deadLine", service.selectListDeadLine(startNum, finishNum));
		mv.addObject("latest", service.selectListLatest(startNum, finishNum));
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/enrollEmail")
	public String enrollEmailView() {
		return "login/enrollEmail";
	}
	
	@RequestMapping("/enrollMember")
	public String enrollMemberView() {
		return "login/enrollMember";
	}
	
	@RequestMapping("/findId")
	public String findIdView() {
		return "login/findId";
	}
	
	@RequestMapping("/findIdConfirm")
	public String findIdConfirmView() {
		return "login/findIdConfirm";
	}
	
	@RequestMapping("/findPassword")
	public String findPasswordView() {
		return "login/findPassword";
	}
		
	@RequestMapping("/report")
	public String reportListView() {
		return "report/reportList";
	}
	
	@RequestMapping("/chatting")
	public String openchat() {
		return "/report/chatting";
	}
	
	
	@RequestMapping("/addLatest")
	public void addLatest(int startNum, int finishNum, HttpServletResponse res) throws IOException {
		List<Product> list = service.selectListLatest(startNum,finishNum);
		res.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, res.getWriter());
	}
	
	@RequestMapping("/addDeatLine")
	public void addDeatLine(int startNum, int finishNum, HttpServletResponse res) throws IOException {
		List<Product> list = service.selectListDeadLine(startNum,finishNum);
		res.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, res.getWriter());
	}
	
	@PostMapping("/productSearch")
	public ModelAndView searchProduct(ModelAndView mv, String keyword,
			@RequestParam(value="cPage", defaultValue="1") int cPage
			,@RequestParam(value="numPerPage", defaultValue="4") int numPerPage) {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("cPage", cPage);
		param.put("numPerPage", numPerPage);
		param.put("keyword", keyword);
		List<Product> totalDataCount = service.searchProductCount(keyword);
		int totalData = totalDataCount.size();
		int pageBarSize = 5;
		System.out.println(service.searchProduct(param).size());
		System.out.println(totalData);
		mv.addObject("searchProduct", service.searchProduct(param));
		mv.addObject("keyword", keyword);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar", PageFactory.getPageBarSearch(totalData, cPage, numPerPage, pageBarSize, keyword, "/productSearch"));
		mv.setViewName("/product/searchProduct");
		return mv;
	}
	
	@PostMapping("/ajax/productSearch")
	public ModelAndView searchProductAjax(ModelAndView mv, String keyword,
			@RequestParam(value="cPage", defaultValue="1") int cPage
			,@RequestParam(value="numPerPage", defaultValue="4") int numPerPage) {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("cPage", cPage);
		param.put("numPerPage", numPerPage);
		param.put("keyword", keyword);
		List<Product> totalDataCount = service.searchProductCount(keyword);
		int totalData = totalDataCount.size();
		int pageBarSize = 5;
		System.out.println(cPage);
		mv.addObject("searchProduct", service.searchProduct(param));
		mv.addObject("keyword", keyword);
		mv.addObject("totalData", totalData);
		mv.addObject("pageBar", PageFactory.getPageBarSearch(totalData, cPage, numPerPage, pageBarSize, keyword, "/productSearch"));
		mv.setViewName("/product/searchProductPage");
		return mv;
	}
}

