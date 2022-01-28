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
           
           <div class="row" style="margin: 0; text-align: center; "> 
               <hr>
               <!-- 상품내용 한줄 -->
               <div class="col-2">
                   <!-- 사진 -->
                   <img src="http://localhost:9090/resources/upload/exbag2.png" 
                   alt="" style="width: 150px; height: 130px;">
               </div>
               <div class="col-5">
                   <!-- 중간 -->
                   <div class="row">
                       <div>
                           <strong><span style="font-size: 18px;float: left; color: #ef6253;">판매대기</span></strong>
                       </div>
                       <div>
                           <span style="font-size: 30px;float: left; font-weight: 600;  padding: 2% 0 2% 0; ">
                               상품이름 레고심슨하우스
                           </span>
                       </div>
                       <div>
                           <button type="button" class="btn btn-secondary btnColor" style="float: left;">수정하기 </button>
                           <span style="font-size: 18px;float: left; color: gray;">발송완료/구매확정</span>
                       </div>
                   </div>
                   
               </div>
               <div class="col-5" >
                   <!-- 오른쪽 -->
                   <div class="row" style="padding-top: 10%">
                       <div class="col">
                           신고가 접수된 물품입니다. <br>신고가 접수된 물품입니다. 
                       </div>
                       <div class="col">
                           최고입찰자<br>sunny
                       </div>
                       <div class="col">
                           구매일<br>2022-01-18
                       </div>
                       <!-- <div class="row">
                           <a href="#" class="aColor" style="color: gray;">문의사항 바로가기</a>
                       </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>