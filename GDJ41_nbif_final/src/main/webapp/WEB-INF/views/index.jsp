<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${path}/WEB-INF/views/common/header.jsp"/>
<section>
	<div style="height: 150px"></div>
	<a href="${path }/product/productDetail/">제품 상세 화면 </a>
</section>
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp"/>
