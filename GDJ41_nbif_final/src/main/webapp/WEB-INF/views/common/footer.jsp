<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer>
	<div id="footer-con">
		<!-- 나중에 지울거 -->
		<a href="${path}/report/reportList">Report List</a>
		<button type="button" class="btn btn-warning" data-bs-toggle="modal"
			data-bs-target="#staticBackdrop">상품신고</button>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel"
							style="color: black;">상품 신고/반품</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body" style="color: black;">
						<div class="mb-3">
							<label for="exampleFormControlInput1" class="form-label">상품명</label>
							<input type="email" class="form-control" name="productName"
								id="exampleFormControlInput1" placeholder="name@example.com">
						</div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label">신고/반품
								사유</label>
							<textarea class="form-control" id="exampleFormControlTextarea1" name="reportReson"
								rows="3"></textarea>
						</div>
						<!-- 첨부파일 여러장 선택 -->
						<div class="mb-3">
							<label for="formFileMultiple" class="form-label">첨부파일</label> <input name="upFile"
								class="form-control" type="file" id="formFileMultiple" multiple>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-warning">등록</button>
					</div>
				</div>
			</div>
		</div>
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
        $("#search-bar").keyup(e=> {
            let keyword = $(e.target).val();
            if(keyword.length>0) {
                $("#search-reset").css({"display":"block"});
            }else if(keyword.length==0) {
                $("#search-reset").css({"display":"none"});
            }
        });
        $("#search-reset").click(e=> {
            $("#search-bar").val("");
            $("#search-reset").css({"display":"none"});
        });
    </script>
</body>
</html>