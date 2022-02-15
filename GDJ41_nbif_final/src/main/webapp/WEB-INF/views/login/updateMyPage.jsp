<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section>
    <div id="totalContainer" style="padding:15% 20% 15% 20%">
        <div class="pageTitle">
            <span>나의정보 관리</span>
        </div>
        <hr><br>
        <div class="pageMenu">
        ${m }
            <form action="${path }/member/updateMyPageEnd">
                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">이메일</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" name="email" class="form-control" value="${m.email }" style="width: 250px; display:inline;" readonly>
                    </div>
                    
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">이름</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" class="form-control" value="${m.memberName }" style="width: 250px; display:inline;" readonly>
                    </div>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">닉네임</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" name="nickName" class="form-control" value="${m.nickName }" style="width: 250px; display:inline;">
                    </div>
                    <span class="inputNextSpan">닉네임은 띄어쓰기 없이 8글자 이하까지 가능합니다. </span>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">휴대폰</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" name="phone" class="form-control" value="${m.phone }" style="width: 250px; display:inline;">
                    </div>
                    <span class="inputNextSpan">휴대폰번호는 -없이 입력해주세요.  </span>
                </div>

                <div class="subMenu">
                    <div class="titleLeft">
                        <span class="subMenuTitle">주소</span>
                    </div>
                    <div class="inputRight">
                        <input type="text" name="shipAddress" id="shipAddress" class="form-control" placeholder="도로명주소"
                        style="width: 350px; display:inline;" readonly required>
                    </div>
                    <button type="button" class="btn btn-secondary btnColor" onclick="javascript: findAddress();"> 
                    주소 검색</button>
                    
                </div>
                <div class="subMenu">
                    <div class="titleLeft">
                        <input type="hidden" class="subMenuTitle"></span>
                    </div>
                    <div class="inputRight">
                        <input type="text" name="detailAddress" id="detailAddress" class="form-control" 
                        style="width: 350px; display:inline;" placeholder="읍,면,동 이하 상세주소" required>
                    </div>
                </div>
                
                <br>
                <div class="" style="text-align: center;">
                    <button type="submit" class="btn btn-secondary btnColor">정보수정하기</button>
	            	<button type="button" class="btn btn-secondary btnColor" 
	            	onclick="javascript: upadatePW('${m.memberNo }');"> 비밀번호 변경</button>
                </div>
	            <div>
	            </div>
            </form>
        </div>
    </div>
</section>
<script>

	const upadatePW=(memberNo)=>{
		event.stopPropagation();
		const url="https://www.naver.com/"; 
		const style="width=400, height=210, left=500, top=200";
		open(url,"_blank",style);
	}

function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
          
            var roadAddr = data.roadAddress; 
            var extraRoadAddr = ''; 

         
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
          
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            
            const totalAddress = roadAddr + extraRoadAddr;
            
            
            if(totalAddress !== ''){
                document.getElementById("shipAddress").value = totalAddress;
                document.getElementById("detailAddress").focus();
            } else {
                document.getElementById("shipAddress").value = '';
            }
        }
    }).open();
}



</script>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp"/>