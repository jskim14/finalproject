package com.nb.spring.cs.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;


public interface CustomerServiceService {
	
	
	List<Notice> selectNoticeList(Model model);
	List<Qna> selectQnaList(Model model);
	int insertNotice(Map<String,String> param);
	
	int insertQuestion(Map<String,String> param2);
	
	

}
