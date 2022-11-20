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
<%@include file="/WEB-INF/views/module/header.jsp" %>
<!-- 왼쪽 사이드 퀵메뉴(최근 본 목록) css: quick -->
<div class="quickmenu">
  <div class="quickmenu-title">
  	<div>최근 본 상품</div>
  		<div class="quickmenu-contianer">
  			<div></div>
  		</div>
  </div>
</div>
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
								<tbody id="order_list" class="table-body">
								</tbody>
								<tfoot>	
									<tr class="shop-total">
										<td class="calculation" colspan="6">
											<strong id="total_book_price">0</strong> + 
											<strong>3,000</strong>원(유료배송) = 
											<strong id="total_pay">0</strong>
										</td>
									</tr>
								<tfoot>	
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
									<div id="order_price" class="row--data">
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
									<div id="total_price" class="row--amount">
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
							<input class="input-order-info static-info" type="text" value="${userData.memName}" disabled="disabled">
						</div>
					</div>
					<div class="payment-input-container">
						<div class="order-info-title">연락처</div>
						<div class="input-area">
							<input class="input-order-info static-info" type="text" value="${userData.phone}" disabled="disabled">
						</div>
					</div>
					<div class="payment-input-container">
						<div class="order-info-title">이메일</div>
						<div class="input-area">
							<input class="input-order-info static-info" type="text" value="${userData.email}" disabled="disabled">
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
							<input class="input-order-info info-border origin-info" type="text" value="${userData.memName}" disabled="disabled">
							<input class="input-order-info info-border hidden-info" type="hidden" value="홍길동">
						</div>
					</div>
					<div class="payment-input-container">
						<div class="order-info-title">연락처</div>
						<div class="input-area">
							<input class="input-order-info info-border origin-info" type="text" value="${userData.phone}" disabled="disabled">
							<input class="input-order-info info-border hidden-info" type="hidden" value="010-0000-0000">
						</div>
					</div>
					<div class="payment-input-container">
						<div class="order-info-title">이메일</div>
						<div class="input-area">
							<input class="input-order-info info-border origin-info" type="text" value="${userData.email}" disabled="disabled">
							<input class="input-order-info info-border hidden-info" type="hidden" value="honggildong@naver.com">
						</div>
					</div>
					<div class="payment-input-container">
						<div class="order-info-title">주소</div>
						<div class="input-area">
							<input id="postalCode" class="input-order-info-address info-border origin-info" type="text" value="${userData.postCode}" disabled="disabled">
							<input id="postalCode"  class="input-order-info-address info-border hidden-info" type="hidden" value="우편번호">
						</div>
						<div class="address-button-frame">
							<button id="address_button" class="address-btn" type="button" onclick="daumPostcode()">우편번호 검색</button>
						</div>
					</div>
					<div class="payment-input-container">
						<div class="order-info-title"></div>
						<div class="input-area">
							<input id="address" class="input-order-info info-border origin-info" type="text" value="${userData.addr}" disabled="disabled">
							<input id="address" class="input-order-info info-border hidden-info" type="hidden" value="기본 주소">
						</div>
					</div>	
					<div class="payment-input-container">
						<div class="order-info-title"></div>
						<div class="input-area">
							<input id="detailAddress" class="input-order-info info-border origin-info" type="text" value="${userData.detailAddr}" disabled="disabled">
							<input id="detailAddress" class="input-order-info info-border new-address hidden-info" type="hidden" value="상세 주소">
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
							<div class="possess-emoney">보유 E-Money ${userData.mileage} 원</div>
						</div>
						<div>
							<button class="use-mileage"type="button">전액사용</button>
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
<%@include file="/WEB-INF/views/module/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<script type="text/javascript">

