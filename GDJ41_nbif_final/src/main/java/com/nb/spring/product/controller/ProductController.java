package com.nb.spring.product.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	

	@RequestMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam String productNo, ModelAndView mv) {

		System.out.println(productNo);

		Product product = productService.selectOneProductNo(productNo);
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
	public void checkBuyNow(@RequestParam(value = "productNo") String productNo, HttpServletRequest req,
			HttpServletResponse response) throws IOException {
		log.debug(productNo);

		Product product = productService.selectOneProductNo(productNo);

		boolean isBuy = true;

		if (product != null) {
			// 제품명의 제품이 있음
			if (product.getFinalPrice() == null) {
				// 최종낙찰가가 없음 -> 구매불가
				isBuy = false;
			} else {
				// 구매가능
				isBuy = true;
			}
		}

		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(isBuy);

	}

	@RequestMapping("/bid")
	@ResponseBody
	public Map bid(String userBidPrice,String productNo,HttpSession session, HttpServletResponse res) throws IOException{
		log.debug(userBidPrice);
		log.debug(productNo);
		
		int bidPrice = Integer.parseInt(userBidPrice);
		Member m = (Member)session.getAttribute("loginMember");
		
		log.debug("{}",m);
		if(m==null) {
			//로그 아웃 상태 임
			
			return Map.of("result","로그인 요청");
		}
		
		Product product = productService.selectOneProductNo(productNo);
		
		log.debug("{}",product);
		
		int nowBidPrice = Integer.parseInt(product.getNowBidPrice());
		
		int bidUnit = Integer.parseInt(product.getBidUnit());
		
		if(bidPrice >= nowBidPrice+bidUnit) {
			//입찰가능 
			
			int result = exeBid(productNo,String.valueOf(bidUnit),m.getMemberNo());
			
			if(result>0) {
				
				return Map.of("result","입찰성공");
			}else {
				return Map.of("result","입찰실패");
			}
			
			
			
		}else {
			//입찰불가 
			
			return Map.of("result","입찰불가금액");
		}
	}
	
	private int exeBid(String productNo,String bidPrice,String memberNo) {
		Map<String,String> param = Map.of(
											"productNo",productNo,
											"bidPrice",bidPrice,
											"memberNo",memberNo
										);
		int result = productService.updateBid(param);
		return result;
	}

}
