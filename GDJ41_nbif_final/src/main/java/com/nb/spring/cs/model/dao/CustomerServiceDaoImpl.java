package com.nb.spring.cs.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

@Repository
public class CustomerServiceDaoImpl implements CustomerServiceDao {

	@Override
	public List<Notice> selectNoticeList(SqlSessionTemplate session, Model model) {
		return session.selectList("cs.selectNoticeList", model);
	}

	@Override
	public List<Qna> selectQnaList(SqlSessionTemplate session, Model model) {
		return session.selectList("cs.selectQnaList", model);
	}

	@Override
	public int insertNotice(SqlSessionTemplate session, Map<String,String> param) {
		return session.insert("cs.insertNotice",param);
	}
	
	

}
