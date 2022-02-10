<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>

<style>
#wishContainer{
   padding:200px 10%;
}
.wish-box{
    width: 100%;
    height: 100px;
    border: solid 1px lightgray;
    border-left: solid 8px lightskyblue;
    box-shadow: 1px 1px darkgray;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    padding-top:5px;
    text-align:center;
}

#wishTitle {
    padding: 0 1% 1% 0;
    font-weight: bold;
    text-align:center;
    
}
        
</style>
<section>
    <div id="wishContainer">
        <div>
            <h2><i class="fas fa-bookmark"></i>&nbsp;내 관심상품</h2>
            <p>내 관심상품입니다.</p>
            ${list }
        </div>
        <br>
        <div>
            <div id="wishTitle" class="row">
                <div class="col"></div>
                <div class="col-5">찜한상품</div>
                <div class="col">즉시구매가</div>
                <div class="col">현재입찰가</div>
                <div class="col">마감일</div>
                <div class="col">판매자</div>
                <div class="col"></div>
            </div>
            <div id="wishBox" class="row wish-box" style="cursor:pointer;">
                <div class="col"><img src="" width=60px; height=60px;></div>
                <div class="col-5"><p><strong>Apple 에어팟 프로</strong></p></div>
                <div class="col"><p>180,000&nbsp원</p></div>
                <div class="col"><p>132,000&nbsp원</p></div>
                <div class="col"><p>2022-03-01</p></div>
                <div class="col"><p>판매자</p></div>
                <div class="col">
                    <button type="button" id="delete">
                        <i class="fas fa-times fa-lg" style="color: #339af0; width:50px;"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $("#wishBox").click(e=>{
        alert("adf");
    })
    $("#delete").click(e=>{
        e.stopPropagation();
    })

</script>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>