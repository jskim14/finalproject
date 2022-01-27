package com.nb.spring.product.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam String productNo, ModelAndView mv) {
		
		System.out.println(productNo);
		
		Product product = service.selectOneProductNo(productNo);
		System.out.println(product);
		mv.addObject("product", product);
		mv.setViewName("detail/productDetail");
		return mv;
	}
	
	@RequestMapping("/insertProduct")
	public String insertProduct() {
		return "/product/insertProduct";
	}
	
	@RequestMapping("/insertProductEnd")
	public ModelAndView insertProductEnd(ModelAndView mv, Product p,
			/* String sellerNo, */ String maxDate, String maxTime) throws Exception {

		//date 지정
		String date = maxDate+" "+maxTime;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date utilDate = sdf.parse(date);
		java.sql.Date endDate = new java.sql.Date(utilDate.getTime());
		p.setEndDate(endDate);
		
//		System.out.println(sellerNo);
//		//seller 지정
//		p.setSeller(new Member());
//		p.getSeller().setMemberNo(sellerNo);
		

		int result=service.insertProduct(p);
		System.out.println(result);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "물품등록이 정상적으로 요청되었습니다.";
			loc = "/";
		}else {
			msg = "물품등록에 실패하였습니다. 관리자에게 문의하세요.";
			loc = "/product/insertProduct";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("/common/msg");
		return mv;
	}
	
	@RequestMapping("/realtimeaction")
	public ModelAndView realtimeaction(ModelAndView mv, String productNo) {
//		mv.addObject(service.selectOneProductNo(productNo));
		mv.setViewName("detail/productRealTimeAction");
		return mv;
	}
}
