<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
  
<section>
    <div id="totalContainer">
        <div class="pageTitle">
            <span>판매입찰등록</span>
        </div>
        <div class="pageMenu">
            <form action="">
                <div class="pageMenu-1">
                    <!-- <div class="subTitle">경매설정</div> -->
                    <div class="tit_h3 through "> 
                        <span class="lineSpan">경매설정</span>                   
                    </div>
                    <div class="centerArray">
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">즉시구매</span><br>
                            </div>
                            <div class="titleRight">
                                <label><input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault12"> 
                                    설정안함
                                </label> &nbsp;
                                <label><input class="form-check-input" type="radio" name="flexRadioDefault1" id="flexRadioDefault1" > 
                                    설정
                                </label> 
                                
                                <input type="text" id="inputTyping1" class="form-control" name="buyNowPrice" placeholder="즉시구매가를 입력해주세요" style="width: 250px; display:inline; margin-left: 1%" disabled>
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">자동 재경매</span><br>
                            </div>
                            <div class="titleRight">
                                <label><input class="form-check-input" type="radio" name="extendYn" value="Y"> 
                                    설정안함
                                </label> &nbsp;
                                <label><input class="form-check-input" type="radio" name="extendYn" id="flexRadioDefault2" value="Y"> 
                                    설정
                                </label>
                                <input type="text" id="inputTyping2" class="form-control" name="nowBidPrice" placeholder="재경매 시작가를 입력해주세요" style="width: 250px; display:inline; margin-left: 1%" disabled>
                                <div style="padding: 1%"><span> *경매가 유찰될 경우 1회에 한해 자동으로 경매가 재진행 됩니다.</span><br>
                                </div>
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">입찰 시작가</span> <!-- minBidPrice -->
                            </div>
                            <div class="titleRight">
                                <input type="text" class="form-control" placeholder="" style="width: 250px; display:inline;">
                                <div id="autionStartInfo" style="display: inline; padding: 1%"> *입찰시작가가 즉시구매가보다 높습니다. </div>
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">입찰단위</span>
                            </div>
                            <div class="titleRight">
                                <select id="priceUnit" onchange="unitSelect();" class="form-select" name="bidUnit" aria-label="Default select example" style="width: 200px; color: gray; display:inline;">
                                    <option selected>---선택하세요---</option>
                                    <option value="1000">1,000원</option>
                                    <option value="5000">5,000원</option>
                                    <option value="10000">10,000원</option>
                                    <option value="50000">50,000원</option>
                                    <option value="100000">100,000원</option>
                                    <option value="typing">직접입력</option>
                                </select>
                                <input type="text" id="inputTyping3" class="form-control" name="bidUnit" placeholder="" style="width: 250px; display:inline; margin-left: 1%;" disabled>
                                <div id="autionUnitInfo" style="display: inline; padding: 1%"> *입찰단위가 입찰시작가보다 높습니다. </div>
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">경매기간</span>
                            </div>
                            <div class="titleRight">
                                <!-- 스타일 각각해야됨 -->
                                시작일 &nbsp;<input type="date"  id="currentDate" class="form-control" name="startDate" style="width: 180px; display:inline;" readonly>&nbsp;
                                종료일 &nbsp;<input type="text" id="maxDate" class="form-control" name="maxDate" placeholder="최대 14일 가능" style="width: 180px; display:inline;">&nbsp;
                                마감시간 &nbsp;<input type="time" class="form-control" name="maxTime" style="width: 180px; display:inline;">&nbsp;
                                
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    
                </script>

                <div class="pageMenu-1">
                    <!-- <span class="subTitle">물품정보</span><br> -->
                    <div class="tit_h3 through "> 
                        <span class="lineSpan">물품정보</span>                   
                    </div>
                    <div class="centerArray">
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">카테고리</span>
                            </div>
                            <div class="titleRight"> 
                                <select class="form-select" name="productCategory" aria-label="Default select example" style="width: 200px; color: gray;">
                                    <option selected>---선택하세요---</option>
                                    <option value="FS">패션</option>
                                    <option value="LF">라이프</option>
                                    <option value="TC">테크</option>
                                    <option value="AR">아트</option>
                                </select>
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">상품명</span>
                            </div>
                            <div class="titleRight"> 
                                <input type="text" class="form-control" name="productName" placeholder="상품명을 입력해주세요. 상품명은 제목으로 입력됩니다." >
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">물품설명</span> 
                            </div>
                            <div class="titleRight">
                                <textarea name="productContent" id="classic" class="form-control" style="height: 40rem;"
                                placeholder="상품을 소개할 내용을 적어주세요.">  </textarea>
                            </div>
                        </div>
                        <div class="subMenu">
                            <div class="titleLeft">
                                <span class="subMenuTitle">이미지</span>
                            </div>
                            <div class="titleRight"> 
                                <div class="mb-3">
                                    <label for="formFileMultiple" class="form-label">
                                        *사진은 4장까지 등록 가능하며, 첫번째 등록한 사진이 메인사진으로 등록됩니다.
                                    </label>
                                    <input class="form-control" type="file" id="formFileMultiple" multiple>
                                </div>
                            </div>
                        </div>


                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-secondary btn-lg btnColor">등록</button>
                        </div>
                        <button type="button" id="test123"">클릭</button>
                    </div>
                </div>
            </form>
            
            <div class="app">
				</div>
            
            
        </div>
    </div>
    <script>
        $("input[name=flexRadioDefault1]").change(e=>{
            if($("#flexRadioDefault1").prop('checked',true)) {
                 $("#inputTyping1").attr("disabled",false);
                 $("#inputTyping1").focus();
            }else {
                $("#inputTyping1").attr("disabled",true);
            }
        });
        
        function unitSelect() {
            if($("#priceUnit").val()=="typing") {
                $("#inputTyping3").attr("disabled",false);
                $("#inputTyping3").focus();
            } else {
                $("#inputTyping3").attr("disabled",true);
            }
        }

        document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
                    
        $(function(){
            $("#maxDate").datepicker({
                dateFormat: "yy-mm-dd",
                minDate: +1,
                maxDate: +14
                });
            })
            
        $("#test123").click(e=>{
            alert($("#maxDate").val());
        })
        

        ClassicEditor
            .create( document.querySelector( '#classic' ))
            .catch( error => {
                console.error( error );
            } );
    </script>
    	<!-- 넓이 높이 조절 -->
<style>
        .ck.ck-editor {
            max-width: 100%;
        }
        .ck-editor__editable {
            min-height: 300px;
        }
</style>

    
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>