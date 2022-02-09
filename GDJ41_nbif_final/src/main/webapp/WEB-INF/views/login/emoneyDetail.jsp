<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<style>
.emoneyBtn {
    width: 110px;
    height: 65px;
    font-size: 20px;
}
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
		        <span>사용가능 잔액</span>
		    </div> 
		    <div class="row" style="background-color:lightgray; margin: 0;"> 
				<div class="" style="display: flex; justify-content: center;">
					<div class="col-7" style="font-weight: bold; padding: 0 5% 3% 0; ">
						<span style="font-size: 20px;">이머니 잔액</span><br>
						<span style="font-size: 35px;">
						<fmt:formatNumber value="${m.balance }" pattern="#,###"/>원
						</span>
					</div>
					<div class="col-4" style=" padding: 1% 0 0 5%; ">
						<form action="${path }/member/emoneySelectList?memberNo=${loginMember.memberNo}" method="post">
				            <button type="submit" class="btn btn-secondary emoneyBtn" 
				             name="btnCategory" value="input">입금</button> 
				            <button type="submit" class="btn btn-secondary emoneyBtn" 
				             name="btnCategory" value="output">출금</button> 
				            <button type="submit" class="btn btn-secondary emoneyBtn" 
				             name="btnCategory" value="charge">충전</button>
			            </form>
		        	</div>
	    		</div>
			</div>
			<div class="row" >
		    <!-- 검색 -->
		    
			</div>
			<div id="listContainer" class="row" style="">
				<div class="row">
	        		<hr>
			        <table class="table table-borderless">
			            <tbody style="text-align: center;">
			            <c:if test="${empty list }">
			            	<div style="text-align: center">내역이 없습니다.</div>
			            </c:if>
			            <c:if test="${not empty list }">
			            	<c:forEach var="w" items="${list }">
			            		<c:if test="${w.category eq '0' }">
								<tr>
								  	<th scope="row" style="color: green; width: 20%; font-size: 18px; font-weight: bold;">
								    입금</th>
									<td style="width: 40%; text-align: left ;">
										<div style="font-weight: bold; font-size: 20px;">
											<c:out value="${w.productNo.productName }"/>
										</div>
										<c:if test="${w.categoryDetail eq '0' }">
											<span>판매완료 수익</span>
										</c:if>
										<c:if test="${w.categoryDetail eq '1' }">
											<span>입찰실패로 사용취소</span>
										</c:if>
										<c:if test="${w.categoryDetail eq '2' }">
											<span>포인트 충전</span>
										</c:if>
									</td>
									<td style="width: 15%;">
										<c:out value="${w.tradeDate }"/>
									</td>
									<td style="width: 15%; color: green">
										+<fmt:formatNumber value="${w.amount }" pattern="#,###"/>원
									</td>
								</tr>
								</c:if>
								<c:if test="${w.category eq '1' }">
								<tr>
								  	<th scope="row" style="color: red; width: 20%; font-size: 18px; font-weight: bold;">
								    출금</th>
									<td style="width: 40%; text-align: left ;">
										<div style="font-weight: bold; font-size: 20px;">
											<c:out value="${w.productNo.productName }"/>
										</div>
										<c:if test="${w.categoryDetail eq '3' }">
											<span>입찰시 사용</span>
										</c:if>
										<c:if test="${w.categoryDetail eq '4' }">
											<span>즉시구매시 사용</span>
										</c:if>
									</td>
									<td style="width: 15%;">
										<c:out value="${w.tradeDate }"/>
									</td>
									<td style="width: 15%; color: red">
										-<fmt:formatNumber value="${w.amount }" pattern="#,###"/>원
									</td>
								</tr>
				              	</c:if>
			              	</c:forEach>
		              	</c:if>
			            </tbody>
		            </table>
				</div>
	        </div>
	    </div>
	</div>
</section>

<script>

/* 	const emoneyBtn=(value=>{
		console.log(value);
		$.ajax({
			url: "/member/emoneySelectList",
			dataType:"json",
			data: {"category" : value , "memberNo" : '${loginMember.memberNo}'},
			success: data =>{
				console.log(data);
				for(let i=0; i<data.length; i++) {
					const category = data[i]['category'];
					const proName = data[i]['productNo']['productName'];
					const date = data[i]['tradeDate'];
					const amount = data[i]['amount'];
					$("#listContainer").html(category);
				}
				
			},
		})
	}) */


</script>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>