package com.nb.spring.admin.controller;

import static com.nb.spring.common.MsgModelView.msgBuild;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.common.PageFactory;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productManage")
	public ModelAndView productManage(@RequestParam(name = "cPage",defaultValue = "1")int cPage,
			@RequestParam(value="numPerPage",defaultValue="5")int numPerPage,ModelAndView mv) {
		log.debug("{}",numPerPage);
		int pageBarSize = 3;
		int totalData = productService.selectWaitingCount();
		
		
		Map<String,Integer> param = Map.of("cPage",cPage,"numPerPage",numPerPage);
		
		List<Product> list = productService.selectWaitingPermission(param);
		
		mv.addObject("numPerPage",numPerPage);
		mv.addObject("waitList", list);
		mv.addObject("pageBar", PageFactory.getPageBar(totalData, cPage, numPerPage, pageBarSize, "/admin/productManage"));
		mv.setViewName("admin/productManage");
	
		return mv;
	}
	
	@RequestMapping("/productConfirmDetail")
	public ModelAndView productConfirmDetail(String productNo,ModelAndView mv) {
		log.debug(productNo);
		Product product = productService.selectOneProductNo(productNo);
		log.debug("{}",product);
		mv.addObject("product", product);
		mv.setViewName("detail/productConfirmDetail");
		return mv;
	}
	
	@RequestMapping("/permission")
	public ModelAndView permission(String productNo,ModelAndView mv) {
		log.debug(productNo);
		
		int result = productService.updateProductPermission(productNo);
		
		if(result>0) {
			mv = msgBuild(mv,"/admin/productManage", "승인완료");
		}else {
			mv = msgBuild(mv, "/admin/productManage", "ERROR - 처리 실패 ");
		}
		
		return mv;
		
		
	}
	
	@PostMapping("/reject")
	public ModelAndView reject(String productNo,@RequestParam(defaultValue = "거부") String rejectReason,ModelAndView mv) {
		log.debug("reject : "+productNo);
		log.debug("reject : "+rejectReason);
		
		Map<String,Object> param = Map.of("productNo",productNo,"rejectReason",rejectReason);
		
		int result = productService.updateProductReject(param);
		
		if(result>0) {
			mv = msgBuild(mv,"/admin/productManage", "처리완료");
		}else {
			mv = msgBuild(mv, "/admin/productManage", "ERROR - 처리 실패 ");
		}
		
		return mv;
	}
	
	@RequestMapping("/specialProductEnroll")
	public String specialPoduct() {
		
		return "admin/specialProductEnroll";
	}
	
	@PostMapping("/specialProductEnrollEnd")
	public ModelAndView specialProductEnrollEnd(@RequestParam Map<String,String>param, 
						@RequestParam(value="bannerImageFile",required=true) MultipartFile bannerImageFile,
						@RequestParam(value="imageFile",required = true) MultipartFile[] imageFiles, 
						HttpServletRequest req) throws Exception {
		
		log.debug("{}",param);
		log.debug("{}",bannerImageFile);
		log.debug("{}",imageFiles);
		
		
		
		
		
		
		
		
		return null;
	}
	
	
}
