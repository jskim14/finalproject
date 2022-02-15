<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${path}/WEB-INF/views/common/header.jsp"/>

<style>
    section{
       padding:200px 10%;
       min-height:800px;
    }
</style>

     <section>
 		<div>
            <h3><i class="fas fa-exclamation"></i>&nbsp&nbsp물품 신고 내역</h3>
            </div>
            <p></p>
            <br>
            <table class="table table-hover">
                <thead>
                	<tr>
	                    <th class="table-dark">물품번호</th>
	                    <th class="table-dark">상품명</th>
	                    <th class="table-dark">이미지</th>
	                    <th class="table-dark">아이디</th>
	                    <th class="table-dark">신고사유</th>
	                    <th class="table-dark">신고결과</th>
	                    <th class="table-dark">신고일</th>
                    </tr>
                </thead>
              
                <c:if test="${not empty reportList }">
                <c:forEach items="${reportList }" var="r">
                <tr>
                    <td><c:out value="${r.reportProduct.productNo }"/></td>
                    <td><c:out value="${r.reportProduct.productName }"/></td>
                    <td></td>
                  <%--  <c:if test="${not empty r.get(0).filename}">
                    	<td><img src="${path }/resources/upload/report/${r.filename}"></td>
                    </c:if> --%>
                    <td><c:out value="${r.reportMember.nickName }"/></td>
                    <td><c:out value="${r.reportReason }"/></td>
                    <td><c:out value="${r.reportResult }"/></td>
                    <td><c:out value="${r.reportDate }"/></td>
                </tr>
                </c:forEach>
                </c:if>
                
            </table>
            
            <div>${pageBar }</div>
     </section>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp"/>