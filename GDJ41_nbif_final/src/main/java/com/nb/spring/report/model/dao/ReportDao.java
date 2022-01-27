package com.nb.spring.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.report.model.vo.Report;

public interface ReportDao {
		
	List<Report> selectReportList(SqlSessionTemplate session);

}
