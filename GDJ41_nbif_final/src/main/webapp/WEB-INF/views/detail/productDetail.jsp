<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<section  style="padding: 150px 5%;">
           <div class="container-fluid" >
                <div class="row" >
                    <div class="col-12">

                        <div class="row">
                            <div class="col-12">
                                <h1><strong>상품정보</strong></h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-7">
                                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-indicators">
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                    </div>
                                    <div class="carousel-inner">
                                      <div class="carousel-item active">
                                        <img src="${path}/resources/images/exbag.png" class="d-block w-100" alt="...">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${path}/resources/images/exbag.png" class="d-block w-100" alt="...">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${path}/resources/images/exbag.png" class="d-block w-100" alt="...">
                                      </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                      <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                                <div class="d-flex" style="justify-content: space-between;">
                                    <img src="${path}/resources/images/exbag.png" alt="사진1" width="150px">
                                    <img src="${path}/resources/images/exbag.png" alt="사진2" width="150px">
                                    <img src="${path}/resources/images/exbag.png" alt="사진3" width="150px">
                                </div>
                            </div>
                            <div class="col-5">
                                <div>
                                    <span>카테고리</span>
                                </div>
                                <div>
                                    <span>제목</span>
                                </div>
                                <div>물품번호 : <span>ye1312311</span></div>
                               
                                <div>최고가 입찰자</div>
                                <div>
                                    <div>
                                        <div>
                                            <span>현재가</span>
                                        </div>
                                        <div id="nowPrice">
                                          
                                                <span>4,000,000</span><span>원</span>
                                          
                                        </div>
                                        <div>
                                            <span>시작가  </span><span>2,333,000</span><span>원</span>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="timeBox" >
                                    <div>
                                        <span>경매종료까지</span>
                                    </div>
                                    <div id="stopwatch">
                                        <div style="padding-left: 10px;">
                                            <span>00</span>일&nbsp;
                                            <span>00</span>시간&nbsp;
                                            <span>00</span>분&nbsp;
                                            <span>00</span>초&nbsp;
                                        </div>
                                    </div>
                                </div>
                                <div id="biddingBox">
                                    <div>
                                        <span>비딩하기</span>
                                    </div>
                                    <div style="display: flex;">
                                        <div id="inputBox">
                                            <input type="text" >
                                            <span>원</span>
                                        </div>
                                        <div id="biddingBtn">
                                            <button>
                                                <span>비딩하기</span>
                                            </button>
                                        </div>
                                    </div>
                                        <div>
                                        <span>다음비딩 금액은 <strong>5,000,000</strong>원 이며, 그 이상을 직접입력하여 비딩할 수 있습니다.</span>
                                    </div>
                                </div>
                                <div>
                                    <div>buy now</div>
                                    <div style="display: flex;">
                                        <div id="buynowBtn">
                                            <input type="text" >
                                            <span>원</span>
                                        </div>
                                        <div>
                                            <button>
                                                <span>바로 구매하기</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div>입찰자리스트</div>
                                    <div style="position: relative;">
                                        <div style="position: absolute; right: 10px;">
                                             
                                            <a id="renewBtn" href="">
                                                <i class="fas fa-sync-alt"></i>
                                            </a>
                                            
                                           
                                        </div>
                                        <table class="table table-success table-striped">
                                            <tr>
                                                <th>입찰자</th>
                                                <th>입찰 금액</th>
                                            </tr>
                                            <tr>
                                                <td>서다빈</td>
                                                <td><span>999,999,999</span>원</td>
                                            </tr>
                                            <tr>
                                                <td>이민선</td>
                                                <td><span>999,999,999</span>원</td>
                                            </tr>
                                            <tr>
                                                <td>김지수</td>
                                                <td><span>999,999,999</span>원</td>
                                            </tr>
                                            <tr>
                                                <td>양대열</td>
                                                <td><span>999,999,999</span>원</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                
                                <div>
                                    <div>관심상품</div>
                                    <div>
                                        <div style="width: 100%; height:50px; border: 1px solid black; display: flex; justify-content: center; opacity: 0.3;">
                                          
                                                <i style="margin: 0;" class="far fa-bookmark fa-3x"></i>
                                                <span style="height: 100%;margin: 0; padding-top: 10px; margin-left: 20px; font-size: 20px; font-weight: bold;">관심등록</span>
                                         
                                           
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="accordion accordion-flush" id="accordionFlushExample">
                                        <div class="accordion-item">
                                          <h2 class="accordion-header" id="flush-headingOne">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                                판매자 정보
                                            </button>
                                          </h2>
                                          <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                            <div class="accordion-body">
                                                <table width="100%">
                                                    <tr>
                                                        <td>판매자 닉네임</td>
                                                        <td>판매자 닉네임</td>
                                                    </tr>
                                                    <tr>
                                                        <td>판매자 등급</td>
                                                        <td>판매자 닉네임</td>
                                                    </tr>
                                                    <tr>
                                                        <td>구매후기</td>
                                                        <td>판매자 닉네임</td>
                                                    </tr>
                                                 
                                                    <tr>
                                                        <td></td>
                                                        <td><div> <i class="far fa-comment fa-3x"></i>1:1문의하기</div></td>
                                                    </tr>
                                                </table>
                                             
                                            </div>
                                          </div>
                                        </div>
                         
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <hr>
                            <h1><strong>상품정보</strong></h1>
                        </div>
                        <div class="col-12">
                            <pre>
                                saldkfjejiosjlsaekjlskejfslaekjfoiseajeflesjflkjlkeasjflka
                                dsfjslfjslkfjslkfjlekjsoifjsalkfejlisjlfisjeflkesj
                                sdfjsoaifjlskejflksejfiesjfilsejafleksajoisdjflkejoifsdjfejlkef
                                sdfjslfjslakfjelkjfsoijekfljesfjsaoifjeslkjfes
                                sdfjhsoifjsalfkjeslkjsefowijfwlkjwelfjwepo

                            </pre>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <hr>
                            <h1><strong><span>아이디</span>의 다른상품</strong></h1>
                        </div>
                        <div class="col-12 d-flex">
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><span>카테고리</span></div>
                                        <div><span>제품명</span></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <span>즉시구매가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <span>현재입찰가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><span>카테고리</span></div>
                                        <div><span>제품명</span></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <span>즉시구매가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <span>현재입찰가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><span>카테고리</span></div>
                                        <div><span>제품명</span></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <span>즉시구매가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <span>현재입찰가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><span>카테고리</span></div>
                                        <div><span>제품명</span></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <span>즉시구매가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <span>현재입찰가</span>
                                        <span>9999999<span>원</span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

</section>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>