package com.nb.spring.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nb.spring.cs.model.service.CustomerServiceService;
import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

@Controller
public class CustomerServiceController {

	@Autowired
	private CustomerServiceService service;
	
	@RequestMapping(value="/customerServiceList", method=RequestMethod.POST)
	@ResponseBody
	public String selectCsList(String choice) {
		
		System.out.println("요청도착"+choice);
		
		
//		switch("choice") {
//		case "notice": List<Notice> noticeList=service.selectNoticeList(); break;
//		case "qna": List<Qna> qnaList=service.selectQnaList(); break;
//		}
		return "success";
	}
}
