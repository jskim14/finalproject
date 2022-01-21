<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<style>
    section{
       padding:200px 5%;
    }
    #notice-title{text-align: center;}
    ul{list-style: none; display:flex;}
    li{margin-right:20px;}
</style>


        <section>
            
            <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                <label class="btn btn-outline-primary" for="btnradio1">공지사항</label>
              
                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                <label class="btn btn-outline-primary" for="btnradio2">자주 묻는 질문</label>
              
                <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                <label class="btn btn-outline-primary" for="btnradio3">1:1문의</label>
              </div>
              <div id="notice-title">
                <h2>공지사항</h2>
            </div>
            <br>
            <div style="width:100%; height:3px; background-color: lightskyblue;"></div>
            
            <table class="table table-hover">
                <tr>
                    <td style="padding-left:3%;">1</td>
                    <td style="padding-left:3%;">[공지] 연휴 배송 안내</td>
                    <td style="padding-left:3%;">등록일</td>
                </tr>
                <tr>
                    <td style="padding-left:3%;">2</td>
                    <td style="padding-left:3%;">[공지] 연휴 배송 안내</td>
                    <td style="padding-left:3%;">등록일</td>
                </tr>
                <tr>
                    <td style="padding-left:3%;">3</td>
                    <td style="padding-left:3%;">[공지] 연휴 배송 안내</td>
                    <td style="padding-left:3%;">등록일</td>
                </tr>
            </table>
    
        </section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>