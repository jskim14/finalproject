package com.nb.spring.product.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.common.BalanceType;
import com.nb.spring.common.DealType;
import com.nb.spring.common.WalletType;
import com.nb.spring.member.model.service.MemberService;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.service.ProductService;
import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;
import com.nb.spring.product.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam String productNo, HttpSession session, ModelAndView mv) {

		System.out.println(productNo);
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		Product product = productService.selectOneProductNo(productNo);
		boolean isGeneral = true;
		if(product.getBannerImageName()==null||product.getBannerImageName().length()<=0) {
			//일반 판매 상품 
			isGeneral =true;
		}else {
			//실시간 경매 상품 
			isGeneral = false;
		}
		
		long now = new Date().getTime();
		long endDate = product.getEndDate().getTime();
		
		long gap = now-endDate;
		
		boolean isSell = false;
		
		if(gap>=0) {
			//기한 만료 
			isSell = false;
		}else {
			// 진행중 
			isSell = true;
		}
		
		mv.addObject("isGeneral",isGeneral);
		mv.addObject("isSell",isSell);
		
		
		
		if(loginMember!=null) {
			Map<String, String> param = Map.of("productNo",product.getProductNo(),"memberNo",loginMember.getMemberNo());
			int result = productService.selectWishList(param);
			
			if(result >0) {
				mv.addObject("isWishList",true);
			}else {
				mv.addObject("isWishList",false);
			}
		}
		
		List<Map<String, String >> list = productService.selectBidderList(product.getProductNo());
		
		mv.addObject("bidderList",list);
		
		
		
		
		
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
		int result= productService.insertProduct(p);
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
			
			return Map.of("result","로그인 후 이용해주세요");
		}
	
		
		Product product = productService.selectOneProductNo(productNo);
		
		log.debug("{}",product);
		
		int nowBidPrice = Integer.parseInt(product.getNowBidPrice());
		
		int bidUnit = Integer.parseInt(product.getBidUnit());
		
		if(bidPrice >= nowBidPrice+bidUnit) {
			
			int balance = Integer.parseInt(m.getBalance());
			if(balance<bidPrice) {
				//잔액부족 
				return Map.of("result","잔액부족");
			}
			
			//입찰가능 
			log.debug("{}",bidPrice);
			log.debug("{}",m.getMemberNo());
			
			Member exHigher = product.getHighestBidder();
			String exHigherPrice = product.getNowBidPrice();
			
			
			
			int result = exeBid(productNo,String.valueOf(bidPrice),m.getMemberNo());
			
			if(result>0) {
				
				Map<String, Object> param = Map.of("dealType",DealType.OUTPUT,"amount",bidPrice,"walletType",WalletType.BID,"productNo",product.getProductNo(),"memberNo",m.getMemberNo(),"bidPrice",String.valueOf(bidPrice));
				result = memberService.updateBalance(DealType.OUTPUT,param);
				
				if(result>0) {
					param = Map.of("dealType",DealType.INPUT,"amount",exHigherPrice,"walletType",WalletType.FAILURE,"productNo",product.getProductNo(),"memberNo",exHigher.getMemberNo(),"bidPrice",exHigherPrice);
					result = memberService.updateBalance(DealType.INPUT,param);
					
					if(result>0) {
						return Map.of("result","입찰성공");
					}else {
						return Map.of("result","입찰실패");
					}
					
					
				}else {
					return Map.of("result","입찰실패");
				}
				
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
	
	
	@RequestMapping("/review")
	@ResponseBody
	public List<Review> review(String sellerNo){
		log.debug(sellerNo);
		List<Review> list = productService.selectReview(sellerNo);
		
		return list;
	}
	
	
	@RequestMapping("/wishList")
	@ResponseBody
	public Map wishList(String productNo, String memberNo) {
		log.debug(productNo);
		log.debug(memberNo);
		
		if(memberNo.length()<=0) {
			return Map.of("result","로그인 후 이용");
		}
		
		Map<String, String> param = Map.of("productNo",productNo, "memberNo",memberNo);
		
		int result = productService.insertWishList(param);
		String msg ="";
		
		if(result>0) {
			msg="등록성공";
		}else {
			msg="등록실패";
		}
		
		
		return Map.of("result",msg);
	}
	
	@RequestMapping("/updateProduct")
	public ModelAndView updateProduct(String productNo, ModelAndView mv) {
		System.out.println(productNo);
		Product p = productService.updateProduct(productNo);
		mv.addObject("p",p);
		mv.setViewName("/product/updateProduct");
		return mv;
	}
	
	@RequestMapping("/updateProductEnd")
	public ModelAndView updateProductEnd(ModelAndView mv, Product p,
			 String sellerNo, String productNum, String maxDate, String maxTime, String unit,
			 @RequestParam(value = "imageFile", required = false) MultipartFile[] imageFile, HttpServletRequest req) throws Exception {
		System.out.println("p.getproductno : " + p.getProductNo());
		//date 
		String date = maxDate+" "+maxTime;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date utilDate = sdf.parse(date);
		java.sql.Date endDate = new java.sql.Date(utilDate.getTime());
		p.setEndDate(endDate);
		
		//seller 
		p.setSeller(new Member());
		p.getSeller().setMemberNo(sellerNo);
		
		//productNo
		p.setProductNo(productNum);
		System.out.println("p.getproductno : " + p.getProductNo());
		
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
					ProductImage pi = ProductImage.builder().productNo(productNum).imageName(renameFile).build();
					p.getImages().add(pi);
					
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println("p.getproductno : " + p.getProductNo());
		
		int result= productService.updateProductEnd(p);
		
		String msg = "";
		String loc = "";
		
		if(result>0) {
			msg = "물품등록 수정에 성공하였습니다. ";
			loc = "member/salesStates?memberNo="+p.getSeller();
		}else {
			msg = "물품등록에 실패하였습니다. 관리자에게 문의하세요.";
			loc = "/product/updateProduct?productNo="+p.getProductNo();
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("/common/msg");
		return mv;
	}
	

}
