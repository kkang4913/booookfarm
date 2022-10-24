<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						<a class="mainlogo">
							<img src="${path}/resources/img/mainlogo.png" style="width: 20rem;">
						</a>
					</div>	
					<div class="full-sear input-container">
						<div class="sear-place input-layout">
							<input class="sear input-box" type="text">
						</div>
					</div>	
				</div>
			
		</header>
		<main class="st-ma">
		<div class="main-container">
			<!-- 오른쪽 사이드 메뉴 -->
			<div class="row-4">
				<div class="sidemenu-container">
					<div class="sidemenu-title">
						 전체분류보기
				 	</div>
				 </div>
				 <div class="sidemenu-item-container">
				 	<div class="menu-item">
				 		<span>전체보기</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>AAA</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>BBB</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>CCC</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>DDD</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>FFF</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>GGG</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>HHH</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>III</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>JJJ</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>KKK</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>LLL</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>MMM</span>
				 	</div>
				 </div>
			</div>
			<div class="row-8">
				<div class="chkbox-container">	
					<div class="chbox-container-layout">
				 		<input class="book-chkbox" id="chkbox-input" type="checkbox">
				   		 <label for="chkbox-input">전체</label>
				<div>
            		<select class="select-list-box" title="목록 보기 유형 선택" id="selListPer">
                		<option value="10">10개씩 보기</option>
                		<option value="20">20개씩 보기</option>
                		<option value="50">50개씩 보기</option>
            		</select>
            	</div>
            		<select class="select-list-box"  title="목록 보기 유형 선택" id="selListPer">
                		<option value="">최신 등록순</option>
                		<option value="">정확도 높은순</option>
                		<option value="">낮은 가격순</option>
                		<option value="">높은 가격순</option>
                		<option value="">출간일순</option>
            		</select>
            		</div>
				 </div>
				 <div class="bookcard-container">
					<ol>
						<li class="bookcard-flex">
							<!-- 상품 선택 체크박스 -->
							<div>
				 				<input class="bookcard-chkbox-card" id="chkbox-input" type="checkbox">
								<label class="bookcard-chkbox-input" for="chkbox-input">
									<span>상품선택</span>
								</label>
							</div>
							<!-- 상품 이미지 -->
							<div>
								<div class="">
									<a>
										<span>
											<img class="book-img" src="${path}/resources/img/card-img.png">
										</span>
									</a>
								</div>
							</div>
							<!-- 상품 정보 -->
							<div class="card-info-box">
									<div class="book-view" >
										<a  href=>
											<span>싸움을 잘하는 법</span>
										</a>
											<span class="book-view-cnt">조회수 : 0</span>
									</div>			
								<div class="book-info-author">
									<span>
										<a>저자 싸움의 신 | 출판사 갓 오브 하이 스쿨 | 출간일 2022.10.22</a>
									</span>
								</div>
								<div>
									<div></div>
									<div></div>
									<div></div>
								</div>
							</div>
							<!-- 장바구니, 구매하기 버튼 -->
							<div class="book-basket-buy">
								<div class="book-buy-layout">
									<button class="book-buy-btn"  type="button">
										<span>바로구매</span>
									</button>
								</div>
								<div class="book-basket-layout">
									<button class="book-basket-btn" type="button">
										<span>장바구니</span>
									</button>
								</div>
							</div>
						</li>
						
					</ol> 	
				</div>	
				</div>
				<ul id="pagingul">
				</ul>
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

<!-- 왼쪽 퀵 메뉴(최근 본 상품) 조절 스크립트 -->
<script type="text/javascript">
$(document).ready(function(){
	  var currentPosition = parseInt($(".quickmenu").css("top"));
	  $(window).scroll(function() {
	    var position = $(window).scrollTop(); 
	    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
	  });
	});
</script>

</html>