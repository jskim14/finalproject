package com.nb.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.member.model.service.MemberService;
import com.nb.spring.member.model.service.SendEmailService;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember"})
public class MemberController {
	
	@Autowired
	private MemberService service;      
	
	@Autowired
	private SendEmailService mailService;

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
	public ModelAndView salesStates(String memberNo, ModelAndView mv) { //string memberNo 를 받아서 프로덕트의 셀러와 연결해서 프로덕트를 받아와 그것을 jsp에 보내줌
		System.out.println(memberNo);
		List<Product> list = service.salesList(memberNo);
		
		mv.addObject("productList",list);
		mv.setViewName("product/salesStates");
		return mv;
	}
	
	@RequestMapping("/enrollMember")
	public String enrollmemberView() {
		return "login/enrollEmail";
	}
	
	@PostMapping("/email")
	@ResponseBody
	public Map sendEmail(HttpSession session, String userEmail) {
		log.debug(userEmail);
		String result="";
		String code="";
		session.removeAttribute("userEmail");
		try {
			code = mailService.mailSend(userEmail);			
		}catch(Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException();
		}
			
		if(code!=null&&code.length()>0) {
			result ="전송완료";
			session.setAttribute("emailCode", code);
			session.setAttribute("userEmail", userEmail);
		}else {
			result ="전송실패";
		}
		
		return Map.of("result",result);
	}
	
	@PostMapping("/certification")
	@ResponseBody
	public Map certification(String inputCode, HttpSession session) {
		
		String codeInSession = (String)session.getAttribute("emailCode");
		boolean result =false;
		if(codeInSession.equals(inputCode)) {
			// 같은 코드 
			result =true;
			session.removeAttribute("emailCode");
		}else {
			//실패 
			result =false;
		}
		
		
		return Map.of("result",result);
	}
	
	@RequestMapping("/enrollMemberMainView")
	public String enrollMemberMainView() {
		return "login/enrollMember";
	}
	
	@RequestMapping("/duplicationCheck")
	@ResponseBody
	public Map duplicationCheck(String nickName) {
		
		Member m  = service.selectMemberNickName(nickName);
		boolean result = false;
		if(m!=null) {
			result = false;
		}else {
			result =true;
		}
		return Map.of("result",result);
	}
	
	@PostMapping("/enrollMemberMain")
	public ModelAndView enrollMemberMain(@RequestParam Map<String, String> param,HttpSession session, ModelAndView mv) {
		log.debug("{}",param);
		String totalAddress = param.get("address")+" "+ param.get("detailAddress")+" "+param.get("plusAddress");
		String email = (String)session.getAttribute("userEmail");
		
		
		Member m = Member.builder()
				.memberName(param.get("name"))
				.password(param.get("password"))
				.phone(param.get("phone"))
				.email(email)
				.nickName(param.get("nickName"))
				.address(totalAddress)
				.deliveryAddress(totalAddress)
				.build();
		
		int result = service.insertMember(m);
		
		if(result > 0) {
			
			mv.addObject("msg","회원가입 성공");
			mv.addObject("loc","/");
		}else {
			mv.addObject("msg","회원가입 실패. 다시 시도해주세요.");
			mv.addObject("loc","/member/enrollMember");
		}
		mv.setViewName("common/msg");
		return mv;
	
	}
	
	@RequestMapping(value = "/salesSearch", method=RequestMethod.POST)
	public ModelAndView salesSearch (@RequestParam Map param, @RequestParam(value ="status", required = false ) String status, 
			ModelAndView mv) { //memberNo, 상태, 날짜
		System.out.println(param);
		//if 판매대기 ---> dao 가서 여기서 0또는 2인거만 가져오고??
		//else 나머지 
		if(status.contains("판매대기")) {
			List<Product> list = service.salesWaitSearch(param);
			mv.addObject("productList",list);
		} else {
			List<Product> list = service.salesSearch(param);
			mv.addObject("productList",list);
		}
		
		mv.setViewName("product/salesStates");
		return mv;
//		return "product/salesStates";
	}
	
	
}
