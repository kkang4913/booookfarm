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
<title>주문서작성/결제</title>
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
						<div class="basket-name">주문서작성 / 결제</div>
					</div>
					<div class="basket-icon">
						<div class="bas-icon non-pointer">
							<img src="${path}/resources/img/icon/basketicon-grey.svg">
						</div>
						<div class="bas-name non-pointer">장바구니</div>
						<div class="bas-doticon">
							<img src="${path}/resources/img/icon/18-px-grey-5-dot.png">
						</div>
						<div class="bas-icon non-pointer">
							<img src="${path}/resources/img/icon/48-px-payment-active.svg">
						</div>
						<div class="bas-name non-pointer">주문서작성/결제</div>
						<div class="bas-doticon">
							<img src="${path}/resources/img/icon/18-px-grey-5-dot.png">
						</div>
						<div class="bas-icon non-pointer">
							<img src="${path}/resources/img/icon/48-px-complete-normal.svg">
						</div>
						<div class="bas-name non-pointer">주문완료</div>
					</div>
				</div>
				<div class="basket-list-container">
					<div class="basket-list-layout">
						<div class="order-title">
							주문상품
						</div>
						<div class="book-list-sort">	
							<div class="book-list">
								<div class="title-table">
									<table class="sort-test">
										<thead>
											<tr class="element-name-table">
												<th class="list-element-info">상품정보</th>
												<th class="list-element-price">판매가</th>
												<th class="list-element-quantity">수량</th>
												<th class="list-element-seller">판매자</th>
												<th class="list-element-delivery">배송비</th>
											</tr>
										</thead>
										<tbody class="table-body">
											<tr class="element-table">
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
														<div class="origin-price-won stan">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won stan">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num stan-2">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name stan-3">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won stan-4">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr class="element-table">
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
														<div class="origin-price-won stan">
															<div class="basket-book-price">
																9,000원
															</div>
														</div>
														<div class="discount-price-won stan">
															<div class="basket-book-price">
																1,000원
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-quantity">
													<div class="accurate-quantity-layout">
														<div class="quantity-num stan-2">
															<div class="basket-book-quantity">
																1
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-seller">
													<div class="accurate-seller-layout">
														<div class="seller-name stan-3">
															<div class="basket-book-seller">
																북팜 중고만화
															</div>
														</div>
													</div>
												</td>
												<td class="accurate-delivery-fee">
													<div class="accurate-delivery-fee-layout">
														<div class="delivery-fee-won stan-4">
															<div class="basket-book-delivery-fee">
																3,000원
															</div>
														</div>
													</div>
												</td>
											</tr>
											<tr class="shop-total">
												<td class="calculation" colspan="6">
													<strong>2,000</strong>원 + 
													<strong>3,000</strong>원(유료배송) = 
													<strong>5,000</strong>원
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
										<div class="box-row">
											<div class="row--title">
												포인트 사용
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
										<button class="order-box-button" type="button">결제하기</button>
									</div>
								</div>
							</div>
						</div>	
					</div>	
				</div>
				<form class="order-info-container">
					<div class="order-info-layout">
						<div class="title-area">주문자 정보</div>
						<div class="detail-area">
							<div class="payment-input-container">
								<div class="order-info-title">주문하신 분</div>
								<div class="input-area">
									<input class="input-order-info static-info" type="text" value="이도엽" disabled="disabled">
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">연락처</div>
								<div class="input-area">
									<input class="input-order-info static-info" type="text" value="010-1234-1234" disabled="disabled">
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">이메일</div>
								<div class="input-area">
									<input class="input-order-info static-info" type="text" value="dohyoup@naver.com" disabled="disabled">
								</div>
							</div>		
						</div>
					</div>
					<div class="order-info-layout">
						<div class="title-area">배송지 정보</div>
						<div class="detail-area">
							<div class="payment-input-container">
								<div class="order-info-title">배송지</div>
								<div class="input-area">
									<button class="address-toggle1 on" type="button" >기본주소</button>
									<button class="address-toggle2 off" type="button" >새로운주소</button>
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">받으시는 분</div>
								<div class="input-area">
									<input class="input-order-info info-border origin-info" type="text" value="이도엽" disabled="disabled">
									<input class="input-order-info info-border hidden-info" type="hidden" value="홍길동">
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">연락처</div>
								<div class="input-area">
									<input class="input-order-info info-border origin-info" type="text" value="010-1234-1234" disabled="disabled">
									<input class="input-order-info info-border hidden-info" type="hidden" value="010-0000-0000">
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">이메일</div>
								<div class="input-area">
									<input class="input-order-info info-border origin-info" type="text" value="dohyoup@naver.com" disabled="disabled">
									<input class="input-order-info info-border hidden-info" type="hidden" value="honggildong@naver.com">
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">주소</div>
								<div class="input-area">
									<input class="input-order-info-address info-border origin-info" type="text" value="15010" disabled="disabled">
									<input class="input-order-info-address info-border hidden-info" type="hidden" value="우편번호">
								</div>
								<div class="address-button-frame">
									<button class="address-btn" type="button">우편번호 검색</button>
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title"></div>
								<div class="input-area">
									<input class="input-order-info info-border origin-info" type="text" value="서울 강북구 오현로 9길" disabled="disabled">
									<input class="input-order-info info-border hidden-info" type="hidden" value="기본 주소">
								</div>
							</div>	
							<div class="payment-input-container">
								<div class="order-info-title"></div>
								<div class="input-area">
									<input class="input-order-info info-border origin-info" type="text" value="동성38동 202호" disabled="disabled">
									<input class="input-order-info info-border new-address hidden-info" type="hidden" value="상세 주소">
								</div>
							</div>
						</div>
					</div>
					<div class="order-info-layout">
						<div class="title-area">결제정보</div>
						<div class="detail-area">
							<div class="payment-input-container">
								<div class="order-info-title">E-Money 사용</div>
								<div class="input-area">
									<input class="input-order-info-emoney info-border" type="text"  value="0">
								</div>
								<div class="order-info-title-half">
									<div class="possess-emoney">보유 E-Money 원</div>
								</div>
								<div>
									<button class="use-mileage"type="button">전액사용</button>
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">B-Money 사용</div>
								<div class="input-area">
									<input class="input-order-info-emoney info-border" type="text" value="0">
								</div>
								<div class="order-info-title-half">
									<div class="possess-bmoney">보유 B-Money 0P</div>
								</div>
								<div>
									<button class="use-mileage" type="button">전액사용</button>
								</div>
							</div>
							<div class="payment-input-container">
								<div class="order-info-title">결제수단</div>
								<div class="input-area">
									<button class="payment-toggle1 p_on" type="button">무통장입금</button>
									<button class="payment-toggle2 p_off" type="button">신용카드</button>
								</div>
							</div>
							<div class="payment-input-container pay_on">
								<div class="order-info-title"></div>
								<div class="input-area">
									<div class="depositor">입금자명</div>
									<input class="depositor-name info-border" type="text" placeholder="입금자명을 입력해주세요.">
								</div>
							</div>
							<div class="payment-input-container pay_on">
								<div class="order-info-title"></div>
								<div class="input-area">
									<div class="deposit-bank">입금은행</div>
									<select class="deposit-bank-name">
										<option class="deposit-bank-element"></option>
										<option class="deposit-bank-element">기업은행</option>
										<option class="deposit-bank-element">국민은행</option>
										<option class="deposit-bank-element">하나은행</option>
										<option class="deposit-bank-element">농협은행</option>
										<option class="deposit-bank-element">우리은행</option>
										<option class="deposit-bank-element">신한은행</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</form>
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
<!--최근 본 상품 -->
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop();
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
	  });
}); 
<!--결제 박스 -->
$(document).ready(function(){
      let orderBox = parseInt($("#test2").css("top"));
      $(window).scroll(function() {
	    let orderPosition = $(window).scrollTop();
	    $("#test2").stop().animate({"top":orderPosition+orderBox-150+"px"},1000);
      });
});
<!--주소 버튼-->	
$(document).ready(function(){	
	$('.address-toggle2').click(function(){
		let o_hidden = document.querySelectorAll(".origin-info");
		for(let i = 0; i < o_hidden.length; i++) {
			let item = o_hidden.item(i);
			item.setAttribute("type", "hidden");
		}
	});
});

