<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>

<section>
    <div id="totalContainer">
        <div class="pageTitle">
            <span>나의정보 관리</span>
        </div>
        <hr><br>
        <div class="pageMenu">
            <form action="">
                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">이메일</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control" value="asdf@naver.com" style="width: 250px; display:inline;" readonly>
                    </div>
                    <button type="button" class="btn btn-secondary btnColor"> 비밀번호 변경</button>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">이메일</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control" value="서다빈" style="width: 250px; display:inline;" readonly>
                    </div>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">닉네임</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control" value="나는야독재자" style="width: 250px; display:inline;">
                    </div>
                    <span class="inputNextSpan">닉네임은 띄어쓰기 없이 8글자 이하까지 가능합니다. </span>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">휴대폰</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control" value="01012341234" style="width: 250px; display:inline;">
                    </div>
                    <span class="inputNextSpan">휴대폰번호는 -없이 입력해주세요.  </span>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">주소</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control"  style="width: 250px; display:inline;">
                    </div>
                    <button type="button" class="btn btn-secondary btnColor"> 주소 검색</button>
                    <div class="form-check inputNextSpan" >
                        <label><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                        배송주소와 일치합니다. 
                        </label>
                    </div>
                </div>
                <div class="subMenu">
                    <div class="titleLeft">
                        <input type="hidden" class="subMenuTitle"></span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control"  style="width: 350px; display:inline;" readonly>
                        <input type="text" class="form-control"  style="width: 350px; display:inline;">
                    </div>
                </div>

                <br>
                <div class="d-grid gap-2" style="width: 10%;">
                    <button type="submit" class="btn btn-secondary btn-lg btnColor">변경하기</span>
                </div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>