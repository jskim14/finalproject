package com.nb.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.member.model.service.MemberService;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.vo.Product;

@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

	@PostMapping("/loginMember")
	public ModelAndView loginMember(ModelAndView mv, String email, String password) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("email", email);
		param.put("password", password);
		Member m = service.loginMember(param);
		if(m!=null) {
			mv.addObject("loginMember", m);
			mv.addObject("msg","로그인 성공");
			mv.addObject("loc","/");
		}else {
			mv.addObject("msg","로그인 실패, 다시 시도하세요.");
			mv.addObject("loc","/login");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, SessionStatus stauts, ModelAndView mv) {
		if(!stauts.isComplete()) {
			stauts.setComplete();
		}
		session.invalidate();
		String msg = "로그아웃 완료";
		String loc = "/";
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/myPage")
	public ModelAndView myPage(String memberNo, ModelAndView mv) {
		Member m = service.selectMember(memberNo);
		mv.addObject("myPageMember",m);
		mv.setViewName("login/myPage");
		return mv;
	}
	
	@RequestMapping("/salesStates")
	public ModelAndView salesStates(String memberNum, ModelAndView mv) { //string memberNo 를 받아서 프로덕트의 셀러와 연결해서 프로덕트를 받아와 그것을 jsp에 보내줌
		System.out.println(memberNum);
		List<Product> pl = service.salesList(memberNum);
		
		mv.addObject("productList",pl);
		mv.setViewName("product/salesStates");
		return mv;
	}
}
