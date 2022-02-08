package com.nb.spring.cs.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.cs.model.service.CustomerServiceService;
import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerServiceController {

	@Autowired
	private CustomerServiceService service;
	
//	@RequestMapping("/customerServiceList")
//	@ResponseBody
//	public void selectCsList(HttpServletResponse response, 
//			@RequestParam(value="choice", defaultValue="1") String choice) throws IOException{
//		
//		System.out.println("카테고리 도착 "+choice);
//		List<Notice> noticeList=null;
//		List<Qna> qnaList=null;
//		Gson gson=new Gson();
//		
//		switch(choice) {
//		case "1": 
//			noticeList=service.selectNoticeList();
//			response.setContentType("application/json; charset=utf-8");
//			gson.toJson(noticeList, response.getWriter());
//			break;
//		case "2": 
//			qnaList=service.selectQnaList(); 
//			response.setContentType("application/json; charset=utf-8");
//			gson.toJson(qnaList, response.getWriter());
//			break;
//		}
//		
//		System.out.println(noticeList);
//		System.out.println(qnaList);
//		
//	}
	
	@RequestMapping("/cs/noticeList")
	public String noticeView(Model model) {
		List<Notice> noticeList=service.selectNoticeList(model);
		model.addAttribute("noticeList",noticeList);
		return "/cs/notice";
	}
	@RequestMapping("/cs/qnaList")
	public String qnaView(Model model) {
		List<Qna> qnaList=service.selectQnaList(model);
		System.out.println(qnaList);
		model.addAttribute("qnaList",qnaList);
		return "/cs/qna";
	}
	
	
	@RequestMapping("/cs/insertNotice")
	public ModelAndView insertNotice(ModelAndView mv, String noticeTitle, String noticeContent, String memberNo) {
		
		Map<String,String> param= Map.of("noticeTitle",noticeTitle, "noticeContent",noticeContent, "memberNo",memberNo);
		
		int result=service.insertNotice(param);
		String msg="";
		String loc="";
		if(result>0) {
			msg="공지사항 등록 완료";
			loc="/cs/noticeList";
		}else{
			msg="공지사항 등록 실패";
			loc="/cs/noticeList";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	@RequestMapping("/cs/insertQuestion")
	public ModelAndView insertQuestion(ModelAndView mv, String qnaTitle, String qnaContent, String memberNo) {
		Map<String,String> param2= Map.of("qnaTitle",qnaTitle, "qnaContent",qnaContent, "memberNo",memberNo);
		
		int result=service.insertQuestion(param2);
		String msg="";
		String loc="";
		if(result>0) {
			msg="문의사항 등록 완료";
			loc="/cs/qnaList";
		}else{
			msg="문의사항 등록 실패";
			loc="/cs/qnaList";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
}
