<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<style>
	*{margin:0 auto;}

</style>
<section>
    <div id="totalContainer">
        <div class="pageTitle">
            <span>MY PAGE</span>
        </div>
        <div id="mainInfo" class="row">
            <div class="col-7 card">
                <div id="infoLeft" class="card-body infobox" >
                    <div class="subMenuTitle" >
                        <i class="fas fa-user fa-4x" ></i>
                        <span style="font-size: 25px;"><c:out value="${myPageMember.memberName }"/></span>
                        <span>님의 등급은 <c:out value="${myPageMember.rank }"/> 입니다.
                        </span>
                    </div>
                    <div >
                        <div >
                            <i class="fas fa-envelope-open-text fa-4x" ></i>
                        </div>
                        <div>
                            <span class="subMenuTitle">나의 쪽지함</span><br>
                            <span>쪽지</span> <a href="#" class="aColor"> 0건</a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="${path }/member/emoneyDetail?memberNo=${loginMember.memberNo}" class="col-4 card aColor">
                <div id="infoRight" class="card-body infobox" style="margin: 0;">
                    <span class="subMenuTitle" >이머니관리</span><br>
                    <div style="margin-top: 3%;">
                        <span style="font-size: 20px">사용가능 잔액 </span> 
                        <span><fmt:formatNumber value="${myPageMember.balance }" pattern="#,###"/>원</span>
                        <div style="float: right;">
                            <button type="button" class="btn btn-secondary btnColor" onclick="goToCharge()">충전하기</button>
                        </div>
                    </div>
                </div>
            </a>
        </div>

        <div id="myMenuTotal">
            <div class="">
                <div class="tit_h3 through "> 
                    <span class="lineSpan">MENU</span>                   
                </div>

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
                                <a href="#" class="aColor">
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

            <div class="">
                <div class="tit_h3 through"> 
                    <span class="lineSpan">구매현황</span>                   
                </div>
                <a href="${path }/member/buyStates?memberNo=${loginMember.memberNo}" class="aColor">
                    <div class="myMenu card">
                        <div class="card-body salesState">
                            <div class="subMenuTitle col" >
	               <div style="color:#7f47e9">전체<br> 
	               <c:out value="${buyCnt.get(0)}"/>건 </div>
	            </div>
	            <div class="subMenuTitle col" >
	               <div>입찰중<br> 
	               <c:out value="${buyCnt.get(1)}"/>건 </div>
	            </div>
	            <div class="subMenuTitle col" >
	               <div>구매대기<br> 
	               <c:out value="${buyCnt.get(2)}"/>건 </div>
	            </div>
	            <div class="subMenuTitle col" >
	               <div>종료<br> 
	               <c:out value="${buyCnt.get(3)}"/>건 </div>
	            </div>
                        </div>  
                    </div>
                </a>
            </div>

            <div class="">
                <div class="tit_h3 through"> 
                    <span class="lineSpan">판매현황</span>                   
                </div>
                <a href="${path }/member/salesStates?memberNo=${loginMember.memberNo}" class="aColor">
                    <div class="myMenu card">
                        <div class="card-body salesState">
                            <div class="subMenuTitle col">
                                <div style="color:#7f47e9">전체<br>
	                			<c:out value="${salesCnt.get(0)}"/>건 </div>
                            </div>
                            <div class="subMenuTitle col" >
				                <div>판매대기<br>
				                <c:out value="${salesCnt.get(1)}"/>건 </div>
				            </div>
				            <div class="subMenuTitle col" >
				                <div>판매중<br>
				                <c:out value="${salesCnt.get(2)}"/>건 </div>
				            </div>
				            <div class="subMenuTitle col" >
				                <div>판매완료<br>
				                <c:out value="${salesCnt.get(3)}"/>건 </div>
				            </div>
				            <div class="subMenuTitle col" >
				                <div>종료<br>
				                <c:out value="${salesCnt.get(4)}"/>건 </div>
				            </div>
                    	</div>  
                   </div>
                </a>
            </div>
        </div>
    </div>
</section>
<script>
	function goToCharge(){
		event.stopPropagation();
		let chargeWindow = window.open(location.origin+'/member/charge','_blank','width=400,height=500');
	}
	
	
</script>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>