<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<section style="padding: 100px 10%;">
	<div class="container-fluid">
		<div class="row d-flex justify-content-center">
			<div class="col">
				<h4>회원관리</h4>
			</div>
		</div>
	</div>
	<div class="row ">
		<div class="col d-flex justify-content-end">
			<select id="rowCount" name="rowCount">
				<option value="10" selected>10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">회원번호</th>
			      <th scope="col">아이디</th>
			      <th scope="col">닉네임</th>
			      <th scope="col">전화번호</th>
			      <th scope="col">가입일</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>1</td>
			      <td>Mark</td>
			      <td>Otto</td>
			      <td>@mdo</td>
			      <td>@mdo</td>
			    </tr>
			   
			  </tbody>
			</table>
		</div>
	</div>
</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>