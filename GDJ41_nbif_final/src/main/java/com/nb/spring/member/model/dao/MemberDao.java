package com.nb.spring.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.member.model.vo.Member;

public interface MemberDao {

	Member loginMember(SqlSessionTemplate session,Map<String,String> param);
}