function order_info(){
	var bookData =${bookCode};
	let _html = '';
	for(var i = 0; i < bookData.dataList.length; i++){
	console.log(bookData.dataList[i].sel_stock);
	let price = Math.floor(((bookData.dataList[i].bookPrice - (bookData.dataList[i].bookPrice * (bookData.dataList[i].bookDiscount * 0.01)))*bookData.dataList[i].sel_stock)/10)*10;
		_html += '<tr class="element-table">';
		_html += '<td class="accurate-info">';
		_html += '<div class="accurate-info-layout">';
		_html += '<div class="info-img">';
		_html += '<div class="basket-book-img">';
		_html += '<img class="basket--img" src="'+bookData.dataList[i].bookImgPath+'">';
		_html += '</div>';
		_html += '</div>';
		_html += '<div class="info-name">';
		_html += '<div class="basket-book-name">';
		_html += ''+bookData.dataList[i].bookTitle+'';
		_html += '</div>';
		_html += '</div>';
		_html += '</div>';
		_html += '</td>';
		_html += '<td class="accurate-price">';
		_html += '<div class="accurate-price-layout">';
		_html += '<div class="origin-price-won stan">';
		_html += '<div class="basket-book-price">';
		_html += ''+Math.floor(bookData.dataList[i].bookPrice).toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'원';
		_html += '</div>';
		_html += '</div>';
		_html += '<div class="discount-price-won stan">';
		_html += '<div class="basket-book-price">';
		_html += price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'원';
		_html += '<input id="d_price_'+i+'" type="hidden" name="order_price" value="'+price+'">';
		_html += '</div>';
		_html += '</div>';
		_html += '</div>';
		_html += '</td>';
		_html += '<td class="accurate-quantity">';
		_html += '<div class="accurate-quantity-layout">';
		_html += '<div class="quantity-num stan-2">';
		_html += '<div class="basket-book-quantity">';
		_html += bookData.dataList[i].sel_stock;
		_html += '</div>';
		_html += '</div>';
		_html += '</div>';
		_html += '</td>';
		_html += '<td class="accurate-seller">';
		_html += '<div class="accurate-seller-layout">';
		_html += '<div class="seller-name stan-3">';
		_html += '<div class="basket-book-seller">';
		_html += '북팜 중고만화';
		_html += '</div>';
		_html += '</div>';
		_html += '</div>';
		_html += '</td>';
		_html += '<td class="accurate-delivery-fee">';
		_html += '<div class="accurate-delivery-fee-layout">';
		_html += '<div class="delivery-fee-won stan-4">';
		_html += '<div class="basket-book-delivery-fee">';
		_html += '3,000원';
		_html += '</div>';
		_html += '</div>';
		_html += '</div>';
		_html += '</td>';
		_html += '</tr>';
	}
	$('#order_list').html(_html);
};

function order_sum(){
	let sum= 0;
	let price = $('#order_price');
	let total_price = $('#total_price');
	let book_price = $('#total_book_price');
	let total_book_price = $('#total_pay');
	 $("input[name='order_price']").each(function(){
		 let arr = $(this).attr("id").split("_");
		 let idx = arr[2];
		 let amount = $('#d_price_'+idx).val();
		 sum += parseInt(amount);
	 })
	price.html(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'원');
	total_price.html((sum+3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'원');
	book_price.html(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'원');
	total_book_price.html((sum+3000).toString().replace(/\B(?=(\d{3})+(?!\d))/g,",")+'원');
}

function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보+참고항목을 해당 필드에 넣는다.
            document.getElementById('postalCode').value = data.zonecode;
            document.getElementById("address").value = addr + extraAddr;
            isAddr = true;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

<!--결제 박스 -->
function order_box(){
     let orderBox = parseInt($("#test2").css("top"));
     $(window).scroll(function() {
   		 let orderPosition = $(window).scrollTop();
   		 $("#test2").stop().animate({"top":orderPosition+orderBox-150+"px"},1000);
     });
}
<!--주소 버튼-->	
function address_btn(){	
	$('.address-toggle2').click(function(){
		let o_hidden = document.querySelectorAll(".origin-info");
		for(let i = 0; i < o_hidden.length; i++) {
			let item = o_hidden.item(i);
			item.setAttribute("type", "hidden");
		}
	});
}

function address_btn2(){
	$('.address-toggle2').click(function(){
		let of_hidden = document.querySelectorAll(".hidden-info");
		for(let j = 0; j < of_hidden.length; j++) {
			let items = of_hidden.item(j);
			items.setAttribute("type", "text");
		}
	});
}

function address_btn3(){	
	$('.address-toggle1').click(function(){
		let o_hidden = document.querySelectorAll(".origin-info");
		for(let i = 0; i < o_hidden.length; i++) {
			let item = o_hidden.item(i);
			item.setAttribute("type", "text");
		}
	});
}

function address_btn4(){
	$('.address-toggle1').click(function(){
		let of_hidden = document.querySelectorAll(".hidden-info");
		for(let j = 0; j < of_hidden.length; j++) {
			let items = of_hidden.item(j);
			items.setAttribute("type", "hidden");
		}
	});
}
<!--결제방식 버튼-->
function payment_method(){
	$('.payment-toggle1').click(function(){
		let of_hidden = document.querySelector(".payment-input-container");
		of_hidden.setAttribute("type", "");
	});
}

function payment_method2(){
	$('.payment-toggle2').click(function(){
		let o_hidden = document.querySelector(".payment-input-container");
		o_hidden.setAttribute("type", "hidden");
	});
}

<!--최근 본 상품 -->
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop();
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
	  });
	  order_info();
	  order_box();
	  address_btn();
	  address_btn2();
	  address_btn3();
	  address_btn4();
	  payment_method();
	  payment_method2();
	  order_sum();
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