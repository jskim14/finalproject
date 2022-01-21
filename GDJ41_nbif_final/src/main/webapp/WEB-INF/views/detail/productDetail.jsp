<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<section  style="padding: 200px 10%;">
           <div class="container-fluid" >
                <div class="row" >
                    <div class="col-12">

                      
                        <div class="row">
                            <div class="col-7">
                                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-indicators">
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                                    </div>
                                    <div class="carousel-inner">
                                      <div class="carousel-item active">
                                        <img src="${path}/resources/images/exbag.png" class="d-block" alt="..." width="100%" height="600px">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${path}/resources/images/exbag2.png" class="d-block" alt="..." width="100%" height="600px">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${path}/resources/images/exbag3.png" class="d-block" alt="..." width="100%" height="600px">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="${path}/resources/images/exbag4.png" class="d-block" alt="..." width="100%" height="600px"> 
                                      </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                      <strong class="carousel-control-prev-icon" aria-hidden="true"></strong>
                                      <strong class="visually-hidden">Previous</strong>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                      <strong class="carousel-control-next-icon" aria-hidden="true"></strong>
                                      <strong class="visually-hidden">Next</strong>
                                    </button>
                                </div>
                                <div class="d-flex" style="justify-content: space-around;">
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" aria-label="Slide 1"><img src="${path}/resources/images/exbag.png" alt="사진1" width="100px" height="100px"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"><img src="${path}/resources/images/exbag2.png" alt="사진2" width="100px"  height="100px"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"><img src="${path}/resources/images/exbag3.png" alt="사진3" width="100px"  height="100px"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"><img src="${path}/resources/images/exbag4.png" alt="사진3" width="100px"  height="100px"></button>
                                </div>
                            </div>
                            <div id="infoBox" class="col-5">
                                <div>
                                    <strong>카테고리</strong>
                                </div>
                                <div>
                                    <strong>제목</strong>
                                </div>
                                <div><strong>물품번호 - </strong><strong>ye1312311</strong></div>
                               
                                <div><strong>최고가 입찰자</strong></div>
                                <div>
                                    <div>
                                        <div>
                                            <strong>현재가</strong>
                                        </div>
                                        <div id="nowPrice">
                                          
                                                <strong>4,000,000</strong><strong>원</strong>
                                          
                                        </div>
                                        <div>
                                            <strong>시작가  </strong><strong>2,333,000</strong><strong>원</strong>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="timeBox" >
                                    <div>
                                        <strong>경매종료까지</strong>
                                    </div>
                                    <div id="stopwatch">
                                        <div style="padding-left: 10px;">
                                            <strong>00</strong>일&nbsp;
                                            <strong>00</strong>시간&nbsp;
                                            <strong>00</strong>분&nbsp;
                                            <strong>00</strong>초&nbsp;
                                        </div>
                                    </div>
                                </div>
                                <div id="biddingBox">
                                    <div>
                                        <strong>입찰하기</strong>
                                    </div>
                                    <div>
                                        <button>1000</button>
                                        <button>10000</button>
                                        <button>100000</button>
                                       
                                    </div>
                                    <div style="display: flex;justify-content: space-between; padding: 0 50px;">
                                       
                                        <div id="inputBox">
                                            <input type="text" >
                                            <span>원</span>
                                        </div>
                                        <div id="biddingBtn">
                                            <button class="btn" style="width: 100px;" data-bs-toggle="modal" data-bs-target="#biddingModal">
                                                <span>입찰하기</span>
                                            </button>
                                        </div>
                                    </div>
                                    <div style="font-size: 12px;">
                                        <span>다음비딩 금액은 <strong>5,000,000</strong>원 이며, 그 이상을 직접입력하여 비딩할 수 있습니다.</span>
                                    </div>
                                </div>
                                <div>
                                    <strong>buy now</strong>
                                    <div style="display: flex; justify-content: space-between; padding: 0 50px;">
                                        
                                        <div id="buynowInput">
                                            <input type="text" >
                                            <span>원</span>
                                        </div>
                                        <div>
                                            <button id="buynowBtn" class="btn" style="width: 100px;" data-bs-toggle="modal" data-bs-target="#buynowModal">
                                                <span>바로 구매</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <strong>입찰자리스트</strong>
                                    <div style="position: relative; height: 100px; overflow: auto;">
                                        <div style="position: absolute; right: 10px;">
                                             
                                            <a id="renewBtn" href="">
                                                <i class="fas fa-sync-alt"></i>
                                            </a>
                                            
                                           
                                        </div>
                                        <table class="table table-striped" >
                                            <tr>
                                                <th>입찰자</th>
                                                <th>입찰 금액</th>
                                            </tr>
                                            <tr>
                                                <td>서다빈</td>
                                                <td><strong>999,999,999</strong>원</td>
                                            </tr>
                                            <tr>
                                                <td>이민선</td>
                                                <td><strong>999,999,999</strong>원</td>
                                            </tr>
                                            <tr>
                                                <td>김지수</td>
                                                <td><strong>999,999,999</strong>원</td>
                                            </tr>
                                            <tr>
                                                <td>양대열</td>
                                                <td><strong>999,999,999</strong>원</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                
                                <div>
                                    <div>관심상품</div>
                                    <div>
                                        <div style="width: 100%; height:50px; border: 1px solid black; display: flex; justify-content: center; opacity: 0.3;">
                                          
                                                <i style="margin: 0;" class="far fa-bookmark fa-3x"></i>
                                                <strong style="height: 100%;margin: 0; padding-top: 10px; margin-left: 20px; font-size: 20px; font-weight: bold;">관심등록</strong>
                                         
                                           
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
                                                <div class="row my-1">
                                                    <div class="col-6">
                                                        <strong>닉네임</strong>
                                                    </div>
                                                    <div class="col-6">
                                                        집에가고싶다
                                                    </div>
                                                </div>
                                                <div class="row my-1">
                                                    <div class="col-6">
                                                        <strong>판매자등급</strong>
                                                    </div>
                                                    <div class="col-6">
                                                        <img src="" alt="" width="24px" height="24px">
                                                        SILVER
                                                    </div>
                                                </div>
                                                <div class="row my-1">
                                                    <div class="col-6">
                                                        <strong>구매후기</strong>
                                                    </div>
                                                    <div class="col-6">
                                                        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#reviewModal">보러가기</button>
                                                    </div>
                                                </div>
                                                <div class="row my-1">
                                                    <div class="col-6">
                                                        <i class="far fa-comment fa-2x"></i> <strong>1:1문의</strong>
                                                    </div>
                                                    <div class="col-6">
                                                        <button type="button" class="btn btn-info">문의하러가기</button>
                                                    </div>
                                                </div>
                                            
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
                            <h1><strong><strong>아이디</strong>의 다른상품</strong></h1>
                        </div>
                        <div class="col-12 d-flex" style="overflow: hidden;">
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 210px;">
                                <div>
                                    <img src="${path}/resources/images/exbag.png" width="200px" height="200px">
                                </div>
                                <div class="alignVertical" >
                                    <div class="nameLine">
                                        <div><strong>카테고리</strong></div>
                                        <div><strong>제품명</strong></div>
                                    </div>
                                    <div class="nameLine fontColorRed">
                                        <strong>즉시구매가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                    <div class="nameLine fontColorGreen">
                                        <strong>현재입찰가</strong>
                                        <strong>9999999<strong>원</strong></strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

</section>
<div class="modal fade" id="buynowModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">즉시 구매</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body container-fluid">
            <div class="row">
                <span>주문하기</span>
            </div>
            <div class="row">
                <div class="col-12" style="margin: 0 auto; text-align: center;">
                    <img src="${path}/resources/images/exbag.png" alt="..." width="250px" >
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <span>물품번호</span>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <span>상품명</span>
                </div>
                <div class="col-6">
                    <span>즉시구매가</span>
                </div>
            </div>
            <div class="row">
                <div class="col-4"></div>
                <div class="col-8">

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">기본정보로</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">새로입력</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <span>기본주소</span>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control w-100" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <span>배송주소</span>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control w-100">
                </div>
            </div>
            <div class="row">
                <div class="col-4"></div>
                <div class="col-8">

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">기본주소</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                        <label class="form-check-label" for="inlineRadio2">배송주소</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <span>연락처</span>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control w-100">
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <span>받는사람</span>
                </div>
                <div class="col-8">
                    <input type="text" class="form-control w-100">
                </div>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">구매하기</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="biddingModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">정말입찰하시겠습니까?</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body container-fluid">
           신중하시길...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">입찰하기</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">판매자 후기</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body container-fluid">
           신중하시길...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>