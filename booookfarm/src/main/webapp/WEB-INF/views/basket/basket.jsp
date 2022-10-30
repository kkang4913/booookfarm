<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<nav class="navigation-container">
		<ul class="navigation-element">
			<li class="element">로그인</li>
			<li class="element">회원가입</li>
			<li class="element">1:1문의</li>
			<li class="element">마이페이지</li>
			<li class="element">장바구니</li>
		</ul>
	</nav>
	
	<!-- 왼쪽 사이드 퀵메뉴(최근 본 목록) css: quick -->
	<div class="quickmenu">
	  <div class="quickmenu-title">
	  	<div>최근 본 상품</div>
	  		<div class="quickmenu-contianer">
	  			<div></div>
	  		</div>
	  </div>
	</div>
		<header class="st-hd">
				<div class="head-container">
					<div class="mainlogo-img">
						<div class="mainlogo">
							<p class="page-name">booookfarm</p>
						</div>
					</div>
					<div class="full-sear">
						<div class="sear-place">
							<input class="sear" type="text">
						</div>
					</div>	
				</div>
		</header>
		<main class="st-ma">
			<div class="main-container">
			<div class="basket-container">
				<div class="basket-layout">
					<div class="basket-title">
						<div class="basket-name">장바구니</div>
					</div>
					<div class="basket-icon">
						<div class="bas-icon to-bas-icon">
							<img src="${path}/resources/img/icon/basketicon.svg">
						</div>
						<div class="bas-name to-bas-icon">장바구니</div>
						<div class="bas-doticon">
							<img src="${path}/resources/img/icon/18-px-grey-5-dot.png">
						</div>
						<div class="bas-icon to-locker-icon">
							<img id="locker-btn" src="${path}/resources/img/icon/basketicon-grey.svg">
						</div>
						<div class="bas-name to-locker-icon">보관함</div>
					</div>
				</div>
				<div class="basket-list-container">
					<div class="basket-list-layout">
						<div class="total-delete-btn">
							<button class="total-delete-button" type="button">선택상품 삭제</button>
						</div>
						<div class="book-list-sort">	
							<div class="book-list">
								<div class="title-table">
									<table class="sort-test">
										<thead>
											<tr class="element-name-table">
												<th class="total-checkbox"><input name="bookCheck" class="total-checkbox" type="checkbox" onclick="selectAll(this)"></th>
												<th class="list-element-select">전체</th>
												<th class="list-element-info">상품정보</th>
												<th class="list-element-price">판매가</th>
												<th class="list-element-quantity">수량</th>
												<th class="list-element-seller">판매자</th>
												<th class="list-element-delivery">배송비</th>
												<th class="list-element-delete">선택</th>
											</tr>
										</thead>
										<tbody class="table-body">
											<tr class="element-table">
												<td class="checkbox"><input name="bookCheck" class="checkbox" type="checkbox"></td>
												<td class="accurate-select"></td>
												<td class="accurate-info">
													<div class="accurate-info-layout">
														<div class="info-img">
															<div class="basket-book-img">
																<img class="basket--img" src="${path}/resources/img/naomi.png">
															</div>
														</div>
														<div class="info-name">
															<div class="basket-book-name">
																사랑입니까1.2/U1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-price">
													<div class="accurate-price-layout">
														<div class="origin-price-won">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num">
															<div class="basket-book-minus">
																<img src="${path}/resources/img/icon/24-px-grey-7-remove.png">
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-plus">
																<img src="${path}/resources/img/icon/24-px-grey-7-add.png">
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
												<td class="delete-select">
													<div class="delete-select-layout">	
														<div class="delete-btn">
															<button class="delete-button">삭제</button>
														</div>
														<div class="storage-btn">
															<button class="storage-button">보관함</button>
														</div>
													</div>	
												</td>
											</tr>
											<tr class="element-table">
												<td class="checkbox"><input name="bookCheck" class="checkbox" type="checkbox"></td>
												<td class="accurate-select"></td>
												<td class="accurate-info">
													<div class="accurate-info-layout">
														<div class="info-img">
															<div class="basket-book-img">
																<img class="basket--img" src="${path}/resources/img/naomi.png">
															</div>
														</div>
														<div class="info-name">
															<div class="basket-book-name">
																사랑입니까1.2/U1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-price">
													<div class="accurate-price-layout">
														<div class="origin-price-won">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num">
															<div class="basket-book-minus">
																<img src="${path}/resources/img/icon/24-px-grey-7-remove.png">
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-plus">
																<img src="${path}/resources/img/icon/24-px-grey-7-add.png">
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
												<td class="delete-select">
													<div class="delete-select-layout">	
														<div class="delete-btn">
															<button class="delete-button">삭제</button>
														</div>
														<div class="storage-btn">
															<button class="storage-button">보관함</button>
														</div>
													</div>	
												</td>
											</tr>
											<tr class="element-table">
												<td class="checkbox"><input name="bookCheck" class="checkbox" type="checkbox"></td>
												<td class="accurate-select"></td>
												<td class="accurate-info">
													<div class="accurate-info-layout">
														<div class="info-img">
															<div class="basket-book-img">
																<img class="basket--img" src="${path}/resources/img/naomi.png">
															</div>
														</div>
														<div class="info-name">
															<div class="basket-book-name">
																사랑입니까1.2/U1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-price">
													<div class="accurate-price-layout">
														<div class="origin-price-won">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num">
															<div class="basket-book-minus">
																<img src="${path}/resources/img/icon/24-px-grey-7-remove.png">
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-plus">
																<img src="${path}/resources/img/icon/24-px-grey-7-add.png">
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
												<td class="delete-select">
													<div class="delete-select-layout">	
														<div class="delete-btn">
															<button class="delete-button">삭제</button>
														</div>
														<div class="storage-btn">
															<button class="storage-button">보관함</button>
														</div>
													</div>	
												</td>
											</tr>
											<tr class="element-table">
												<td class="checkbox"><input name="bookCheck" class="checkbox" type="checkbox"></td>
												<td class="accurate-select"></td>
												<td class="accurate-info">
													<div class="accurate-info-layout">
														<div class="info-img">
															<div class="basket-book-img">
																<img class="basket--img" src="${path}/resources/img/naomi.png">
															</div>
														</div>
														<div class="info-name">
															<div class="basket-book-name">
																사랑입니까1.2/U1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-price">
													<div class="accurate-price-layout">
														<div class="origin-price-won">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num">
															<div class="basket-book-minus">
																<img src="${path}/resources/img/icon/24-px-grey-7-remove.png">
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-plus">
																<img src="${path}/resources/img/icon/24-px-grey-7-add.png">
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
												<td class="delete-select">
													<div class="delete-select-layout">	
														<div class="delete-btn">
															<button class="delete-button">삭제</button>
														</div>
														<div class="storage-btn">
															<button class="storage-button">보관함</button>
														</div>
													</div>	
												</td>
											</tr>
											<tr class="element-table">
												<td class="checkbox"><input name="bookCheck" class="checkbox" type="checkbox"></td>
												<td class="accurate-select"></td>
												<td class="accurate-info">
													<div class="accurate-info-layout">
														<div class="info-img">
															<div class="basket-book-img">
																<img class="basket--img" src="${path}/resources/img/naomi.png">
															</div>
														</div>
														<div class="info-name">
															<div class="basket-book-name">
																사랑입니까1.2/U1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-price">
													<div class="accurate-price-layout">
														<div class="origin-price-won">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num">
															<div class="basket-book-minus">
																<img src="${path}/resources/img/icon/24-px-grey-7-remove.png">
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
														<div class="quantity-num">
															<div class="basket-book-plus">
																<img src="${path}/resources/img/icon/24-px-grey-7-add.png">
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
												<td class="delete-select">
													<div class="delete-select-layout">	
														<div class="delete-btn">
															<button class="delete-button">삭제</button>
														</div>
														<div class="storage-btn">
															<button class="storage-button">보관함</button>
														</div>
													</div>	
												</td>
											</tr>
										</tbody>
									</table>	
								</div>
							</div>
							<div id="test1" class="basket-order-container">
								<div id="test2" class="basket-order-layout">
									<div class="box-title">
										주문 금액
									</div>
									<div class="box-content">
										<div class="box-row">
											<div class="row--title">
												총 상품금액
											</div>
											<div class="row--data">
												2,000원
											</div>
										</div>
										<div class="box-row">
											<div class="row--title">
												배송비
											</div>
											<div class="row--data">
												3,000원
											</div>
										</div>
										<div class="box-row">
											<div class="row--title">
												도서산간료
											</div>
											<div class="row--data">
												0원
											</div>
										</div>
										<div class="divided"></div>	
										<div class="box-row as">
											<div class="row--title">
												총 결제금액
											</div>
											<div class="row--amount">
												5,000원
											</div>
										</div>
									</div>
									<div>
										<button class="order-box-button" type="button" onclick="order()">주문하기</button>
									</div>
								</div>
							</div>
						</div>	
					</div>	
				</div>
			</div>
			</div>
		</main>
		<footer class="st-ft">
			<div class="footer-container">
				<div class="footer-layout">
					<div class="footer-frame">
						<div class="footer-menu">
							<p class="ft-link">회사소개</p>
							|
							<p class="ft-link">개인정보취급방침</p>
							|
							<p class="ft-link">이용약관</p>
							|
							<p class="ft-link">고객센터</p>
						</div>
						<div class="footer-info">
							Copyright(c) 2022 ㈜ 시퀀스엔. All Rights Reserved [사업자정보] 대표전화 : 1544 -2949 | 대표(CEO) : 양종선 | 개인정보 보호책임자 : 양종선 사업자등록번<br>
							호 : 285-81-00634 | 통신판매업 신고번호 : 제 2017-서울서초-0272호. 서울시 서초구 서초대로 397 부띠크모나코 A동 301호 | Email : help@bookoa.com 
						</div>
						<div class="cs-frame">
							<div class="cs-inner">
								<div class="cus">고객만족센터</div>
								<div class="cus-num">1544-2949</div>
							</div>
						</div>
						<div class="cs-info web">
							<a href="#">상담시간 안내</a>
						</div>
					</div>
				</div>		
			</div>
		</footer>
</body>
<script type="text/javascript">
$(document).ready(function(){
  var currentPosition = parseInt($(".quickmenu").css("top"));
  $(window).scroll(function() {
    var position = $(window).scrollTop();
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
  });
}); 

$(document).ready(function(){
  var orderBox = parseInt($("#test2").css("top"));
  $(window).scroll(function() {
	  var orderPosition = $(window).scrollTop();
	  $("#test2").stop().animate({"top":orderPosition+orderBox-100+"px"},1000);
  });
});

$('.to-locker-icon').on('click', function(){
	location.href="/boookfarm/locker"
})

function selectAll(selectAll) {
	const checkboxes = document.getElementsByName('bookCheck');
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}

function order() {
	location.href="/boookfarm/payment";
}
</script>
</html>