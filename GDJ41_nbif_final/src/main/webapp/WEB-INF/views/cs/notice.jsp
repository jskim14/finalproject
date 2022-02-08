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
    
    .accordion_area .btn_toggle{display:block;width:100%;height:30px;padding:0 10px;background:#fff;font-size:16px;text-align:left;line-height:30px;box-sizing:border-box}
	/* .accordion_area .btn_toggle::before{display:inline;content:'Q: '} */
	.accordion_area .content_area{display:none;padding:10px;background:#f4f4ff}
	/* .accordion_area .content_area::before{display:inlnie;content:'A: '} */
	.accordion_area .content_area.act{display:block; width:80%;}
</style>

        <section>
            
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <button type="button" id="btn1" class="btn btn-outline-dark" onclick="location.assign('${path }/cs/noticeList');">공지사항</button>
                <button type="button" id="btn2" class="btn btn-outline-dark" onclick="location.assign('${path }/cs/qnaList');">1:1 문의</button>
            </div>
              
            <div id="cs-title">
            	<h2 id="title">공지사항</h2>
            </div>
            <c:if test="${loginMember.memberNo eq '5' }">
            	<div style="float:right;"> 
					<button type="button" class="btn btn-warning" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">공지사항 등록</button>
				<!-- 모달창 -->
					<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
							<form name="reportForm" action="${path }/cs/insertNotice" method="POST">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel"
										style="color: black;">공지사항 등록</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" style="color: black;">
									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">제목</label>
										<input type="text" class="form-control" name="noticeTitle"
											id="exampleFormControlInput1" placeholder="제목을 작성하세요" required>
									</div>
									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">내용</label>
										<textarea class="form-control" id="exampleFormControlTextarea1" name="noticeContent"
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
	            		<th style="padding-left:5%" class="table-dark">작성일</th>
            		</tr> 
            	</thead>
            	
            	<tbody id="cslist">
            	<c:forEach items="${noticeList }" var="n">
            		<tr>
            			<td style="padding-left:5%"><c:out value="${n.noticeNo}"/></td>
            			<td class="accordion_area" style="padding-left:10%">
            			<button class="btn btn_toggle"><c:out value="${n.noticeTitle }"/></button>
					      	<div class="content_area">
     						 	<c:out value="${n.noticeContent }"/>
     						</div>
            			</td>
            			<td style="padding-left:5%"><c:out value="${n.noticeWriteDate}"/></td>
            		</tr>
            	</c:forEach>
            		
            	</tbody>
            </table>
            
        </section>
        <script>
        	$("#btn1").addClass("active");
        	
        	function bindingAccordionEvent(wrap){
         	   let areaArr = document.querySelectorAll(wrap);
         	   
         	   areaArr.forEach(function(area){
         	      let hasGroup = area.dataset['group'] !== undefined ? true : false;
         	      let btn = area.querySelector('.btn_toggle');
         	     
         	     btn.addEventListener('click', function(){
         	       if(hasGroup === true){
         	         let name = area.dataset['group'];
         	         let groupArr = document.querySelectorAll(wrap + '[data-group="'+ name +'"]');
         	         let thisContent = area.querySelector('.content_area');
         	         
         	         groupArr.forEach(function(group){
         	            let content = group.querySelector('.content_area');
         	           content.classList.remove('act');
         	         });
         	         thisContent.classList.add('act');
         	       }else{
         	         let content = area.querySelector('.content_area');
         	         content.classList.toggle('act');
         	       }
         	     });
         	   });
         	 }

         	 bindingAccordionEvent('.accordion_area');
        	
        </script>

<jsp:include page="${path }/WEB-INF/views/common/footer.jsp"/>