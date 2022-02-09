package com.nb.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.nb.spring.common.DealType;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.member.model.vo.Wallet;
import com.nb.spring.product.model.vo.Product;

public interface MemberService {

	Member loginMember(Map<String, String> param);
	
	Member selectMember(String memberNo);
	
	List<Product> salesList(String memberNo);

	Member selectMemberNickName(String nickName);

	int insertMember(Member m);

	Member selectMemberNamePhone(Map<String, String> param);

	Member selectMemberPhoneEmail(Map<String, String> param);

	int updatePassword(Map<String,String> param);
	
	List<Product> salesSearch(Map param);
	
	List<Member> buyList(String memberNo);
	
	List<Member> buySearch(Map param);

	int updateBalance(DealType type, Map<String, Object> param);
	
	int updateDeliveryAddress(Map<String,String> param);
	
	List<Wallet> emoneyDetail(String memberNo);

	Member loginMemberKakao(Map param);

}
