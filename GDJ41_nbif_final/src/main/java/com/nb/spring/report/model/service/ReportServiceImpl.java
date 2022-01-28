package com.nb.spring.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.report.model.dao.ReportDao;
import com.nb.spring.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Report> selectReportList(){
		return dao.selectReportList(session);
	}

}
