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
								<tbody id="basket_list" class="table-body">
								
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
<%@include file="/WEB-INF/views/module/footer.jsp" %>
</body>
<script type="text/javascript">
let d_stock = '';
let d_amount = '';
function get_basket_list(){
	$.ajax({
		url:"./basket_info",
		type: "GET",
		dataType: "json",
		success: function(data){
			let _html='';
			for(var i=0; i < data.dataList.length; i++){
				_html += '<tr class="element-table">';
				_html += '<td class="checkbox"><input name="bookCheck" class="checkbox" type="checkbox"></td>';
				_html += '<td class="accurate-select"></td>';
				_html += '<td class="accurate-info">';
				_html += '<div class="accurate-info-layout">';
				_html += '<div class="info-img">';
				_html += '<div class="basket-book-img">';
				_html += '<img class="basket--img" src="'+data.dataList[i].bookImgPath+'">';
				_html += '</div>';
				_html += '</div>';
				_html += '<div class="info-name">';
				_html += '<div class="basket-book-name">';
				_html += ''+data.dataList[i].bookTitle+'/'+data.dataList[i].bookAuthor+'';
				_html += '</div>';
				_html += '</div>';
				_html += '</div>';
				_html += '</td>';
				_html += '<td class="accurate-price">';
				_html += '<div class="accurate-price-layout">';
				_html += '<div class="origin-price-won">';
				_html += '<div class="basket-book-price">';
				_html += ''+data.dataList[i].bookPrice+'원';
				_html += '</div>';
				_html += '</div>';
				_html += '<div class="discount-price-won">';
				_html += '<div d-amount class="basket-book-price">';
				_html += ''+data.dataList[i].bookPrice - (data.dataList[i].bookPrice * (data.dataList[i].bookDiscount*0.01))+'원';
				_html += '</div>';
				_html += '</div>';
				_html += '</div>';
				_html += '</td>';
				_html += '<td class="accurate-quantity">';
				_html += '<div class="accurate-quantity-layout">';
				_html += '<div class="quantity-num">';
				_html += '<div class="basket-book-minus">';
				_html += '<img class="minus-btn" src="${path}/resources/img/icon/24-px-grey-7-remove.png" onclick="get_detail_stock(\'minus\',\''+i+'\')">';
				_html += '</div>';
				_html += '</div>';
				_html += '<div class="quantity-num">';
				_html += '<div class="basket-book-quantity">';
				_html += '<input id="d-stock_'+i+'" class="detail-stock" name="stockValue" type="text" value="1" disabled="disabled">';
				_html += '</div>';
				_html += '</div>';
				_html += '<div class="quantity-num">';
				_html += '<div class="basket-book-plus">';
				_html += '<img class="plus-btn" src="${path}/resources/img/icon/24-px-grey-7-add.png" onclick="get_detail_stock(\'plus\',\''+i+'\')">';
				_html += '</div>';
				_html += '</div>';
				_html += '</div>';
				_html += '</td>';
				_html += '<td class="accurate-seller"';
				_html += '<div class="accurate-seller-layout">';
				_html += '<div class="seller-name">';
				_html += '<div class="basket-book-seller">';
				_html += '북팜 중고만화';
				_html += '</div>';
				_html += '</div>';
				_html += '</div>';
				_html += '</td>';
				_html += '<td class="accurate-delivery-fee">';
				_html += '<div class="accurate-delivery-fee-layout">';
				_html += '<div class="delivery-fee-won">';
				_html += '<div class="basket-book-delivery-fee">';
				_html += '3,000원';
				_html += '</div>';
				_html += '</div>';
				_html += '</div>';
				_html += '</td>';
				_html += '<td class="delete-select">';
				_html += '<div class="delete-select-layout">';
				_html += '<div class="delete-btn">';
				_html += '<button class="delete-button">삭제</button>';
				_html += '</div>';
				_html += '<div class="storage-btn">';
				_html += '<button class="storage-button">보관함</button>';
				_html += '</div>';
				_html += '</div>';
				_html += '</td>';
				_html += '</tr>';
			d_stock = data.dataList[i].stock;
			d_amount = data.dataList[i].bookPrice - (data.dataList[i].bookPrice * (data.dataList[i].bookDiscount*0.01));
			}
			$('#basket_list').html(_html);
		}
	});	
}

function get_detail_stock(type, id){
	let value = 'd-stock_'+id;
	console.log(value);
	const resultElement = document.getElementById(value);
	let stock = resultElement.value;
	if(type === "plus") {
		stock = parseInt(stock) >= d_stock ? d_stock : parseInt(stock) + 1;
	}else if(type === "minus") {
		stock = parseInt(stock) <= 1 ? 1 : parseInt(stock) - 1;
	}
	resultElement.value = stock;
	get_detail_amount();
}

function get_detail_amount(){
	const resultAmount = document.getElementById('d-amount');
	const resultStock = document.getElementById('d-stock');
	let amount = resultAmount.html();
	let stock = resultStock.value;
	amount = d_amount * parseInt(stock);
	resultAmount.html(amount);
}

//보관함 아이콘 클릭 이벤트
$('.to-locker-icon').on('click', function(){
	location.href="/boookfarm/locker"
})
//체크박스 전체선택 함수
function selectAll(selectAll) {
	const checkboxes = document.getElementsByName('bookCheck');
	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}
//주문하기 버튼 클릭 이벤트
function order() {
	location.href="/boookfarm/payment";
}

function get_order_box(){	
  var orderBox = parseInt($("#test2").css("top"));
  $(window).scroll(function() {
	  var orderPosition = $(window).scrollTop();
	  $("#test2").stop().animate({"top":orderPosition+orderBox-100+"px"},1000);
  });
}

$(document).ready(function(){
  var currentPosition = parseInt($(".quickmenu").css("top"));
  $(window).scroll(function() {
    var position = $(window).scrollTop();
    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
  });
  get_order_box();
  get_basket_list();
}); 

</script>
</html>