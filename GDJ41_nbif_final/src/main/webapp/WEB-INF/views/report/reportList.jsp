<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

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
	                    <th class="table-dark" style="text-align:center; min-width:50px;">물품번호</th>
	                    <th style="text-align:center;" class="table-dark">상품명</th>
	                    <th class="table-dark">아이디</th>
	                    <th class="table-dark">신고일</th>
	                    <th class="table-dark">신고결과</th>
	                    <th class="table-dark">상세보기</th>
                    </tr>
                </thead>
              
                <c:if test="${not empty reportList }">
                <c:forEach items="${reportList }" var="r" varStatus="status">
                <tr>
                    <td style="text-align:center; min-width:50px;"><c:out value="${r.reportProduct.productNo }"/></td>
                    <td><c:out value="${r.reportProduct.productName }"/></td>
                    <td><c:out value="${r.reportMember.nickName }"/></td>
                    <td><c:out value="${r.reportDate }"/></td>
                    <td>
                    <c:if test="${r.reportResult == null}">
                    <span style="color:tomato">처리 전</span>
                    </c:if>
                    <c:if test="${r.reportResult != null}">
                    <span style="color:royalblue">완료</span>
                    </c:if>
                    </td>
                    
                    <td><button type="button" class="btn btn-warning" data-bs-toggle="modal" id="openModal_"
						data-bs-target="#staticBackdrop${status.count }">보기</button></td>
						<!-- 모달창 -->
					<div class="modal fade" id="staticBackdrop${status.count }" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
							<form name="reportForm" action="${path }/report/insertReportReason" method="POST">
								<div class="modal-header">	
									<h5 class="modal-title" id="staticBackdropLabel"
										style="color: black;">신고내용</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="color: black;">
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">신고 상품명</label>
										<input type="text" class="form-control"
											id="productName" value="${r.reportProduct.productName }" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">신고사유</label>
										<input type="text" class="form-control"
											id="reportReason" value="${r.reportReason }" readonly>
									</div>
									<div class="mb-3" id="reportImage">
										<label for="exampleFormControlTextarea1" class="form-label">첨부 이미지</label><br>
										<c:forEach items="${r.reportImages }" var="ri">
											<img src="${path }/resources/upload/report/${ri.fileName}" width="135px;" height="135px;" style="margin-left:15px;">
										</c:forEach>  
									</div>
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">처리 결과</label>
										 <c:if test="${r.reportResult != null}">
										<input type="text" class="form-control" id="exampleFormControlTextarea1" name="reportResult"
											value="${r.reportResult }" readonly>
										</c:if>
										<c:if test="${r.reportResult == null}">
										<input type="text" class="form-control" id="exampleFormControlTextarea1" name="reportResult">
										</c:if>
									</div>
									<input type="hidden" value="${r.reportProduct.productNo }" name="productNo">
								</div>
								
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-warning">등록</button>
								</div>
								</form>
							</div>
						</div>
					</div>
					
                </tr>
                </c:forEach>
                </c:if>
                
            </table>
            
            <div>${pageBar }</div>
     </section>
     
     <script>
     </script>
     
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>