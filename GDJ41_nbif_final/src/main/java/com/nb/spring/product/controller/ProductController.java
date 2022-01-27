package com.nb.spring.product.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	@RequestMapping("/realtimeaction")
	public ModelAndView realtimeaction(ModelAndView mv, String productNo) {
//		mv.addObject(service.selectOneProductNo(productNo));
		mv.setViewName("detail/productRealTimeAction");
		return mv;
	}
	
	@RequestMapping("/checkBuyNow")
	public void checkBuyNow(@RequestParam(value="productNo") String productNo,HttpServletRequest req, HttpServletResponse response) throws IOException{
		log.debug(productNo);
		
		Product product = service.selectOneProductNo(productNo);
		
		boolean isBuy=true;
		
		if(product!=null) {
			//제품명의 제품이 있음 
			if(product.getFinalPrice()==null) {
				//최종낙찰가가 없음 -> 구매불가
				isBuy=false;
			}else {
				//구매가능 
				isBuy = true;
			}
		}
		
		
		
		response.setContentType("application/json;charset-utf-8");
		response.getWriter().print(isBuy);
		
	}
	
	
	
}
