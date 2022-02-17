<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<style>
    section{
       padding:180px 10%;
       min-height:800px;
    }
    #memberinfo{padding:30px; width:48%; height:130px; border-radius:20px; box-shadow:0px 0px 10px 2px lightgray;}
    #emoney-box{padding:30px; width:48%; height:130px; border-radius:20px; box-shadow:0px 0px 10px 2px lightgray;}
    .menu-div{display:flex; flex-wrap: wrap; justify-content: space-around; padding-top:30px;}
    .menu-box{
    width:22%; height:120px; justify-content:space-around; border-radius:20px;
	border:solid 1px none; color:black; font-size:18px; font-weigth:bold;
	box-shadow:0px 0px 10px 2px lightgray; background:white;}
	.menu-box:hover{background:yellow;color:black;}
	.myinfo-btn{background:lightskyblue;width:100px; height:36px;border-radius:10px;float:right;}
	.menu-box2{
    width:50%; height:120px; justify-content:space-around; border-radius:20px;
	border:solid 1px none; color:black; font-size:18px; font-weigth:bold;
	box-shadow:0px 0px 10px 2px lightgray; background:white;}
	.menu-box2:hover{background:navy;color:white;}
</style>
<<<<<<< HEAD

     <section>
     	<h2 style="text-align:center;"><i class="fas fa-box-check"></i>MY PAGE</h2><hr>
     	<div class="menu-div">
     		<div id="memberinfo" style="display:flex;">
     			<div style="min-width:80%;">
     			<span>안녕하세요,</span><br>
     			<h2 class="subTitle"><c:out value="${myPageMember.memberName }"/>
     			<span style="font-size:18px;">님의 등급은
     			<c:choose>
                	<c:when test="${myPageMember.rank eq 'DIAMOND' }">
	                    <img src="${path }/resources/images/rank/rank4.png" width=20px; height=20px;>
	                </c:when>
	                <c:when test="${myPageMember.rank eq 'GOLD' }">
	                    <img src="${path }/resources/images/rank/rank1.png" width=20px; height=20px;>
	                </c:when>
	                <c:when test="${myPageMember.rank eq 'SILVER' }">
	                    <img src="${path }/resources/images/rank/rank2.png" width=20px; height=20px;>
                    </c:when>
                    <c:when test="${myPageMember.rank eq 'BRONZE' }">
	                    <img src="${path }/resources/images/rank/rank3.png" width=20px; height=20px;>
                    </c:when>
                </c:choose>
     			<c:out value="${myPageMember.rank }"/> 입니다.</span>
     			</h2>
     			</div>
     			<div>
                	<button type="button" class="myinfo-btn" style="margin-bottom:10px;" onclick="location.assign('${path }/member/updateMyPage?memberNo=${loginMember.memberNo}');">내정보 관리</button><br>
	 				<button type="button" class="myinfo-btn" onclick="location.assign('${path }/member/deleteMemberView');">회원탈퇴</button>
	 			</div>
     		</div>
     		
     		<div id="emoney-box" style="display:flex;">
     			<div style="min-width:82%;">
     			<h2 class="subTitle">이머니 관리&nbsp
     			<a href="${path }/member/emoneyDetail?memberNo=${loginMember.memberNo}" class="aColor">
     			<i class="fas fa-cog" style="font-size:1.6rem; color:green;"></i></a></h2>
     			<a href="${path }/member/emoneyDetail?memberNo=${loginMember.memberNo}" class="aColor">
                    <span style="font-size: 20px">사용가능 잔액 </span> 
                    <span style="font-size:30px;"><fmt:formatNumber value="${myPageMember.balance }" pattern="#,###"/>원</span>
                </a>

                <div style="float: right;">
                     <button type="button" class="btn btn-secondary btnColor" style="height:78px; width:80px;" onclick="goToCharge()">충전<br>하기</button>
                </div>
             </div>
                    
     		</div>
     		
     		<div class="menu-div">
	 		<button type="button" class="menu-box" onclick="location.assign('${path}/product/todayView');">
	 			오늘본 상품<br>
	 			<i class="fas fa-eye" style="font-size:2rem;"></i>
	 		</button>
	 		<button type="button" class="menu-box" onclick="location.assign('${path }/member/myWishList?memberNo=${loginMember.memberNo}');">
	 			관심상품<br>
	 			<i class="far fa-bookmark" style="font-size:2rem;"></i>
	 		</button>

	 		<button class="menu-box2">
	 			<strong style="font-size:20px;">내 구매현황</strong><br>
	 			전체 <c:out value="${buyCnt.get(0)}"/>건&nbsp&nbsp&nbsp&nbsp
	            입찰중 <c:out value="${buyCnt.get(1)}"/>건&nbsp&nbsp&nbsp&nbsp
	            구매대기 <c:out value="${buyCnt.get(2)}"/>건&nbsp&nbsp&nbsp&nbsp
	            종료 <c:out value="${buyCnt.get(3)}"/>건
	 		</button>
	 		
 		</div>
 		<div class="menu-div">
	 		<button type="button" class="menu-box" onclick="location.assign('${path }/cs/myQna?memberNo=${loginMember.memberNo}');">
	 			내 문의내역<br>
	 			<i class="fas fa-question" style="font-size:2rem;"></i>
	 		</button>
	 		<button type="button" class="menu-box" onclick="location.assign('${path}/product/insertProduct')">
	 			물품 등록<br>
	 			<i class="fas fa-users" style="font-size:2rem;"></i>
	 		</button>
	 		<button class="menu-box2">
	 			<strong style="font-size:20px;">내 판매현황</strong><br>
	 			전체 <c:out value="${salesCnt.get(0)}"/>건&nbsp&nbsp&nbsp&nbsp
	 			판매대기 <c:out value="${salesCnt.get(1)}"/>건&nbsp&nbsp&nbsp&nbsp
				판매중 <c:out value="${salesCnt.get(2)}"/>건&nbsp&nbsp&nbsp&nbsp
				판매완료 <c:out value="${salesCnt.get(3)}"/>건&nbsp&nbsp&nbsp&nbsp
				종료 <c:out value="${salesCnt.get(4)}"/>건
	 		</button>
	 		
 		</div>
     
  </section>   

