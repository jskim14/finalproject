<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/header.jsp" />
<section style="padding: 200px 10%;">
	<style>
.btn-green {
	color: #fff;
	background-color: #41B979;
	border-color: #41B979;
}

.btn-purple {
	color: #fff;
	background-color: #7f47e9;
	border-color: #7f47e9;
}
</style>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">

				<div class="row">
					<div class="col-6">
						<div class="row">
							<div class="col-12">
								<div id="carouselExampleIndicators" class="carousel slide  mb-3"
									data-bs-ride="carousel">
									<div class="carousel-indicators">
										<c:if test="${not empty  product.images }">
											<c:forEach items="${product.images }" varStatus="status"
												var="img">
												<button type="button"
													data-bs-target="#carouselExampleIndicators"
													data-bs-slide-to="${status.index }"
													<c:if test="${status.first}">
												class="active" 
												aria-current="true"
												</c:if>
													aria-label="Slide${status.index+1 }"></button>
											</c:forEach>
										</c:if>
									</div>
									<div class="carousel-inner">
										<c:if test="${not empty product.images  }">
											<c:forEach items="${product.images }" varStatus="status"
												var="img">
												<c:if test="${status.first }">
													<div class="carousel-item active">
												</c:if>
												<c:if test="${not status.first }">
													<div class="carousel-item">
												</c:if>
												<img src="${path}/resources/upload/product/${img.imageName}"
													class="d-block" alt="..." width="100%" height="500px">
									</div>
									</c:forEach>
									</c:if>
								</div>
								<button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide="prev">
									<strong class="carousel-control-prev-icon" aria-hidden="true"></strong>
									<strong class="visually-hidden">Previous</strong>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleIndicators"
									data-bs-slide="next">
									<strong class="carousel-control-next-icon" aria-hidden="true"></strong>
									<strong class="visually-hidden">Next</strong>
								</button>
							</div>
							<div class="d-flex" style="justify-content: space-around;">
								<c:if test="${not empty product.images }">
									<c:forEach items="${product.images }" varStatus="status"
										var="img">
										<button type="button"
											data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="${status.index }"
											aria-label="Slide${status.index+1 }">
											<img src="${path}/resources/upload/product/${img.imageName}"
												alt="사진1" width="150px" height="150px">
										</button>
									</c:forEach>
								</c:if>

							</div>
						</div>

						<c:if test="${isGeneral ==true }">
							<div class="row mt-3">
								<div class="col-11">
									<strong>입찰자 리스트</strong>
								</div>
								<div class="col-1">
									<a id="renewBtn" href=""> <i class="fas fa-sync-alt"></i></a>
								</div>
							</div>

							<div class="row mt-1">
								<div class="col-12" style="height: 100px; overflow: auto">
									<table class="table table-striped" style="text-align: center;">
										<tr>
											<th>입찰자</th>
											<th>입찰 금액</th>
										</tr>
										<c:forEach items="${bidderList }" var="b">
											<tr>
												<td><c:out value="${b['NICKNAME'] }" /></td>
												<td><strong><c:out value="${b['AMOUNT'] }" /></strong>원</td>
											</tr>

										</c:forEach>


									</table>
								</div>
							</div>
						</c:if>

					</div>
				</div>
				<div class="col-1"></div>
				<div id="infoBox" class="col-5">
					<div class="row mb-1">
						<div class="col-12">
							<strong> <c:choose>
									<c:when test="${product.productCategory eq 'FS' }">
										<c:out value="패션(${product.productCategory})" />
									</c:when>
									<c:when test="${product.productCategory eq 'LF' }">
										<c:out value="라이프(${product.productCategory})" />
									</c:when>
									<c:when test="${product.productCategory eq 'TC' }">
										<c:out value="테크(${product.productCategory})" />
									</c:when>
									<c:when test="${product.productCategory eq 'AT' }">
										<c:out value="아트(${product.productCategory})" />
									</c:when>
									<c:otherwise>
									-
								</c:otherwise>
								</c:choose>
							</strong>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-12">
							<strong><c:out value="${product.productName}" /></strong>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-6">
							<strong>물품번호</strong>
						</div>
						<div class="col-6">
							<strong style="float: right;"><c:out
									value="${product.productNo }" /></strong>
						</div>
					</div>
					<hr>
					<div class="row mb-1">
						<div class="col-6">
							<strong>최고입찰자</strong>
						</div>
						<div class="col-6">
							<strong style="float: right;"> <c:if
									test="${product.highestBidder eq null }">
								-
							</c:if> <c:if test="${product.highestBidder ne null }">
									<c:out value="${product.highestBidder.nickName }" />
								</c:if>
							</strong>
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<strong>현재가</strong>
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<strong style="float: right;"><c:out
									value="${ product.nowBidPrice}" /><span>원</span></strong>
						</div>
					</div>
					<hr>
					<div class="row mb-1">
						<div class="col-12">
							<strong>시작가-</strong><strong><c:out
									value="${product.minBidPrice }" /></strong><strong>원</strong>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<strong>경매종료까지</strong>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div id="timer"
								style="padding-left: 10px; float: right; font-size: 40px; font-weight: bold;">

							</div>
						</div>
					</div>
					<script>
					

						const countDown=(id , date)=>{
							let targetDate = new Date(date);
							const second = 1000;
							const minute= second * 60;
							const hour = minute * 60;
							const day = hour* 24;
							let timer;
							
							function showRemaining(){
								let now = new Date();
								let distDate = targetDate-now;
								
								if(distDate < 0 ){
									clearInterval(timer);
									document.getElementById(id).textContent = "종료된 상품입니다.";
									return;
								}
								
								let days = Math.floor(distDate/day);
								let hours = Math.floor((distDate%day)/hour);
								let minutes = Math.floor((distDate%hour)/minute);
								let seconds = Math.floor((distDate%minute)/second);
								
								document.getElementById(id).textContent = days + '일 ';
								document.getElementById(id).textContent += hours + '시간 '; 
								document.getElementById(id).textContent += minutes + '분 '; 
								document.getElementById(id).textContent += seconds + '초';

							}
							
							timer = setInterval(showRemaining,1000);
							
						}
						countDown("timer",new Date('${product.endDate}'));
						
					</script>
					<hr>
					<c:if test="${isGeneral == true }">

						<div class="row mb-3">
							<div class="col-12">
								<strong>입찰하기</strong>
							</div>
						</div>
						<div id="bidButtons" class="row mb-3">
							<div class="col-3">
								<button type="button" class="w-100 btn btn-purple" value="1000"
									${!isSell?"disabled":"" }>1000</button>
							</div>
							<div class="col-3">
								<button type="button" class="w-100 btn btn-purple" value="10000"
									${!isSell?"disabled":"" }>10000</button>
							</div>
							<div class="col-3">
								<button type="button" class="w-100 btn btn-purple"
									value="100000" ${!isSell?"disabled":"" }>100000</button>
							</div>
							<div class="col-3">
								<button type="button" class="w-100 btn btn-purple"
									value="1000000" ${!isSell?"disabled":"" }>1000000</button>
							</div>
						</div>

						<div class="row">
							<div class="col-1"></div>
							<div class="col-6">
								<div style="border: 3px solid #41B979; border-radius: 10px">
									<input id="bidUnitInput" type=text 
										value="<fmt:formatNumber value="${product.nowBidPrice+product.bidUnit }"/>"
										style="text-align:right; padding-right:10px; background:none; font-size: 30px; width: 100%;" ${!isSell?"disabled":"" }>
									<!-- <span>원</span> -->
								</div>
							</div>
							<div class="col-1"></div>
							<div class="col-4">
								<button type="button" class="btn btn-green"
									data-bs-toggle="modal" data-bs-target="#biddingModal" style="height: 100%; width:100%; font-size:20px"
									${!isSell?"disabled":"" }>입찰하기</button>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-12">
								<small style="font-size: 12px">다음 입찰금액은 <b><c:out
											value="${product.nowBidPrice+product.bidUnit }" /></b>원 이며 , 그이상을
									직접입력하여 입찰할 수 있습니다.
								</small>
							</div>
						</div>
						<hr>
						<div class="row mb-3">
							<div class="col-12">
								<strong>buy now</strong>
							</div>
						</div>
						<div class="row">
							<div class="col-1"></div>
							<div class="col-6">
								<div style="border: 3px solid #41B979; border-radius:10px; display:flex; justify-content: flex-end;">
									<span style="font-size: 30px; margin-right: 10px">
										<fmt:formatNumber value="${product.buyNowPrice }"/>
									</span>
								</div>
							</div>
							<div class="col-1"></div>
							<div class="col-4">
								<button type="button" class="btn btn-green" style="height: 100%; width:100%; font-size: 20px"
									onclick="checkBuyNow('${product.productNo}','${loginMember==null?false:true }');" 
									${!isSell?"disabled":"" }>바로구매</button>
								<button id="buyNowModalBtn" type="button" data-bs-toggle="modal"
									data-bs-target="#buyNowModal" style="display: none"></button>

							</div>
						</div>

	
						<div class="row mt-3">
							<div class="col-12">
								<!-- 	<div style="width: 100%; height: 50px; border: 1px solid black; display: flex; justify-content: center; opacity: 0.3;">

								<i style="margin: 0;" class="far fa-bookmark fa-3x"></i> <strong
									style="height: 100%; margin: 0; padding-top: 10px; margin-left: 20px; font-size: 20px; font-weight: bold;">관심등록</strong>


							</div> -->
								<c:if test="${isWishList == false }">
									<button id="wishListBtn" type="button"
										class="btn btn-green w-100 d-flex justify-content-center align-items-center">
										<i class="far fa-bookmark fa-3x"></i> <span>관심등록</span>
									</button>
								</c:if>
								<c:if test="${isWishList == true }">

									<button id="wishListBtn" type="button"
										class="btn btn-green w-100 d-flex justify-content-center align-items-center "
										disabled>
										<i class="far fa-bookmark fa-2x"></i> <span>관심등록</span>
									</button>
								</c:if>
							</div>
							<script>

						$("#wishListBtn").click(e=>{
							
							

							$.ajax({
								url:location.origin+"/product/wishList",
								data:{productNo:'${product.productNo}',memberNo:'${loginMember.memberNo}'},
								dataType:'json',
								success:data=>{
									console.log(data);
									alert(data['result']);
									$("#wishListBtn").attr('disabled',true);
								}
							});
							
						});

						</script>
						</div>
						<hr>
						<div class="row">
							<div class="col-12">
								<div class="accordion accordion-flush"  style="border: 2px solid black;"
									id="accordionFlushExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseOne" aria-expanded="false"
												aria-controls="flush-collapseOne">판매자 정보</button>
										</h2>
										<div id="flush-collapseOne"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingOne"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												<div class="row">
													<div class="col-1"></div>
													<div class="col-6">
														<strong>판매자 닉네임</strong>
													</div>
													<div class="col-4" style="text-align: right;">
														<c:out value="${product.seller.nickName}" />
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row">
													<div class="col-1"></div>
													<div class="col-6">
														<strong>판매자 등급</strong>
													</div>
													<div class="col-4" style="text-align: right;">
														<c:out value="${product.seller.rank}" />
													</div>
													<div class="col-1"></div>
												</div>
												<div class="row">
													<div class="col-1"></div>
													<div class="col-6">
														<strong>구매후기</strong>
													</div>
													<div class="col-4 d-flex justify-content-end">
														<button id="reviewBtn" type="button" class="btn btn-green"
															data-bs-toggle="modal" data-bs-target="#reviewModal">보러가기</button>
													</div>
													<div class="col-1"></div>
													<script>

												$("#reviewBtn").click(e=>{
													
													$.ajax({
														url: location.origin+"/product/review",
														data:{sellerNo:'${product.seller.memberNo}'},
														dataType:'json',
														success:data=>{
															console.log(data);
															const root = $("#reviewContainer");
															root.html("");
															for(let i=0; i<data.length; i++){
																const box = $("<div>").addClass("list-group-item d-flex justify-content-between align-items-center");
																
																const div1 = $("<div>");
																const div2 = $("<div>");
																
																const content = $("<span>").html(data[i]['reviewContent']);
																const rate = $('<span>').addClass("badge bg-primary rounded-pill").html(data[i]['reviewRate']);
																const date = $('<span>').html(data[i]['reviewDate']);
															
																div1.append(content);
																div2.append(rate).append(date);
															
																box.append(div1).append(div2)
																root.append(box);
															}
															
															
															
														}
													});
												});

												</script>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>

					</c:if>
					<c:if test="${isGeneral != true }">
						<div class="row">
							<div class="col-12">
								<button type="button" class="btn btn-green w-100"
									onclick="goToSpecialAction()">실시간 경매장으로~</button>
							</div>
						</div>
						<script>
		function goToSpecialAction(){
			// 
			//location.assign(location.origin+"//");
		}
	</script>


					</c:if>

				</div>

				<div class="row">
					<div class="col-12">
						<hr>
						<h1>
							<strong>상품정보</strong>
						</h1>
					</div>
					<div class="col-12">
						<p>
							<c:out value="${product.productContent }" />
						</p>
					</div>

				</div>

				<c:if test="${isGeneral == true }">

					<div class="row">
						<div class="col-12">
							<hr>
							<h1>
								<strong><strong><c:out
											value="${product.seller.nickName}" /></strong>의 다른상품</strong>
							</h1>
						</div>
						<div class="col-12 d-flex" style="overflow: hidden;">
							<div style="width: 210px;">
								<div>
									<img src="${path}/resources/images/exbag.png" width="200px"
										height="200px">
								</div>
								<div class="alignVertical">
									<div class="nameLine">
										<div>
											<strong>카테고리</strong>
										</div>
										<div>
											<strong>제품명</strong>
										</div>
									</div>
									<div class="nameLine fontColorRed">
										<strong>즉시구매가</strong> <strong>9999999<strong>원</strong></strong>
									</div>
									<div class="nameLine fontColorGreen">
										<strong>현재입찰가</strong> <strong>9999999<strong>원</strong></strong>
									</div>
								</div>
							</div>


						</div>
					</div>
			</div>
		</div>
		</c:if>
