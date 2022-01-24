package com.nb.spring.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Override
	public Member loginMember(SqlSessionTemplate session,Map<String, String> param) {
		return session.selectOne("member.loginMember",param);
	}

}
