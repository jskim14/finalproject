package com.nb.spring.report.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.report.model.dao.ReportDao;
import com.nb.spring.report.model.vo.Report;
import com.nb.spring.report.model.vo.ReportImage;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Report> selectReportList(int cPage, int numPerPage) {
		List<Report> list=dao.selectReportList(session, cPage, numPerPage);
		for(Report r:list) {
			r.setReportImages(dao.selectReportImages(session,r.getReportProduct().getProductNo()));
			System.out.println(r.getReportImages());
		}
		return list;
	}

	@Override
	public int reportCount() {
		return dao.reportCount(session);
	}

	@Override
	public int insertReport(Report r) throws RuntimeException {
		int result=dao.insertReport(session, r);
		if(result>0 && !r.getReportImages().isEmpty()) {
			try {
				for(ReportImage ri: r.getReportImages()) {
					ri.setProductNo(r.getReportProduct());
					result=dao.insertReportImage(session, ri);
				}
			}catch(RuntimeException e) {
				throw new RuntimeException("에러! 등록실패");
			}
		}
		return result;
	}

}
