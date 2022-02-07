package com.nb.spring.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.nb.spring.member.model.vo.Wallet;
import com.nb.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes({"loginMember","admin"})
public class MemberController {
	
	
	
	@Autowired
	private MemberService service;      
	
	@Autowired
	private SendEmailService mailService;
	
	@Autowired
	private PasswordEncoder encoder;

	@PostMapping("/loginMember")
	public ModelAndView loginMember(ModelAndView mv, String email, String password, String flexCheckDefault, 
			HttpServletResponse res) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("email", email);
		//param.put("password", password);
		Member m = service.loginMember(param);

		if(flexCheckDefault!=null) {
			Cookie c = new Cookie("flexCheckDefault",email);
			c.setPath("/");
			c.setMaxAge(24*60*60*7);
			res.addCookie(c);
		}else {
			Cookie c = new Cookie("flexCheckDefault",email);
			c.setPath("/");
			c.setMaxAge(0);
			res.addCookie(c);
		}
		if(m!=null&&encoder.matches(password, m.getPassword())) {

			if(m.getNickName().equals("admin")) {
				mv.addObject("admin",true);
			}else {
				mv.addObject("admin",false);
			}
			
			mv.addObject("loginMember", m);
			mv.addObject("msg","로그인 성공");
			mv.addObject("loc","/");
		}else {
			mv.addObject("msg","로그인 실패, 다시 시도하세요.");
			mv.addObject("loc","/member/login");
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
		
		List<Product> list = service.salesList(memberNo);
		int total = list.size();
		int waiting=0;
		int sales=0;
		int soldOut=0;
		int end=0;
		for(Product p : list) {
			if(p.getPermissionYn().equals("0") || p.getPermissionYn().equals("2")) { //판매대기
				waiting++;
			}
			if(p.getPermissionYn().equals("1") && p.getProductStatus().equals("0")) { //판매중
				sales++;
			}
			if(p.getProductStatus().equals("1")|| p.getProductStatus().equals("2")||p.getProductStatus().equals("3")) { //판매완료
				soldOut++;
			}
			if(p.getProductStatus().equals("4") || p.getProductStatus().equals("5")) { //종료
				end++;
			}
		}
		List<Integer> intList = List.of(total,waiting,sales,soldOut,end);
		
		List<Member> buyList = service.buyList(memberNo);
		int total1 = buyList.size();
		int status1=0;
		int status2=0;
		int status3=0;
		for(Member p : buyList) {
			for(int i=0; i<buyList.size(); i++) {
				if(p.getWalletList().get(i).getProductNo().getProductStatus().equals("0")) { //입찰중
					status1++;
				}
				if((p.getWalletList().get(i).getProductNo().getProductStatus().equals("1")
						||p.getWalletList().get(i).getProductNo().getProductStatus().equals("2"))
						&& p.getWalletList().get(i).getProductNo().getHighestBidder().equals(memberNo)) { //구매대기
					status2++;
				}
				if((p.getWalletList().get(i).getProductNo().getProductStatus().equals("3")
						||p.getWalletList().get(i).getProductNo().getProductStatus().equals("4")
						||p.getWalletList().get(i).getProductNo().getProductStatus().equals("5"))
						&& p.getWalletList().get(i).getProductNo().getHighestBidder().equals(memberNo)) { //종료
					status3++;
				}
				if(!(p.getWalletList().get(i).getProductNo().getProductStatus().equals("0"))
						&& !(p.getWalletList().get(i).getProductNo().getHighestBidder().equals(memberNo))) { //종료
					status3++;
				}

			}
		}
		List<Integer> intList1 = List.of(total1,status1,status2,status3);
		
		mv.addObject("salesCnt", intList);
		mv.addObject("buyCnt", intList1);
		mv.addObject("myPageMember",m);
		mv.setViewName("login/myPage");
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
		
		String encodingPw = encoder.encode(param.get("password"));
		log.debug(encodingPw);
		Member m = Member.builder()
				.memberName(param.get("name"))
				.password(encodingPw)
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
	
	@RequestMapping("/findId")
	public String findId() {
		return "login/findId";
	}
	
	@PostMapping("/findIdEnd")
	public ModelAndView findIdEnd(String name, String phone, ModelAndView mv) {
		log.debug(name,phone);
		Member m = service.selectMemberNamePhone(Map.of("name",name,"phone",phone));
		log.debug("{}",m);
		
		if(m==null) {
			String msg = "없는 회원입니다.";
			String loc = "/login";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
		
		
		
		
		String email = m.getEmail();
		String id = email.substring(0, email.indexOf("@"));
		String address = email.substring(email.indexOf("@"));
		String idFront = id.substring(0,id.length()-3);
		String idEnd = id.substring(id.length()-3);
		String temp="";
		
		for(int i=0; i<idEnd.length();i++) {
			temp+="*";
		}
		
		String modifyEmail = idFront+temp+address;
		
		mv.addObject("userId", modifyEmail);
		mv.addObject("userName",m.getMemberName());
		mv.setViewName("login/findIdConfirm");
		
		
		return mv;
	}
	
	@RequestMapping("/findPassword")
	public String findPassword() {
		return "login/findPassword";
	}
	
	@PostMapping("/findPasswordEnd")
	public ModelAndView findPasswordEnd(String phone, String email, ModelAndView mv) throws Exception {
		
		Map<String, String > param = Map.of("phone",phone,"email",email);
		Member m = service.selectMemberPhoneEmail(param);
		String msg = "";
		String loc = "";
		if(m==null) {
			msg = "없는 회원입니다.";
			loc = "/member/findPassword";
		}else {
			
			String newEncodingPw = encoder.encode(mailService.mailSendNewPassword(m.getEmail()));
			log.debug(newEncodingPw);
			Map<String, String> param2 = Map.of("memberNo",m.getMemberNo(),"newPw",newEncodingPw);
			int result = service.updatePassword(param2);
			
			log.debug("{}",result);
			if(result>0) {
				msg = "임시 비밀번호 발급완료";
				loc = "/member/login";
			}else {
				msg = "임시 비빌번호 발급 실패";
				loc = "/member/findPassword";
			}
			
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/login")
	public String loginView() {
		return "login/loginView";
	}
	
	@RequestMapping("/salesStates")
	public ModelAndView salesStates(String memberNo, ModelAndView mv) {
		List<Product> list = service.salesList(memberNo);
		int total = list.size();
		int status1=0;
		int status2=0;
		int status3=0;
		int status4=0;
		for(Product p : list) {
			if(p.getPermissionYn().equals("0") || p.getPermissionYn().equals("2")) { //판매대기
				status1++;
			}
			if(p.getPermissionYn().equals("1") && p.getProductStatus().equals("0")) { //판매중
				status2++;
			}
			if(p.getProductStatus().equals("1")|| p.getProductStatus().equals("2")||p.getProductStatus().equals("3")) { //판매완료
				status3++;
			}
			if(p.getProductStatus().equals("4") || p.getProductStatus().equals("5")) { //종료
				status4++;
			}
		}
		
		List<Integer> intList = List.of(total,status1,status2,status3,status4);
		mv.addObject("salesCnt", intList);
		mv.addObject("productList",list);
		mv.setViewName("product/salesStates");
		return mv;
	}

	@RequestMapping(value = "/salesSearch", method=RequestMethod.POST)
	public String salesSearch ( @RequestParam(value = "status", required=false ) 
	String status, String startDate, String endDate, String memberNo,
	@RequestParam(value = "count") List<Integer> count, Model m) {
		System.out.println(count);
		Map param = new HashMap<>();
			param.put("startDate", startDate);
			param.put("endDate", endDate);
			param.put("status", status);
			param.put("memberNo", memberNo);
		List<Product> list = service.salesSearch(param);

		m.addAttribute("salesCnt", count);
		m.addAttribute("productList",list);
		return "product/salesStates";
	}
	
//	@SuppressWarnings("unlikely-arg-type")
	@RequestMapping("/buyStates")
	public ModelAndView buyStates(String memberNo, ModelAndView mv) {
		List<Member> list = service.buyList(memberNo);
		int total = list.size();
		int status1=0;
		int status2=0;
		int status3=0;
		for(Member p : list) {
			for(int i=0; i<list.size(); i++) {
				if(p.getWalletList().get(i).getProductNo().getProductStatus().equals("0")) { //입찰중
					status1++;
				}
				if((p.getWalletList().get(i).getProductNo().getProductStatus().equals("1")
						||p.getWalletList().get(i).getProductNo().getProductStatus().equals("2"))
						&& p.getWalletList().get(i).getProductNo().getHighestBidder().equals(memberNo)) { //구매대기
					status2++;
				}
				if((p.getWalletList().get(i).getProductNo().getProductStatus().equals("3")
						||p.getWalletList().get(i).getProductNo().getProductStatus().equals("4")
						||p.getWalletList().get(i).getProductNo().getProductStatus().equals("5"))
						&& p.getWalletList().get(i).getProductNo().getHighestBidder().equals(memberNo)) { //종료
					status3++;
				}
//				if(!(p.getWalletList().get(i).getProductNo().getProductStatus().equals("0"))
//						&& !(p.getWalletList().get(i).getProductNo().getHighestBidder().equals(memberNo))) { //종료
//					status3++;
//				}

			}
		}
		List<Integer> intList = List.of(total,status1,status2,status3);

		mv.addObject("buyCnt", intList);
		mv.addObject("productList",list.get(0).getWalletList());
//		mv.addObject("productList",list);
		mv.setViewName("product/buyStates");
		return mv;
	}
	
	@RequestMapping(value = "/buySearch", method=RequestMethod.POST)
	public String buySearch ( @RequestParam(value = "status", required=false ) 
	String status, String startDate, String endDate, String memberNo,
	@RequestParam(value = "count") List<Integer> count, Model m) {
		Map param = new HashMap<>();
			param.put("startDate", startDate);
			param.put("endDate", endDate);
			param.put("status", status);
			param.put("memberNo", memberNo);
		List<Member> list = service.buySearch(param);

		m.addAttribute("buyCnt", count);
		m.addAttribute("productList",list.get(0).getWalletList());
//		m.addAttribute("productList",list);
		return "product/buyStates";
	}
	
	@RequestMapping("/shipping") 
	public ModelAndView shippingSelect(String productNo, ModelAndView mv) {
		System.out.println("productNo:"+ productNo);
		int result = service.shippingSelect(productNo);
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "물품발송이 완료되었습니다.";
			loc = "/";
		}else {
			msg = "실패";
			loc = "/";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("/common/msg");
		return mv;
	}
	
	@RequestMapping("/emoneyDetail")
	public ModelAndView emoneyDetail(String memberNo, ModelAndView mv) {
		List<Wallet> list = service.emoneyDetail(memberNo);
		Member m = service.selectMember(memberNo);
		mv.addObject("m",m);
		mv.addObject("list",list);
		mv.setViewName("login/emoneyDetail");
		return mv;
	}
	
}
