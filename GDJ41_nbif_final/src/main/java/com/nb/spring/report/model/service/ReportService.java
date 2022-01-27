package com.nb.spring.report.model.service;

import java.util.List;

import com.nb.spring.report.model.vo.Report;

public interface ReportService {
	
	List<Report> selectReportList();

}
