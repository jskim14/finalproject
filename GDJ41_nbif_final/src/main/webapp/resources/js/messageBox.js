if(loginMember!="") {
	const socket = new WebSocket("ws://localhost:9090/ws/messagebox");
	socket.onmessage = message => {
		let msgbox = JSON.parse(message.data);
		if(msgbox["nickName"]==nickName) {
			alert("쪽지도착!");
		}
	}
	function send(nickName) {
		socket.send(JSON.stringify({"nickName":nickName}));
	}
}
function msgBox(memberNo) {
	const url = path + "/member/messagebox?memberNo=" + memberNo;
	open(url,"_blank","width=700 height=500");
} 
