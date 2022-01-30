package com.nb.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.member.model.dao.MemberDao;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.vo.Product;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Member loginMember(Map<String, String> param) {
		return dao.loginMember(session, param);
	}

	@Override
	public Member selectMember(String memberNo) {
		return dao.selectMember(session,memberNo);
	}

	@Override
	public List<Product> salesList(String memberNo) {
		return dao.salesList(session,memberNo);
	}
	
	

}
