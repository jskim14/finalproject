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
    .rank-box{
        width: 100%;
        height: 90px;
        border: solid 1px lightgray;
        border-left: solid 8px gray;
        box-shadow: 1px 1px darkgray;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        padding:20px 20px;
        vertical-align:middle;
    }
    #_rank{margin-left:1%;}
	#_id{margin-left:5%;}
    #_sym{margin-left:1%;}
	#_ing{margin-left:10%;}
	#_done{margin-left:10%;}
	#_review{margin-left:10%;}
	#_goods{margin-left:10%; text-align:center;}
    
</style>

     <section>
     	<div class>
            <h2><i class="fas fa-crown"></i>&nbsp&nbsp판매자 랭킹</h2>
            <p>1위부터 10위까지 판매자 랭킹입니다.</p>
            <br>
            <div>
            ${salesCnt.get(2)}
                <div class="rank-box">
                    <div id="_rank"><img src="${path }/resources/images/trophy1.png" width=50px; height=50px;></div>
                    <div id="_id"><p><strong style="font-size:21px;">판매자아이디</strong></p></div>
                    <div id="_sym">등급이미지</div>
                    <div id="_ing"><p>진행중인 경매<br>00 건</p></div>
                    <div id="_done"><p>판매 완료 상품<br>00 건</p></div>
                    <div id="_review"><p>구매후기<br>00 건</p></div>
                    <div id="_goods"><a href=""><strong>판매자 상품<br>보러가기</strong></a></div>
                </div>
                <div class="rank-box">
                    <div id="_rank"><img src="${path }/resources/images/trophy2.png" width=50px; height=50px;></div>
                    <div id="_id"><p><strong style="font-size:21px;">판매자아이디</strong></p></div>
                    <div id="_sym">등급이미지</div>
                    <div id="_ing"><p>진행중인 경매<br>00 건</p></div>
                    <div id="_done"><p>판매 완료 상품<br>00 건</p></div>
                    <div id="_review"><p>구매후기<br>00 건</p></div>
                    <div id="_goods"><a href=""><strong>판매자 상품<br>보러가기</strong></a></div>
                </div>
               <div class="rank-box">
                    <div id="_rank"><img src="${path }/resources/images/trophy3.png" width=50px; height=50px;></div>
                    <div id="_id"><p><strong style="font-size:21px;">판매자아이디</strong></p></div>
                    <div id="_sym">등급이미지</div>
                    <div id="_ing"><p>진행중인 경매<br>00 건</p></div>
                    <div id="_done"><p>판매 완료 상품<br>00 건</p></div>
                    <div id="_review"><p>구매후기<br>00 건</p></div>
                    <div id="_goods"><a href=""><strong>판매자 상품<br>보러가기</strong></a></div>
                </div>
                <div class="rank-box">
                    <div id="_rank"><h1>4</h1></div>
                    <div id="_id"><p><strong style="font-size:21px;">판매자아이디</strong></p></div>
                    <div id="_sym">등급이미지</div>
                    <div id="_ing"><p>진행중인 경매<br>00 건</p></div>
                    <div id="_done"><p>판매 완료 상품<br>00 건</p></div>
                    <div id="_review"><p>구매후기<br>00 건</p></div>
                    <div id="_goods"><a href=""><strong>판매자 상품<br>보러가기</strong></a></div>
                </div>
                
                
            </div>
            </div>
     	
     </section>
     
<jsp:include page="${path}/WEB-INF/views/common/footer.jsp"/>