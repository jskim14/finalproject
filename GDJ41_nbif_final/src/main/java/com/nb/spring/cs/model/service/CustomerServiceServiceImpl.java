package com.nb.spring.cs.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.nb.spring.cs.model.dao.CustomerServiceDao;
import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

@Service
public class CustomerServiceServiceImpl implements CustomerServiceService {
	@Autowired
	private CustomerServiceDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Notice> selectNoticeList(Model model) {
		return dao.selectNoticeList(session, model);
	}

	@Override
	public List<Qna> selectQnaList(Model model) {
		return dao.selectQnaList(session, model);
	}

	@Override
	public int insertNotice(Map<String,String> param) {
		return dao.insertNotice(session, param);
	}
	
	@Override
	public int insertQuestion(Map<String,String> param2) {
		return dao.insertQuestion(session, param2);
	}
	
	
	
}
