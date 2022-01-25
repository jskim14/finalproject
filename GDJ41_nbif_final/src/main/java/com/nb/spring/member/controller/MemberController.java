package com.nb.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.member.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;

	@PostMapping("/loginMember")
	public ModelAndView loginMember(ModelAndView mv, String email, String password) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("email", email);
		param.put("password", password);
		System.out.println(param.get("email") + param.get("password"));
		return mv;
	}
	
	@RequestMapping("/myPage")
	public String myPage() {
		return "login/myPage";
	}
}
