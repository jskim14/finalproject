<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<style>
   #stateCount {
       margin: 0 ;
       text-align: center;
       border: 1px solid gray;
       padding: 3% 0 3% 0;
   }

   #stateContainer>div {
       padding-top: 3%;
   }
</style>
<section>
    <div class="row" style="padding: 15% 10%;"> 
       	<div id="stateContainer" class="row"> 
           	<div class="pageTitle row">
           		<span>판매현황</span>
           	</div> 
           	<div id="stateCount" class="row">
	            <div class="subMenuTitle col" >
	                전체<br> 0건
	            </div>
	            <div class="subMenuTitle col" >
	                <input type="hidden" name="waiting">
	                판매대기<br> 0건
	            </div>
	            <div class="subMenuTitle col" >
	                판매 중<br> 0건
	            </div>
	            <div class="subMenuTitle col" >
	                판매완료<br> 0건
	            </div>
	            <div class="subMenuTitle col" >
	                종료<br> 0건
	            </div>
           	</div>
			<div class="row" style="margin: 0; text-align: center;">
			    <div style="height: 200px;border: 1px solid gray;">
			        <!-- 검색 -->
			    </div>
			</div>
           <!-- ---------------------------------------- -->
           <!-- 
           		product테이블의 seller가 loginMember.memberNo 일치할때
           		for(product를 돌려 seller가 memberNo인 갯수만큼)           
           -->
			<c:if test="${empty productList }">
			<hr>
				판매를 등록한 물품이 없습니다. 
			</c:if>
			<c:if test="${not empty productList }">
				<!-- 상품내용 한줄 -->
				<c:forEach var="p" items="${productList}">
     				<div class="row" style="margin: 0; text-align: center; padding-top: 1% ">
						<hr>
						<div class="col-2">
						    <!-- 사진 -->
						    <!-- images 의 첫번째.... -->
						    <img src="resources/upload/product/29012223120026_683.png" 
						    alt="" style="width: 150px; height: 130px;">
						</div>
						<div class="col-6">
						    <!-- 중간 -->
						    <div class="row">
						    		<!-- 
						    		판매대기[승인여부 0(대기), 2(거부)] 
						    		판매중[status 0(판매중)], ==> && 승인여부 1
						    		판매완료[1(입완),2(발완),3(필요없음)],
						    		종료 [4(구매확정),5(신고)]
						    		-->
						        <div>
						        <c:choose>
						        	<c:when test="${p.permissionYn eq '0' or p.permissionYn eq '2' }">
						        		<strong><span style="font-size: 18px;float: left; color: #ef6253;">판매대기</span></strong>
						        	</c:when>
						        	<c:when test="${p.permissionYn eq '1' and p.productStatus eq '0' }">
					            		<strong><span style="font-size: 18px;float: left; color: #ef6253;">판매중</span></strong>
						        	</c:when>
						        	<c:when test="${p.permissionYn eq '1' 
						        	and (p.productStatus eq '1' or p.productStatus eq '2' or p.productStatus eq '3')}">
					            		<strong><span style="font-size: 18px;float: left; color: #ef6253;">판매완료</span></strong>
						        	</c:when>
						        	<c:when test="${p.permissionYn eq '1' 
						        	and (p.productStatus eq '4' or p.productStatus eq '5')}">
					            		<strong><span style="font-size: 18px;float: left; color: #ef6253;">종료</span></strong>
						        	</c:when>
						        </c:choose>
						        </div>
						        <div>
						            <span style="font-size: 23px; color:#333; float: left; font-weight: 550;  padding: 2% 0 2% 0; ">
						                <c:out value="${p.productName }"/>
						            </span>
						        </div>
						        <!-- 
						        수정하기[승인 0]
						        재등록하기[승인 2]
						        입금완료[status 1]
						        발송완료[status 2]
						        구매확정[status 4]
						         -->
						        <div>
						        <c:choose>
						        	<c:when test="${p.permissionYn eq '0' }">
						            	<button type="button" class="btn btn-secondary btnColor" onclick="" style="float: left;">
						            	수정하기 </button>
						        	</c:when>
						        </c:choose>
						        <c:choose>
						        	<c:when test="${p.permissionYn eq '2' }">
							            <button type="button" class="btn btn-secondary btnColor" style="float: left;">재등록하기 </button>
						        	</c:when>
						        </c:choose>
						        <c:choose>
						        	<c:when test="${p.permissionYn eq '1' and p.productStatus eq '1' }">
							            <button type="button" class="btn btn-secondary btnColor" style="float: left;">발송하기 </button>
						        	</c:when>
						        </c:choose>
						        <c:choose>
						        	<c:when test="${p.permissionYn eq '1' and p.productStatus eq '2' }">
							            <span style="font-size: 18px;float: left; color: gray;">발송완료</span>
						        	</c:when>
						        </c:choose>
						        <c:choose>
						        	<c:when test="${p.permissionYn eq '1' and p.productStatus eq '4' }">
							            <span style="font-size: 18px;float: left; color: gray;">구매확정</span>
						        	</c:when>
						        </c:choose>
						        
						        </div>
						    </div>
						</div>
					   	<div class="col-4" >
					       	<!-- 오른쪽 -->
							<div class="row" style="padding-top: 10%">
							<!-- 
							분기 7개 
							 -->
							 <c:choose>
							 	<c:when test="${p.permissionYn eq '0'}">
								    <div class="col">
								    	관리자의 승인을 기다리는 중입니다. 
								    </div>
						        </c:when>
							 	<c:when test="${p.permissionYn eq '2'}">
								    <div class="col">
								    	승인이 거절되었습니다. <br> 사유: 부적절한 사진 포함
								    </div>
						        </c:when>
							 	<c:when test="${p.permissionYn eq '1' and p.productStatus eq '0' }"> <!-- 판매중 -->
								    <div class="col">
								    	현재최고입찰가<br><c:out value="${p.nowBidPrice }"/>
								    </div>
							    	<div class="col">
								        최고입찰자<br><c:out value="${p.highestBidder }"/>
								    </div>
								    <div class="col">
								        마감일<br><c:out value="${p.endDate }"/>
								    </div>
						        </c:when>
						        <c:when test="${p.permissionYn eq '1' and p.productStatus eq '1' }"> <!-- 입완 -->
								    <div class="col">
								    	판매가<br><c:out value="${p.finalPrice }"/>
								    </div>
							    	<div class="col">
								        구매자<br><c:out value="${p.highestBidder }"/>
								    </div>
								    <div class="col">
								        구매일<br><c:out value="${p.endDate }"/>
								    </div>
						        </c:when>
						        <c:when test="${p.permissionYn eq '1' and p.productStatus eq '2' }"> <!-- 발완 -->
								    <div class="col">
								    	구매자가 물품을 확인하고 있습니다. 
								    </div>
						        </c:when>
						        <c:when test="${p.permissionYn eq '1' and p.productStatus eq '4' }"> 
								    <div class="col">
								    	거래가 종료되었습니다.
								    </div>
						        </c:when>
						        <c:when test="${p.permissionYn eq '1' and p.productStatus eq '5' }"> 
								    <div class="col">
								    	신고가 접수된 물품입니다. <br> 자세한 사항은 1:1 문의사항을 이용하여 주세요.
								    </div>
								    <div class="row">
								        <a href="#" class="aColor" style="color: gray;">문의사항 바로가기</a>
								    </div>
						        </c:when>
							 </c:choose>
							    
							</div>
					    </div>
					</div>
			    </c:forEach>
			</c:if>
        </div>
    </div>
</section>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>