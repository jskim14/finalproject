package com.nb.spring.member.model.service;

import java.util.Map;

import com.nb.spring.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Map<String, String> param);
}
