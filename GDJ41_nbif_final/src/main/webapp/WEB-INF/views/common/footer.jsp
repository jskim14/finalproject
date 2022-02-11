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
		<button type="button" class="btn btn-info" onclick="location.assign('${path}/member/sellerrank');">Rank</button>
		
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