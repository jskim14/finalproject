package com.nb.spring.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nb.spring.report.model.service.ReportService;
import com.nb.spring.report.model.vo.Report;

@Controller
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
	public String selectBoardList(Model model) {
		List<Report> reportList=service.selectReportList();
		model.addAttribute("reportList",reportList);
		return "report/reportList";
	}
	
	
}
