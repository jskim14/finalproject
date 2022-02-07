package com.nb.spring.cs.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.ui.Model;

import com.nb.spring.cs.model.vo.Notice;
import com.nb.spring.cs.model.vo.Qna;

public interface CustomerServiceDao {
	
	List<Notice> selectNoticeList(SqlSessionTemplate session, Model model);
	List<Qna> selectQnaList(SqlSessionTemplate session, Model model);
	int insertNotice(SqlSessionTemplate session, Map<String,String> param);

}
