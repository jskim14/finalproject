package com.nb.spring.report.model.service;

import java.util.List;

import com.nb.spring.report.model.vo.Report;
import com.nb.spring.report.model.vo.ReportImage;

public interface ReportService {
	
	List<Report> selectReportList();
	int insertReport(Report r);

}
