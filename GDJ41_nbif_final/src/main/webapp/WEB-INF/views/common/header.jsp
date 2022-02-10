<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/productDetail.css">
    <link rel="stylesheet" href="${path}/resources/css/inputStyle.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/index.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
	 // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('a6cc0c054f4e92252bfaf5be7f936545');
	
	    // SDK 초기화 여부를 판단합니다.
	    console.log(Kakao.isInitialized());
	    
	    let socialFlag = false;
	    
		function kakaoLogin(){
		
		  Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		        	  console.log(JSON.stringify(response));
					  console.log(response['kakao_account']['email']);
					 sendPost(location.origin+"/member/kakaoLogin",response['kakao_account']['email']);
		        	/*   Kakao.Auth.authorize({
		    			  redirectUri: location.origin+"/member/kakaoLogin"
		    			 
		    			  
		    			});  */
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		    
			 
		}
		
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  

		  function sendPost(url, param){
			  let form = document.createElement('form');
			  form.setAttribute('method','post');
			  form.setAttribute('action',url);
			  document.charset = 'utf-8';

			 
			let hiddenField = document.createElement('input');
			hiddenField.setAttribute('type','hidden');
			hiddenField.setAttribute('name','email');
			hiddenField.setAttribute('value',param);
			form.appendChild(hiddenField);
	


			document.body.appendChild(form);
			form.submit();
		  }
    </script>
    <title>Document</title>
</head>
<style>
/* #first-header>ul {
	margin: 0;
	position: absolute;
	left: 74%;
} */
</style>
<body>
    <div id="container">
        <header>
            <div id="header-container">
                <div id="first-header">
                    <h5><img src="${path}/resources/images/png.png" width="20px" height="20px"><span id="time">0000. 00. 00. 00: 00: 00</span></h5>

                    <ul>
                     		<li>
	                            <a href="${path }/cs/noticeList">고객센터</a>
	                        </li>
                    	<c:if test="${admin==null or admin==false}">

	                       
	                       	<c:if test="${loginMember == null }">
	                        <li>
	                            <a href="${path}/member/enrollMember">회원가입</a>
	                        </li>
	                        </c:if>
                            <c:if test="${loginMember != null }">
                            <li>
	                            <a href="${path }/member/myPage?memberNo=${loginMember.memberNo}">마이페이지
	                            ${loginMember.memberName }</a>
	                         </li>
                            </c:if>
						 </c:if>
							<c:if test="${admin!=null and admin==true }">
								<!--관리자 메뉴  -->
								<li>
									<a href="${path}/admin/productManage">물품승인</a>
								</li>
								<li>
									<a href="${path}/admin/specialProductEnroll">실시간경매물품등록</a>
								</li>
							</c:if>
                        	<c:if test="${loginMember == null}">
	                        <li>
	                            <a href="${path}/member/login">로그인</a>
	                        </li>
                        	</c:if>
	                        <c:if test="${loginMember != null}">
	                        <li>
	                        	<style>
	                        		#first-header>ul {left:72%;}
	                        	</style>
		                            <a onclick="kakaoLogout()" href="${path}/member/logout">로그아웃</a>
	                        </li>
	                        </c:if>
                    </ul>
                </div>
                <div id="second-header">
                    <h2><a href="${path }/"><img src="${path}/resources/images/NBIF.png" width="120px" height="40px"></a></h2>
                    <ul>
                        <li style="width:200px"><a href="">SPECIAL AUCTION</a></li>
                        <li style="width:200px"><a href="">AUCTION ITEMS</a></li>
                        <li style="display: none; width:400px"><input type="search" name="keyword" id="search-bar" placeholder=" Search..."></li>
                        <li><a href="javascript:search_btn()"><span><img src="${path}/resources/images/search.png" width="30px" height="30px"></span></a></li>
                        <li style="display: none;"><a href="javascript:search_btn_close()"><span><img src="${path}/resources/images/xxx.png" width="20px" height="20px"></span></a></li>
                    </ul>
                </div>
            </div>
        </header>