$(document).ready(function(){
	$('.address-toggle2').click(function(){
		let of_hidden = document.querySelectorAll(".hidden-info");
		for(let j = 0; j < of_hidden.length; j++) {
			let items = of_hidden.item(j);
			items.setAttribute("type", "text");
		}
	});
});

$(document).ready(function(){	
	$('.address-toggle1').click(function(){
		let o_hidden = document.querySelectorAll(".origin-info");
		for(let i = 0; i < o_hidden.length; i++) {
			let item = o_hidden.item(i);
			item.setAttribute("type", "text");
		}
	});
});

$(document).ready(function(){
	$('.address-toggle1').click(function(){
		let of_hidden = document.querySelectorAll(".hidden-info");
		for(let j = 0; j < of_hidden.length; j++) {
			let items = of_hidden.item(j);
			items.setAttribute("type", "hidden");
		}
	});
});
<!--결제방식 버튼-->
$(document).ready(function(){
	$('.payment-toggle1').click(function(){
		let of_hidden = document.querySelector(".payment-input-container");
		of_hidden.setAttribute("type", "");
	});
});

$(document).ready(function(){
	$('.payment-toggle2').click(function(){
		let o_hidden = document.querySelector(".payment-input-container");
		o_hidden.setAttribute("type", "hidden");
	});
});

<!--버튼 on off -->
$('.address-toggle2').on('click', function(){
	$('.address-toggle2').removeClass('off');
	$('.address-toggle2').addClass('on');
	$('.address-toggle1').removeClass('on');
	$('.address-toggle1').addClass('off');
});

$('.address-toggle1').on('click', function(){
	$('.address-toggle1').addClass('on');
	$('.address-toggle2').removeClass('on');
	$('.address-toggle1').removeClass('off');
	$('.address-toggle2').addClass('off');
});

$('.payment-toggle2').on('click', function(){
	$('.payment-toggle2').removeClass('p_off');
	$('.payment-toggle2').addClass('p_on');
	$('.payment-toggle1').removeClass('p_on');
	$('.payment-toggle1').addClass('p_off');
});

$('.payment-toggle1').on('click', function(){
	$('.payment-toggle1').addClass('p_on');
	$('.payment-toggle2').removeClass('p_on');
	$('.payment-toggle1').removeClass('p_off');
	$('.payment-toggle2').addClass('p_off');
});

<!--결제수단별 디스플레이 on off -->
$('.p_off').on('click', function(){
	$('.pay_on').addClass('pay_off');
});

$('.p_on').on('click', function(){
	$('.pay_on').removeClass('pay_off');
})
</script>
</html>