<%-- <<<<<<< HEAD
=======
                <div class="salesState">
                    <div class="myMenu " >
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle ">
                                <i class="fas fa-info-circle fa-lg"></i> 회원정보</li>
                            <a href="${path }/member/updateMyPage?memberNo=${loginMember.memberNo}" class="aColor">
                                <li class="list-group-item" > 나의정보 관리</li>
                            </a>
                            <a href="#" class="aColor">
                                <li class="list-group-item" >회원탈퇴</li>
                            </a>
                        </ul>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle "> 
                                <a href="${path}/product/todayView" class="aColor">
                                    <i class="fas fa-eye fa-lg"></i> 오늘 본 상품
                                </a>
                            </li>
                        </ul>  
                            
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle">
                                <a href="${path }/member/myWishList?memberNo=${loginMember.memberNo}" class="aColor">
                                    <i class="fas fa-heart fa-lg"></i> 관심상품
                                </a>
                            </li>
                        </ul>  
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle">
                                <a href="${path }/cs/myQna?memberNo=${loginMember.memberNo}" class="aColor">
                                    <i class="fas fa-headset fa-lg"></i> 내 문의내역
                                </a>
                            </li>
                        </ul>  
                    </div>
                </div>
                
            </div>
    
            <div class="">
                <div class="tit_h3 through"> 
                    <span class="lineSpan">물품등록</span> 
                </div>
                <div class="card" style="width:70%">
                    <div class="card-body">
                    	<div style="text-align: center">
	                        물품을 등록하여 경매에 판매할 수 있습니다. <br>
	                        등록 전, 아래 주의사항을 꼭 확인하여 주세요. <br><br>
	                        <span style="color:red; font-weight: bold;text-align: center">
	                        - 주의사항 -</span><br>
                        </div>
                        <div>
	                        1. 경매기간은 최대 14일까지 가능하며 재경매는 1회 가능합니다. <br>
	                        2. 물품등록이 요청된 후 관리자의 승인 후에 게시되며 관리자 승인 전 수정이 가능합니다.<br>
	                        3. 물품등록시 직거래를 유도하는 문구나 개인정보는 게시할 수 없습니다.<br>
	                        4. 부정확한 정보로 인하여 구매자의 신고를 받을 시에 제제를 받을 수 있습니다.<br>
                        </div>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary btnColor" onclick="location.assign('${path}/product/insertProduct')" style="margin-bottom: 20%;">물품 등록하기</button>
                    </div>
                </div>
            </div>
 --%>
<script>
	function goToCharge(){
		event.stopPropagation();
		let chargeWindow = window.open(location.origin+'/member/charge','_blank','width=400,height=500');
	}
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>