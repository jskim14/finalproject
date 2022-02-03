package com.nb.spring.main.controller;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public ModelAndView mainView(ModelAndView mv) {
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
	public String cs() {
		return "/customer/notice";
	}
}
