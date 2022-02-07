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
   
   #centerRow>div {
   		padding-bottom: 5px;
   }
   
</style>
<section>
    <div class="row" style="padding: 15% 10%;"> 
       	<div id="stateContainer" class="row"> 
           	<div class="pageTitle row">
           		<span>구매현황</span>
           	</div> 
           	<div id="stateCount" class="row">
	            <div class="subMenuTitle col" >
	               <div>전체<br> 
	               <c:out value="${salesCnt.get(0)}"/>건 </div>
	            </div>
	            <div class="subMenuTitle col" >
	               <div>입찰중<br> 
	               <c:out value="${salesCnt.get(1)}"/>건 </div>
	            </div>
	            <div class="subMenuTitle col" >
	               <div>구매대기<br> 
	               <c:out value="${salesCnt.get(2)}"/>건 </div>
	            </div>
	            <div class="subMenuTitle col" >
	               <div>종료<br> 
	               <c:out value="${salesCnt.get(3)}"/>건 </div>
	            </div>
           	</div>
			<div class="row" style="">
			<form action="${path }/member/buySearch?memberNo=2" method="post">
			<input type="hidden" name="count" value="${salesCnt.get(0) }">
			<input type="hidden" name="count" value="${salesCnt.get(1) }">
			<input type="hidden" name="count" value="${salesCnt.get(2) }">
			<input type="hidden" name="count" value="${salesCnt.get(3) }">
			    <div class="row" style="height: 70px; background-color:lightgray; margin: 0; text-align: center; padding: 1% 0 1% 10%;">
			        <!-- 검색 -->
			        <div class="col-3"> 
			        	<select class="form-select" name="status" aria-label="Default select example" style="width: 200px; color: gray; float:right" required>
	                        <option selected>---물품상태---</option>
	                        <option value="입찰중">입찰중</option> <!-- 승인 0,2 -->
	                        <option value="구매대기">구매대기</option> <!-- 승인1&&상태0 -->
	                        <option value="종료">종료</option>
                        </select>
			        </div>
			        <div class="col-7">
			        	경매기간 &nbsp;<input type="date"  id="startDate" class="form-control" name="startDate" style="width: 180px; display:inline;" >&nbsp; ~
                        &nbsp;<input type="date" id="endDate" class="form-control" name="endDate" style="width: 180px; display:inline;">&nbsp;                        
			        </div>
			        <div class="col-2">
			        	<button type="submit" class="btn btn-secondary btnColor" style="float:left;">조회하기</button>
			        </div>
			    </div>
			</form>
			</div>
           <!-- ---------------------------------------- -->
           <!-- 
           		         
           -->
           
         <!--   ${productList[0].productNo.productStatus } 이 형태다 -->
 			<c:if test="${empty productList }">
				<div style="text-align: center">
				<hr>
				구매한 물품이 없습니다. 한번 구매해봐~~
				</div>
			</c:if>
			<c:if test="${not empty productList }">
				<!-- 상품내용 한줄 -->
				<c:forEach var="p" items="${productList}">
				
     				<div class="row" style="margin: 0; text-align: center;">
						<hr>
						<div class="col-2">
						    <!-- 사진 -->
						    <!-- images 의 첫번째.... -->
						    <img src="/resources/upload/product/29012223120026_683.png" 
						    alt="" style="width: 150px; height: 130px;">
						</div>
						<div class="col-6">
						    <!-- 중간 -->
						    <div id="centerRow" class="row">
						    		<!-- 
						    		입찰중[디테일4(입찰시)] && 상태 0(판매중) 
						    		구매대기[디테일4(입찰시)], && 상태 1(입완)
						    		구매대기[디테일4(입찰시)], && 상태 2(발완) => 구매확정, 신고버튼
						    		종료 [디테일4(입찰시)] && 상태 4(구매확정),5(신고)
						    		종료 [디테일4(입찰시)] && 같지않고 
						    		-->
						        <div>
						        <c:choose>
						        	<c:when test="${p.productNo.productStatus eq '0' }">
						        		<strong><span style="font-size: 18px;float: left; color: #ef6253;">입찰중</span></strong>
						        	</c:when>
						        	<c:when test="${(p.productNo.productStatus eq '1' or p.productNo.productStatus eq '2') 
						        	and p.productNo.highestBidder.memberNo eq loginMember.memberNo }">
						        		<strong><span style="font-size: 18px;float: left; color: #ef6253;">구매대기</span></strong>
						        	</c:when>
						        	<c:when test="${(p.productNo.productStatus eq '3' or p.productNo.productStatus eq '4' or p.productNo.productStatus eq '5') 
						        	and p.productNo.highestBidder.memberNo eq loginMember.memberNo }">
						        		<strong><span style="font-size: 18px;float: left; color: #ef6253;">종료</span></strong>
						        	</c:when>
						        	<c:when test="${p.productNo.productStatus ne '0' and p.productNo.highestBidder.memberNo ne loginMember.memberNo }">
						        		<strong><span style="font-size: 18px;float: left; color: #ef6253;">종료</span></strong>
						        	</c:when>
						        </c:choose>
						        </div>
						        <div >
						        <span style="float: left; font-size:12px;">
							 		<c:out value="${p.productNo.productNo }"/>
							 	</span>
							 	</div>
						        <div>
						            <span style="font-size: 23px; color:#333; float: left; font-weight: 550;   ">
						                <c:out value="${p.productNo.productName }"/>
						            </span>
						        </div>
						        <!-- 
						        배송대기[디테일4(입찰시)], && 상태 1(입완) / 발송전
						        구매대기 버튼 두개 [디테일4(입찰시)], && 상태 2(발완) => 구매확정, 신고버튼 /발송버튼 눌렀을때
						         -->
						        <div>
						        <c:choose>
						        	<c:when test="${p.productNo.productStatus eq '1' and p.productNo.highestBidder.memberNo eq loginMember.memberNo }">
							            <span style="font-size: 18px;float: left; color: gray;">배송대기</span>
						        	</c:when>
						        	<c:when test="${(p.productNo.productStatus eq '2' or p.productNo.productStatus eq '3') and p.productNo.highestBidder.memberNo eq loginMember.memberNo }">
						            	<button type="button" class="btn btn-secondary btnColor" style="float: left; margin-right: 1%;"
						            	onclick="">
						            	구매확정 </button> 
						            	<button type="button" class="btn btn-secondary btnColor" style="float: left;"
						            	onclick="">
						            	신고(환불신청) </button>
						        	</c:when>
						        </c:choose>					        
						        </div>
						    </div>
						</div>
					   	<div class="col-4" >
					       	<!-- 오른쪽 -->
							<div class="row" style="padding-top: 13%"> <!--  -->
							<!-- 
							분기 7개 
							 -->
							 <c:choose>
							 	<c:when test="${p.productNo.productStatus eq '0' }"> <!-- 입찰중 -->
								    <div class="col">
								    	내가입찰<br><c:out value="${p.amount }"/>
								    </div>
							    	<div class="col">
								        현재입찰가<br><c:out value="${p.productNo.nowBidPrice }"/>
								    </div>
								    <div class="col">
								        마감일<br><c:out value="${p.productNo.endDate }"/>
								    </div>
						        </c:when>
						        <c:when test="${(p.productNo.productStatus eq '2' or p.productNo.productStatus eq '3') 
						        and p.productNo.highestBidder.memberNo eq loginMember.memberNo }"> <!-- 구매대기(입완) -->
								    <div class="col">
								    	최종구매가격<br><c:out value="${p.productNo.finalPrice }"/>
								    </div>
							    	<div class="col">
								        판매자<br><c:out value="${p.productNo.seller.nickName }"/>
								    </div>
								    <div class="col">
								        구매일<br><c:out value="${p.tradeDate }"/>
								    </div>
						        </c:when>
						        <c:when test=""> <!-- 종료 -->
								    <div class="col">
								    	거래가 종료되었습니다. <br> 자세한 사항은 1:1 문의사항을 이용하여 주세요.
								    </div>
								    <div class="row">
								        <a href="#" class="aColor" style="color: gray;">문의사항 바로가기</a>
								    </div>
						        </c:when>
						        <c:when test="${p.productNo.productStatus ne '0' and p.productNo.highestBidder.memberNo ne loginMember.memberNo }">
								    <div class="col">
								    	낙찰에 실패하였습니다. 
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
    <script>
	$(()=>{
	    var date = new Date();
	    date.setMonth(date.getMonth() - 3);
	    $("#startDate").val(date.toISOString().substring(0, 10));
	    var date = new Date();
	    $("#endDate").val(date.toISOString().substring(0, 10));
	});

    
    </script>
</section>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>