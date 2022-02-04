package com.nb.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.member.model.vo.Member;
import com.nb.spring.product.model.vo.Product;

public interface MemberDao {

	Member loginMember(SqlSessionTemplate session,Map<String,String> param);
	
	Member selectMember(SqlSessionTemplate session, String memberNo);
	
	List<Product> salesList(SqlSessionTemplate session, String memberNo);

	Member selectMemberNickName(SqlSessionTemplate session, String nickName);

	int insertMember(SqlSessionTemplate session, Member m);

	public Member selectMemberNamePhone(SqlSessionTemplate session, Map<String, String> param);
	
	Member selectMemberPhoneEmail(SqlSessionTemplate session, Map<String, String> param);

	int updatePassword(SqlSessionTemplate session, Map<String,String> param);

	List<Product> salesSearch(SqlSessionTemplate session, Map param);
	
	List<Member> buyList(SqlSessionTemplate session, String memberNo);
	
	List<Member> buySearch(SqlSessionTemplate session, Map param);

}