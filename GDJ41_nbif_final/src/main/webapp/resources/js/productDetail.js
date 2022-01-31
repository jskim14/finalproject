/**
 * 
 */

//비딩금액 버튼 ++
$("#bidButtons>div>button").click(e=>{
   	const plusBidPrice = parseInt($(e.target).val());
   	const inputVal = parseInt($("#bidUnitInput").val());
   	$("#bidUnitInput").val(plusBidPrice+inputVal);
});


const checkBuyNow=(pNo,isLogin)=>{
	if(!isLogin){
		alert("로그인 후 이용가능합니다.");
		return;
	}
	$.ajax({
		url:location.origin+"/product/checkBuyNow",
		data:{productNo:pNo},
		method:"GET",
		dataType:"json",
		success:result=>{
			//data-bs-toggle="modal" data-bs-target="#biddingModal
			console.log(result);
			if(!result){
				//$("<button>").attr({"data-bs-toggle":"modal","data-bs-target":"#buyNowModal"}).click();
				$("#buyNowModalBtn").click();
			}else{
				alert("이미 낙찰된 상품입니다.");
			}
		}
	});
};


$("#newInfo").change(e=>{
	$("#shipAddress").val("");
});

$("#normalInfo").change(e=>{
	$("#shipAddress").val($("#hiddenAddress").val());
});


const bid=(pNo)=>{
	const userInputPrice = parseInt($("#bidUnitInput").val());
	
	$.ajax({
		url:location.origin+"/product/bid",
		data:{userBidPrice:userInputPrice,productNo:pNo},
		dataType:"json",
		success:data=>{
			console.log("data");
			alert(data['result']);
		}
	})
}


