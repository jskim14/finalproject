package com.nb.spring.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.member.model.vo.Member;

public interface MemberDao {

	Member loginMember(SqlSessionTemplate session,Map<String,String> param);

	Member selectMemberNickName(SqlSessionTemplate session, String nickName);

	int insertMember(SqlSessionTemplate session, Member m);

	Member selectMemberNamePhone(SqlSessionTemplate session, Map<String, String> param);

	Member selectMemberPhoneEmail(SqlSessionTemplate session, Map<String, String> param);

	int updatePassword(SqlSessionTemplate session, Map<String,String> param);
}
