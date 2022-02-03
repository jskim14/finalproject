package com.nb.spring.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.report.model.vo.Report;
import com.nb.spring.report.model.vo.ReportImage;

public interface ReportDao {
		
	List<Report> selectReportList(SqlSessionTemplate session);
	
	int insertReport(SqlSessionTemplate session, Report r);
	int insertReportImage(SqlSessionTemplate session, ReportImage ri);

}
