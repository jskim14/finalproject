package com.nb.spring.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.nb.spring.cs.model.service.CustomerServiceService;
import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

@Controller
public class CustomerServiceController {

	@Autowired
	private CustomerServiceService service;
	
	@RequestMapping("/customerServiceList")
	@ResponseBody
	public void selectCsList(HttpServletResponse response, 
			@RequestParam(value="choice", defaultValue="1") String choice) throws IOException{
		
		System.out.println("카테고리 도착 "+choice);
		List<Notice> noticeList=null;
		List<Qna> qnaList=null;
		
		switch(choice) {
		case "1": 
			noticeList=service.selectNoticeList();
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(noticeList, response.getWriter());
			break;
		case "2": qnaList=service.selectQnaList(); break;
		}
		
		System.out.println(noticeList);
		
		
//		model.addAttribute("noticeList",noticeList);
//		model.addAttribute("qnaList",qnaList);
		
	}
}
