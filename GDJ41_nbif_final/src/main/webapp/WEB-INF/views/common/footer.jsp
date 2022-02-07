<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer>
	<div id="footer-con">
	<!-- 채팅아이콘 -->
	<a href="javascript:void(0);" onclick="openchat();" class="float">
<i class="far fa-comments  fa-lg my-float"></i>
</a>

<style>
	.float{
	position:fixed;
	width:50px;
	height:50px;
	bottom:40px;
	right:40px;
	background-color:#0C9;
	color:#FFF;
	border-radius:50px;
	text-align:center;
	box-shadow: 2px 2px 3px #999;
	cursor:pointer;
}

.my-float{
	margin-top:18px;
}
</style>
	<script>
	const openchat=()=> {
		open("${path }/chatting","_blank","width=320, height=500, right=60");
	}
	</script>
	<!--  -->
	
		<!-- 나중에 지울거 -->
		<button type="button" class="btn btn-info" onclick="location.assign('${path}/report/reportList');">Report List</button>
		<button type="button" class="btn btn-warning" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">상품신고</button>
		<!-- 모달창 -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				<form name="reportForm" action="${path }/report/insertReport" method="POST"
		 			enctype="multipart/form-data">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel"
							style="color: black;">상품 신고/반품</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					
					<div class="modal-body" style="color: black;">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">상품 번호</label>
							<input type="text" class="form-control" name="product"
								id="exampleFormControlInput1" placeholder="상품명 가져오기">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">주문자 명</label>
							<input type="text" class="form-control" name="writer"
								id="exampleFormControlInput1" placeholder="너의 이름은?">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">신고/반품
								사유</label>
							<textarea class="form-control" id="exampleFormControlTextarea1" name="reportReason"
								rows="3"></textarea>
						</div>
						<!-- 첨부파일 여러장 선택 -->
						<div class="mb-3">
							<label for="formFileMultiple" class="form-label">첨부파일</label> 
							<input name="upFile" class="form-control" type="file" id="formFileMultiple" multiple>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-warning">등록</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<script>
		$(()=>{
    		$("[name=reportImages]").change(e=>{
    			const fileName=$(e.target).prop('files')[0].name;	
    			$(e.target).next(".custom-file-label").html(fileName);
    		})
    	})
		</script>
		<!-- 여기까지 -->
		<p>NBIF(버그아니라기능이조)&nbsp;&nbsp;&nbsp;&nbsp;</p>
		<p>Contact: 010 - 1111 - 1111 &nbsp;&nbsp;&nbsp;&nbsp;메일 :
			nbif@gmail.com</p>
		<br>
		<p>
			Copyright&copy; 2022. <strong>NBIF</strong> All rights reserved.
		</p>
	</div>


</footer>
</div>
<script>
        setInterval(()=> {
            const time = new Date();
            const area = $("#time");
            area.html(time.getFullYear() + "." +
             (time.getMonth()<10?"0" + (time.getMonth() + 1):(time.getMonth() + 1)) + "." + 
              (time.getDate()<10?"0" + time.getDate():time.getDate()) + "." +
               time.getHours() + ":" + 
               (time.getMinutes()<10?"0" + time.getMinutes():time.getMinutes()) + ":" +
               (time.getSeconds()<10?"0" + time.getSeconds():time.getSeconds()));
        },1000);
        const search_btn=()=> {
            $("#second-header>ul>li:nth-child(1),#second-header>ul>li:nth-child(2),#second-header>ul>li:nth-child(4)").css({"display":"none"});
            $("#second-header>ul>li:nth-child(3),#second-header>ul>li:nth-child(5)").css({"display":"block"});
            $("#search-bar").focus();
            $("#search-reset").css({"display":"none"});
        }
        const search_btn_close=()=> {
            $("#second-header>ul").css({"margin-left":"0px"})
            $("#second-header>ul>li:nth-child(1),#second-header>ul>li:nth-child(2),#second-header>ul>li:nth-child(4)").css({"display":"block"});
            $("#second-header>ul>li:nth-child(3),#second-header>ul>li:nth-child(5)").css({"display":"none"});
            $("#search-bar").val("");
        }
    </script>
</body>
</html>