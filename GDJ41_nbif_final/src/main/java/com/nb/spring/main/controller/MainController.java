package com.nb.spring.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
	
	@RequestMapping("/cs/notice")
	public String csView() {
		return "/cs/customerservice";
	}
	
	@RequestMapping("/addLatest")
	public void addLatest(int startNum, int finishNum, HttpServletResponse res) throws IOException {
		List<Product> list = service.selectListLatest(startNum,finishNum);
		res.setContentType("application/json; charset=utf-8");
		new Gson().toJson(list, res.getWriter());
	}
}