</section>
<div class="modal fade" id="buyNowModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">즉시 구매</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body container-fluid">
				<div class="row">
					<span>주문하기</span>
				</div>
				<div class="row">
					<div class="col-12" style="margin: 0 auto; text-align: center;">
						<img
							src="${path}/resources/upload/${product.images.get(0).imageName}"
							alt="..." width="250px">
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<span><c:out value="${product.productNo }" /></span>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<span><c:out value="${product.productName }" /></span>
					</div>
					<div class="col-6">
						<span><c:out value="${product.buyNowPrice }" /></span>
					</div>
				</div>
				<div class="row">
					<div class="col-4"></div>
					<div class="col-8">

						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="radioInfoCheck" id="normalInfo" value="option1" checked>
							<label class="form-check-label" for="inlineRadio1">기본정보로</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="radioInfoCheck" id="newInfo" value="option2"> <label
								class="form-check-label" for="inlineRadio2">새로입력</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>기본주소</span>
					</div>
					<div class="col-8">
						<input id="normalAddress" type="text" class="form-control w-100"
							readonly value="${loginMember.address }">
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>배송주소</span>
					</div>
					<div class="col-8">
						<input id="shipAddress" type="text" class="form-control w-100"
							value="${loginMember.deliveryAddress }"> <input
							id="hiddenAddress" type="hidden"
							value="${loginMember.deliveryAddress }" />
					</div>
				</div>
				<div class="row">
					<div class="col-4"></div>
					<div class="col-8">

						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="radioAddressCheck" id="inlineRadio1" value="option1"
								checked> <label class="form-check-label"
								for="inlineRadio1">기본주소</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio"
								name="radioAddressCheck" id="inlineRadio2" value="option2">
							<label class="form-check-label" for="inlineRadio2">배송주소</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>연락처</span>
					</div>
					<div class="col-8">
						<input type="text" class="form-control w-100"
							value="${loginMember.phone }">
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<span>받는사람</span>
					</div>
					<div class="col-8">
						<input type="text" class="form-control w-100"
							value="${loginMember.memberName }">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-green">구매하기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="biddingModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">정말입찰하시겠습니까?</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body container-fluid">신중하시길...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-green"
					onclick="bid('${product.productNo}');">입찰하기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="reviewModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">판매자 후기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body container-fluid">
				<ul id="reviewContainer" class="list-group">

				</ul>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script src="${path }/resources/js/productDetail.js"></script>
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/views/common/footer.jsp" />