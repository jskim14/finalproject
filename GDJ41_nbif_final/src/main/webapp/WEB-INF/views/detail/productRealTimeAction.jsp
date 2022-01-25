<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NBIF 실시간 경매</title>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="container"></div>
	<input type="text" id="msg">
	<button id="sendBtn">입력</button>
	<script>
		const username = [[${#authentication.loginMember.nickName}]];
		const socket = new WebSocket("ws://localhost:9090/ws/chat");
		socket.onopen = e => {
			console.log(username);
			$("#container").append($("<h2>").html("접속?"));
		}
	</script>
</body>
</html>