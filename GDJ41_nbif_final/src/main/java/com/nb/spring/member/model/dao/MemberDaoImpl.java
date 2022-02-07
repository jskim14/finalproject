package com.nb.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.common.BalanceType;
import com.nb.spring.common.DealType;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.member.model.vo.Wallet;
import com.nb.spring.product.model.vo.Product;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Member loginMember(SqlSessionTemplate session,Map<String, String> param) {
		return session.selectOne("member.loginMember", param);
	}

	@Override
	public Member selectMember(SqlSessionTemplate session, String memberNo) {
		return session.selectOne("member.selectMember",memberNo);
	}

	@Override
	public List<Product> salesList(SqlSessionTemplate session, String memberNo) {
		return session.selectList("member.salesList",memberNo);
	}
	
	
	public Member selectMemberNickName(SqlSessionTemplate session, String nickName) {
		
		return session.selectOne("member.selectMemberNickName", nickName);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		
		return session.insert("member.insertMember", m);
	}

	@Override
	public Member selectMemberNamePhone(SqlSessionTemplate session, Map<String, String> param) {
		
		return session.selectOne("member.selectMemberNamePhone",param);
	}

	@Override
	public Member selectMemberPhoneEmail(SqlSessionTemplate session, Map<String, String> param) {
		
		return session.selectOne("member.selectMemberPhoneEmail",param);
	}

	@Override
	public int updatePassword(SqlSessionTemplate session, Map<String,String> param) {
	
		return session.update("member.updatePassword", param);
	}

	@Override
	public List<Product> salesSearch(SqlSessionTemplate session, Map param) {
		return session.selectList("member.salesSearch", param);
	}

	@Override
	public List<Member> buyList(SqlSessionTemplate session, String memberNo) {
		return session.selectList("member.buyList",memberNo);
	}

	@Override
	public List<Member> buySearch(SqlSessionTemplate session, Map param) {
		return session.selectList("member.buySearch", param);
	}
	
	@Override
	public int updateBalance(SqlSessionTemplate session, DealType type, Map<String, Object> param) {
		
		if(type==DealType.INPUT) {
			return session.update("member.plusBalance", param);
		}else {
			return session.update("member.minusBalance",param);
		}
	}

	@Override
	public int insertWallet(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.insert("member.insertWallet", param);
	}

	@Override
	public int shippingSelect(SqlSessionTemplate session, String memberNo) {
		return session.update("member.shippingSelect", memberNo);
	}
	
	

}
