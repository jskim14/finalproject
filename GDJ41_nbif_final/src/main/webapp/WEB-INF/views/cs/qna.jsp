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
    #cs-title{text-align: center;}
    
    
</style>

        <section>
            
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <button type="button" id="btn1" class="btn btn-outline-dark" onclick="location.assign('${path }/cs/noticeList');">공지사항</button>
                <button type="button" id="btn2" class="btn btn-outline-dark" onclick="location.assign('${path }/cs/qnaList');">1:1 문의</button>
            </div>
              
            <div id="cs-title">
            	<h2 id="title">1:1 문의</h2>
            </div>
            <c:if test="${not empty loginMember}">
            	<div style="float:right;"> 
					<button type="button" class="btn btn-warning" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">문의 쓰기</button>
				<!-- 모달창 -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
							<form name="reportForm" action="${path }/cs/insertQuestion" method="POST">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel"
										style="color: black;">문의 등록</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="color: black;">
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">문의사항</label>
										<input type="text" class="form-control" name="qnaTitle"
											id="exampleFormControlInput1" placeholder="제목을 작성하세요" required>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">내용</label>
										<textarea class="form-control" id="exampleFormControlTextarea1" name="qnaContent"
											rows="3"></textarea>
									</div>
									<input type="hidden" name="memberNo" value="${loginMember.memberNo }">
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
            	</div>
            		<br>
            </c:if>
            <br>
            
            <table class="table table-hover">
            	<thead id="thead">
            		 <tr>
	            		<th style="padding-left:5%" class="table-dark">#</th>
	            		<th style="padding-left:10%" class="table-dark">제목</th>
	            		<th style="padding-left:10%" class="table-dark">작성자</th>
	            		<th style="padding-left:10%" class="table-dark">작성일</th>
            		</tr> 
            	</thead>
            	
            	<tbody id="cslist">
            	<c:forEach items="${qnaList }" var="q">
            		<tr>
            			<td style="padding-left:5%"><c:out value="${q.qnaNo}"/></td>
            			<td style="padding-left:10%">
            				<a href="${path }/cs/qnaContent?qnaNo=${q.qnaNo}" style="text-decoration:none;color:black;"><c:out value="${q.qnaTitle}"/></a>
            			</td>
            			<td style="padding-left:10%"><c:out value="${q.writer.memberNickName}"/></td>
            			<td style="padding-left:10%"><c:out value="${q.questionDate}"/></td>
            		</tr>
            	</c:forEach>
            		
            	</tbody>
            </table>
            
            <div>
            	${pageBar }
            </div>
            
        </section>
        <script>
        	$("#btn2").addClass("active");
        	
        	
        </script>
        

<jsp:include page="${path }/WEB-INF/views/common/footer.jsp"/>