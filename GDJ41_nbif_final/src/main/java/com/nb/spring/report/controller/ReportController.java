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
	
//	@RequestMapping("/reportlist")
//	public ModelAndView reportlist(@RequestParam String productNo, ModelAndView mv) {
//		
//		System.out.println(productNo);
//		
//		List<Report> reportList=service.selectReportList();
//		
//	}
	
	@RequestMapping("/reportList")
	public String selectReportList(Model model) {
		List<Report> reportList=service.selectReportList();
		model.addAttribute("reportList",reportList);
		return "report/reportList";
	}
	
	@RequestMapping(value="/insertReport", method=RequestMethod.POST)
	public ModelAndView insertReport(Report r, String product, String writer, ModelAndView mv,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFile,
			HttpServletRequest req) {
		
		log.debug(upFile[0].getOriginalFilename());
		log.debug("{}", upFile[0].getSize());
		
//		mv.addObject("loc","/");
//		mv.setViewName("common/msg");
		System.out.println(r);
		
		r.setReportProduct(new Product());
		r.getReportProduct().setProductNo(product);
		r.setReportMember(new Member());
		r.getReportMember().setMemberNo(writer);
		
		
		//File upload
		String path=req.getServletContext().getRealPath("/resources/upload/report/");
		File f=new File(path);
		if(!f.exists()) f.mkdirs(); //create a folder
		
		r.setReportImages(new ArrayList<ReportImage>());
		
		for(MultipartFile mf: upFile) {
			if(!mf.isEmpty()) {
				String orignalFileName=mf.getOriginalFilename();
				String ext=orignalFileName.substring(orignalFileName.lastIndexOf("."));
				
				//rename rule
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmsssss");
				int rndNum=(int)(Math.random()*1000);
				String renameFile=sdf.format(System.currentTimeMillis())+"_"+rndNum+ext;
				//save renamed file using method of MultipartFile Class
				try {
					mf.transferTo(new File(path+renameFile));
					ReportImage ri=new ReportImage();
					ri.setFileName(orignalFileName);
					r.getReportImages().add(ri);
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(r.getReportImages());
		log.debug("reportDate: {}", r);
		String msg="";
		String loc="";
		try {
			int result=service.insertReport(r);
			msg="신고 완료 하였습니다.";
			loc="/";
		}catch(RuntimeException e) {
			msg="신고 실패: "+e.getMessage();
			loc="/";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
}
