<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<style>
	*{margin:0 auto;}
</style>
<section>
    <div id="totalContainer">
        <div class="pageTitle">
            <span>MY PAGE</span>
        </div>
        <div id="mainInfo" class="row">
            <div class="col-7 card">
                <div id="infoLeft" class="card-body infobox" >
                    <div class="subMenuTitle" >
                        <i class="fas fa-user fa-4x" ></i>
                        <span style="font-size: 25px;">000</span>
                        <span>님의 등급은 000 입니다.
                        </span>
                    </div>
                    <div >
                        <div >
                            <i class="fas fa-envelope-open-text fa-4x" ></i>
                        </div>
                        <div>
                            <span class="subMenuTitle">나의 쪽지함</span><br>
                            <span>쪽지</span> <a href="#" class="aColor"> 0건</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4 card">
                <div id="infoRight" class="card-body infobox" style="margin: 0;">
                    <span class="subTitle" >이머니관리</span><br>
                    <div style="margin-top: 3%;">
                        <span style="font-size: 20px">사용가능 잔액 </span> <span>00000원</span>
                        <div style="float: right;">
                            <button type="button" class="btn btn-secondary btnColor">충전</button>
                            <button type="button" class="btn btn-secondary btnColorOther">사용</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="myMenuTotal">
            <div class="">
                <div class="tit_h3 through "> 
                    <span class="lineSpan">MENU</span>                   
                </div>

                <div class="salesState">
                    <div class="myMenu " >
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle ">
                                <i class="fas fa-info-circle fa-lg"></i> 회원정보</li>
                            <a href="#" class="aColor">
                                <li class="list-group-item" > 나의정보 관리</li>
                            </a>
                            <a href="#" class="aColor">
                                <li class="list-group-item" >회원탈퇴</li>
                            </a>
                        </ul>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle "> 
                                <a href="#" class="aColor">
                                    <i class="fas fa-eye fa-lg"></i> 오늘 본 상품
                                </a>
                            </li>
                        </ul>  
                            
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle">
                                <a href="#" class="aColor">
                                    <i class="fas fa-heart fa-lg"></i> 관심상품
                                </a>
                            </li>
                        </ul>  
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item subMenuTitle">
                                <a href="#" class="aColor">
                                    <i class="fas fa-headset fa-lg"></i> 내 문의내역
                                </a>
                            </li>
                        </ul>  
                    </div>
                </div>
                
            </div>
    
            <div class="">
                <div class="tit_h3 through"> 
                    <span class="lineSpan">물품등록</span> 
                </div>
                <div class="myMenu card">
                    <div class="card-body">
                        물품을 등록하자 물품을 등록할 때의 유의사항은 이러하다. <br>
                        1. 어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고<br>
                        2. 어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고<br>
                        3. 어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고<br>
                    </div>
                    <div>
                        <button type="button" class="btn btn-secondary btnColor" onclick="location.assign('${path}/product/insertProduct')" style="margin-bottom: 20%;">물품 등록하기</button>
                    </div>
                </div>
            </div>

            <div class="">
                <div class="tit_h3 through"> 
                    <span class="lineSpan">구매현황</span>                   
                </div>
                <a href="#" class="aColor">
                    <div class="myMenu card">
                        <div class="card-body salesState">
                            <div class="subMenuTitle" >
                                전체<br> 0건
                            </div>
                            <div class="subMenuTitle" >
                                입찰 중<br> 0건
                            </div>
                            <div class="subMenuTitle" >
                                구매대기<br> 0건
                            </div>
                            <div class="subMenuTitle" >
                                종료<br> 0건
                            </div>
                        </div>  
                    </div>
                </a>
            </div>

            <div class="">
                <div class="tit_h3 through"> 
                    <span class="lineSpan">판매현황</span>                   
                </div>
                <a href="#" class="aColor">
                    <div class="myMenu card">
                        <div class="card-body salesState">
                            <div class="subMenuTitle" >
                                전체<br> 0건
                            </div>
                            <div class="subMenuTitle" >
                                판매대기<br> 0건
                            </div>
                            <div class="subMenuTitle" >
                                판매중<br> 0건
                            </div>
                            <div class="subMenuTitle" >
                                종료<br> 0건
                            </div>
                        </div>  
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>