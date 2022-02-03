package com.nb.spring.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.member.model.dao.MemberDao;
import com.nb.spring.member.model.vo.Member;

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
	public Member selectMemberNickName(String nickName) {
		
		return dao.selectMemberNickName(session, nickName);
	}

	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session, m);
	}

}
