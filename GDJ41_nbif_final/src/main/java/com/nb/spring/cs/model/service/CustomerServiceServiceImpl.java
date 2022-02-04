package com.nb.spring.cs.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Notice> selectNoticeList() {
		return dao.selectNoticeList(session);
	}

	@Override
	public List<Qna> selectQnaList() {
		return dao.selectQnaList(session);
	}
	
	
}
