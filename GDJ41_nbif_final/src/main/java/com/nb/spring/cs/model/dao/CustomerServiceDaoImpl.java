package com.nb.spring.cs.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

@Repository
public class CustomerServiceDaoImpl implements CustomerServiceDao {

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate session) {
		return session.selectList("cs.selectNoticeList");
	}

	@Override
	public List<Qna> selectQnaList(SqlSessionTemplate session) {
		return session.selectList("cs.selectQnaList");
	}

}
