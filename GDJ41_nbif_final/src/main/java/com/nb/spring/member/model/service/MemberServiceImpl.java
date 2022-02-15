package com.nb.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.common.BalanceType;
import com.nb.spring.common.DealType;
import com.nb.spring.member.model.dao.MemberDao;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.member.model.vo.Wallet;
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
	
	public Member selectMemberNickName(String nickName) {
		
		return dao.selectMemberNickName(session, nickName);
	}

	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session, m);
	}

	@Override
	public Member selectMemberNamePhone(Map<String, String> param) {
		
		return dao.selectMemberNamePhone(session,param);
	}

	@Override
	public Member selectMemberPhoneEmail(Map<String, String> param) {
		
		return dao.selectMemberPhoneEmail(session,param);
	}

	@Override
	public int updatePassword(Map<String, String> param) {
		
		return dao.updatePassword(session,param);
	}

	@Override
	public List<Product> salesSearch(Map param) {
		return dao.salesSearch(session, param);
	}

	@Override
	public List<Wallet> buyList(String memberNo) {
		return dao.buyList(session, memberNo);
	}

	@Override
	public List<Wallet> buySearch(Map param) {
		return dao.buySearch(session, param);
	}

	@Override
	public int updateDeliveryAddress(Map<String,String> param) {
		
		return dao.updateDeliveryAddress(session,param);
	}

	
	@Override
	public int updateBalance(DealType type, Map<String, Object> param) {
		int result = dao.updateBalance(session, type,param);
		if(result>0) {
			result = dao.insertWallet(session,param);
			return result;
		}
		return 0;
	}

	@Override
	public List<Wallet> emoneyDetail(String memberNo) {
		List<Wallet> list = dao.emoneyDetail(session, memberNo);
		return list;
	}

	@Override
	public Member loginMemberKakao(Map param) {
		// TODO Auto-generated method stub
		return dao.loginMemberKakao(session, param);
	}

	public List<Wallet> emoneySelectList(Map param) {
		List<Wallet> list = dao.emoneySelectList(session, param);
		return list;
	}
	
	@Override
	public Member findMember(String nickName) {
		return dao.findMember(session, nickName);
	}
	
	@Override
	public int endRealTimeActionWallet(Map<String,Object> param) {
		return dao.endRealTimeActionWallet(session, param);
	}

	@Override
	public List<Map<String, Object>> sellerrank() {
		return dao.sellerrank(session);
	}

	@Override
	public List<Product> sellList(String memberNo) {
		return dao.sellList(session, memberNo);
	}
	
	
	
}
