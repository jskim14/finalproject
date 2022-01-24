package com.nb.spring.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductController {
	@RequestMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam(defaultValue = "1") int productNo, ModelAndView mv) {
		
		System.out.println(productNo);
		
		mv.setViewName("detail/productDetail");
		return mv;
	}
	
	@RequestMapping("/insertProduct")
	public ModelAndView insertProduct(ModelAndView mv) {
		mv.setViewName("/product/insertProduct");
		return mv;
	}
}
