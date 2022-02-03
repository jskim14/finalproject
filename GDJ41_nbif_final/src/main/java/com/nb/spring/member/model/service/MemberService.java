package com.nb.spring.member.model.service;

import java.util.Map;

import com.nb.spring.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Map<String, String> param);

	Member selectMemberNickName(String nickName);

	int insertMember(Member m);

	Member selectMemberNamePhone(Map<String, String> param);

	Member selectMemberPhoneEmail(Map<String, String> param);

	int updatePassword(Map<String,String> param);
}
