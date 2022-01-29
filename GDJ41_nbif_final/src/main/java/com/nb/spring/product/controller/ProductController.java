package com.nb.spring.product.controller;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;

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
	
	@RequestMapping("/insertProduct")
	public String insertProduct() {
		return "/product/insertProduct";
	}
	
	@RequestMapping(value =  "/insertProductEnd", method=RequestMethod.POST)
	public ModelAndView insertProductEnd(ModelAndView mv, Product p,
			 String sellerNo, String maxDate, String maxTime, String unit,
			 @RequestParam(value = "imageFile", required = false) MultipartFile[] imageFile, HttpServletRequest req) throws Exception {

		//date 
		String date = maxDate+" "+maxTime;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date utilDate = sdf.parse(date);
		java.sql.Date endDate = new java.sql.Date(utilDate.getTime());
		p.setEndDate(endDate);
		
		//seller 
		p.setSeller(new Member());
		p.getSeller().setMemberNo(sellerNo);
		
		//bidUnit
		if(unit.contains(",")) {
			String splitUnit[] = unit.split(",");
			p.setBidUnit(splitUnit[1]);
		} else {
			p.setBidUnit(unit);
		}
		
		//file
		String path = req.getServletContext().getRealPath("/resources/upload/product/"); 
		File f = new File(path);
		if(!f.exists()) f.mkdir();
		p.setImages(new ArrayList<ProductImage>());
		for(MultipartFile mf : imageFile) {
			if(!mf.isEmpty()) {
				String originalFileName = mf.getOriginalFilename();
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				SimpleDateFormat sdf2 = new SimpleDateFormat("ddMMyyHHmmssss"); 
				int ranNum = (int)(Math.random()*1000);
				String renameFile = sdf2.format(System.currentTimeMillis())+"_"+ranNum+ext;
				try {
					mf.transferTo(new File(path+renameFile));
					ProductImage pi = ProductImage.builder().imageName(renameFile).build();
					p.getImages().add(pi);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(p.getImages());
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
