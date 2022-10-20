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
			<div class="row-4">
				<div class="total-class-box">
					<div class="total-class-font">
						 전체분류보기
				 	</div>
				 </div>
				 <div class="menu-item-frame">
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
				<div class="book-box">	
				 	<input class="book-chkbox" id="chkbox-input" type="checkbox">
				    <label for="chkbox-input">전체</label>
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
</html>