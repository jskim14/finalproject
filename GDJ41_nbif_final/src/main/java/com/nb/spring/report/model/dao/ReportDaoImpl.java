package com.nb.spring.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.report.model.vo.Report;
import com.nb.spring.report.model.vo.ReportImage;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Override
	public List<Report> selectReportList(SqlSessionTemplate session) {
		return session.selectList("report.selectReportList");
	}

	@Override
	public int insertReport(SqlSessionTemplate session, Report r) {
		return session.insert("report.insertReport", r);
	}
	
	@Override
	public int insertReportImage(SqlSessionTemplate session, ReportImage ri) {
		return session.insert("report.insertReportImage", ri);
	}
}
