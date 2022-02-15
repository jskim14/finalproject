package com.nb.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.common.DealType;
import com.nb.spring.member.model.vo.Member;
import com.nb.spring.member.model.vo.MessageBox;
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
	public List<Wallet> buyList(SqlSessionTemplate session, String memberNo) {
		return session.selectList("member.buyList",memberNo);
	}

	@Override
	public List<Wallet> buySearch(SqlSessionTemplate session, Map param) {
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
	public int updateDeliveryAddress(SqlSessionTemplate session, Map<String,String> param) {
		
		return session.update("member.updateDeliveryAddress", param);
	}

	@Override
	public List<Wallet> emoneyDetail(SqlSessionTemplate session, String memberNo) {
		return session.selectList("member.emoneyDetail", memberNo);
	}

	@Override
	public Member loginMemberKakao(SqlSessionTemplate session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.loginMemberKakao", param);
	}


	@Override
	public List<Wallet> emoneySelectList(SqlSessionTemplate session, Map param) {
		return session.selectList("member.emoneySelectList", param);
	}

	
	@Override
	public Member findMember(SqlSessionTemplate session, String nickName) {
		return session.selectOne("member.findMember", nickName);
	}
	
	@Override
	public int endRealTimeActionWallet(SqlSessionTemplate session, Map<String,Object> param) {
		return session.insert("member.endRealTimeActionWallet", param);
	}
	
	@Override
	public List<MessageBox> messageReceivList(SqlSessionTemplate session, String memberNo, int cPage, int numPerPage) {
		return session.selectList("member.messageReceivList", memberNo, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	@Override
	public int messageReceivListCount(SqlSessionTemplate session, String memberNo) {
		return session.selectOne("member.messageReceivListCount", memberNo);
	}
	
	@Override
	public int noCheckMsgCount(SqlSessionTemplate session, String memberNo) {
		return session.selectOne("member.noCheckMsgCount", memberNo);
	}
	
	@Override
	public List<MessageBox> messageSendList(SqlSessionTemplate session, String memberNo, int cPage, int numPerPage) {
		return session.selectList("member.messageSendList", memberNo, new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	
	@Override
	public int messageSendListCount(SqlSessionTemplate session, String memberNo) {
		return session.selectOne("member.messageSendListCount", memberNo);
	}
	
	@Override
	public MessageBox messageOne(SqlSessionTemplate session, int msgNo) {
		return session.selectOne("member.messageOne", msgNo);
	}
	
	@Override
	public int messageOneCheck(SqlSessionTemplate session, int msgNo) {
		return session.update("member.messageOneCheck", msgNo);
	}
	
	@Override
	public int insertSendMessageBox(SqlSessionTemplate session,MessageBox mb) {
		return session.insert("member.insertSendMessageBox", mb);
	}
	
	@Override
	public int insertReceivMessageBox(SqlSessionTemplate session,MessageBox mb) {
		return session.insert("member.insertReceivMessageBox", mb);
	}
	
	@Override
	public int deleteMessageBox(SqlSessionTemplate session,Map<String,Object> param) {
		return session.delete("member.deleteMessageBox", param);
	}
}
