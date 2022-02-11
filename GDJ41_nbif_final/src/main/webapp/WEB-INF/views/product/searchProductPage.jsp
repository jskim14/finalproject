<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<div>
			<c:if test="${not empty searchProduct }">
			<ul style="overflow: hidden;">
				<c:forEach var="p" items="${searchProduct }">
					<li style="width: 25%;">
						<a href="${path }/product/productDetail?productNo=${p.productNo}">
							<div class="goods-box">
								<c:if test="${not empty p.images}">
								<img src="${path }/resources/upload/product/${p.images.get(0).imageName}"
								width="100%" height="200" style="margin-bottom: 12px; border-radius: 20px;">
								</c:if>
								<c:if test="${empty p.images}">
								<img src="${path }/resources/images/"
								width="100%" height="200" style="margin-bottom: 12px; border-radius: 20px;">
								</c:if>
								<p>
									<strong style="font-size: 15px">${p.productName }</strong><br>
									<c:if test="${p.nowBidPrice != null }">
									현재입찰가&nbsp;<span class="price1"><fmt:formatNumber value="${p.nowBidPrice }"/></span><br>
									</c:if>
									<c:if test="${p.nowBidPrice == null }">
									현재입찰가&nbsp;<span class="price1"><fmt:formatNumber value="${p.minBidPrice }"/></span><br>
									</c:if>
									<c:if test="${p.buyNowPrice != null }">
									즉시구매가&nbsp;<span class="price2"><fmt:formatNumber value="${p.buyNowPrice }"/></span><br>
									</c:if>
									<c:if test="${p.buyNowPrice == null }">
									즉시구매불가<br>
									</c:if>
									판매자&nbsp;<strong>${p.seller.nickName }</strong>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
			</c:if>
	</div>