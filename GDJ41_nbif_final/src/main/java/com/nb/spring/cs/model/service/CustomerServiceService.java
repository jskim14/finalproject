package com.nb.spring.cs.model.service;

import java.util.List;

import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;


public interface CustomerServiceService {
	
	List<Notice> selectNoticeList();
	List<Qna> selectQnaList();
	
	

}
