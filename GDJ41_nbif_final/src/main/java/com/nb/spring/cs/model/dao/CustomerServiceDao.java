package com.nb.spring.cs.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

public interface CustomerServiceDao {
	
	List<Notice> selectNoticeList(SqlSessionTemplate session);
	List<Qna> selectQnaList(SqlSessionTemplate session);
	

}
