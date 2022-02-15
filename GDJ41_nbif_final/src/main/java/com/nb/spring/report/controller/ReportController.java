package com.nb.spring.report.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.common.PageFactory;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.vo.Product;
import com.nb.spring.report.model.service.ReportService;
import com.nb.spring.report.model.vo.Report;
import com.nb.spring.report.model.vo.ReportImage;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService service;
	
	
	@RequestMapping("/reportList")
	public ModelAndView selectReportList(
			@RequestParam(value="cPage", defaultValue="1") int cPage, 
			@RequestParam(value="numPerPage", defaultValue="10") int numPerPage,
			ModelAndView mv) {
		List<Report> reportList=service.selectReportList(cPage,numPerPage);
		int totalReport=service.reportCount();
		mv.addObject("pageBar",PageFactory.getPageBar(totalReport, cPage, numPerPage, 5, "/report/reportList"));
		
		mv.addObject("reportList",reportList);
		mv.addObject("report/reportList");
		System.out.println("가져온 리스트"+reportList);
		return mv;
	}
	
	@RequestMapping(value="/insertReport", method=RequestMethod.POST)
	public ModelAndView insertReport(Report r, String product, String writer, ModelAndView mv,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			HttpServletRequest req) throws Exception{
		
		log.debug(upFile[0].getOriginalFilename());
		log.debug("{}", upFile[0].getSize());
		
		System.out.println("가져온상품번호"+product);
		System.out.println("가져온작성자"+writer);
		
		r.setReportProduct(new Product());
		r.getReportProduct().setProductNo(product);
		r.setReportMember(new Member());
		r.getReportMember().setMemberNo(writer);
		
		System.out.println("넣은거"+r);
		
		//File upload
		String path=req.getServletContext().getRealPath("/resources/upload/report/");
		File f=new File(path);
		if(!f.exists()) f.mkdirs(); //create a folder
		r.setReportImages(new ArrayList<ReportImage>());
		for(MultipartFile mf: upFile) {
			if(!mf.isEmpty()) {
				//create file
				String orignalFileName=mf.getOriginalFilename();
				//확장자
				String ext=orignalFileName.substring(orignalFileName.lastIndexOf("."));
				//rename rule
				SimpleDateFormat sdf=new SimpleDateFormat("ddMMyyHHmmsssss");
				int rndNum=(int)(Math.random()*1000);
				
				String renameFile=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				
				//save renamed file using method of MultipartFile Class
				try {
					mf.transferTo(new File(path+renameFile));
				}catch(IOException e) {
					e.printStackTrace();
				}
				ReportImage ri=ReportImage.builder().fileName(renameFile).build();
				r.getReportImages().add(ri);
				
			}
		}
		System.out.println("이미지이름"+r.getReportImages());
		int result=service.insertReport(r);
		log.debug("reportDate: {}", r);
		String msg="";
		String loc="";
		if(result>0) {
			msg="신고 완료 하였습니다.";
			loc="/";
		}else {
			msg="신고 실패";
			loc="/";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
}
