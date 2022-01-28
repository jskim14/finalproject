package com.nb.spring.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao {

	@Override
	public List<Report> selectReportList(SqlSessionTemplate session) {
		return session.selectList("report.selectReportList");
	}

	
}
