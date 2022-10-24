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
<title>책 정보 페이지</title>
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
			<div class="main-container">
			<div class="book-info-container">
				<div class="book--info">
					<div class="main--info">
						<div class="book--condition">
						최상급
						</div>
						<div class="book--name">
						나오미와 가나코
						</div>
						<div class="book--detail-info">
							<span>저자 오쿠다 히데오</span>
							&nbsp;
							|
							&nbsp;
							<span>출판사 예담</span>
							&nbsp;
							|
							&nbsp;
							<span>상품등록일 2022.10.20</span>
						</div>
					</div>
					<div class="book-detail-layout">
						<div class="book-detail-card">
							<div class="book-img">
								<img class="book--img" src="${path}/resources/img/naomi.png">
							</div>
							<div class="detail-card-info">
								<div class="row-info">
									<div class="row-title">카테고리</div>
									<div class="basic-data">
										<div class="cate-info">
											소설>일본소설
										</div>
									</div>
								</div>
								<div class="row-info">	
									<div class="row-title">ISBN</div>
									<div class="basic-data">
										<div class="isbn-info">
											9788959139224
										</div>
									</div>
								</div>
								<div class="row-info">	
									<div class="row-title">판매가</div>
									<div class="basic-data">
										<div class="price-info">
											3,000원
										</div>
										<div class="sale-percent">
											88%
										</div>
										<div class="common-direction">
											down
										</div>
									</div>
								</div>
								<div class="row-info">	
									<div class="row-title">정가</div>
									<div class="basic-data">
										<div class="origin-price">
											13,500원
										</div>
									</div>
								</div>
								<div class="row-info">	
									<div class="row-title">배송비</div>
									<div class="basic-data">
										<div class="delivery-fee">
											3000원
										</div>
									</div>
								</div>
								<div class="row-info">	
									<div class="basic-data">
										<div class="delivery-info">
											판매자 상품 30,000원이상 구매시 무료배송
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="book-intro-container">
					<div class="book-intro-layout">
						<div class="book-intro-card">
							<div class="book-card">
								<div class="row-intro">
									<div class="row-intro-title">판매자 책설명</div>
								</div>
								<div class="row-intro-data">	
									<div class="intro-data">
										안쪽 제목밑에 직인 있습니다.<br>
										그외 깨끗합니다.
									</div>
								</div>
							</div>
							<div class="book-card">
								<div class="row-intro">
									<div class="row-intro-title">책소개</div>
								</div>
								<div class="row-intro-data">	
									<div class="intro-data">
										오쿠다 히데오만이 쓸 수 있는 최고의 서스펜스 당신도 이 여자들을 응원할 수밖에 없다! 마지막 한 줄까지 손에 땀을 쥐게
										한다! 유머와 페이소스를 장착한 최고의 스토리텔러 오쿠다 히데오의 신작 장편소설『나오미와 가나코』가 예담출판사에서
										출간됐다. 오쿠다 히데오가 고도의 서스펜스 스타일로...
									</div>
								</div>
							</div>
							<div class="book-card">
								<div class="row-intro">
									<div class="row-intro-title rule">북팜 안내사항</div>
								</div>
								<div class="row-intro-data">	
									<div class="intro-rule">
										- 위 판매상품은 판매자가 직접 등록/판매하는 상품으로 판매자가 해당 상품과 내용에 모든 책임을 지며 중개시스템만 &nbsp;&nbsp;제공하는 북팜은 일체책임을 지지않습니다.<br>
										- 북팜에서는 개인정보보호법을 위반하는 개인정보가 포함된 도서는 판매금지입니다.위반내용이 접수되는 경우 북팜 &nbsp;&nbsp;에서는 임의로 해당도서를 삭제할 수 있습니다.<br>
										- 북팜에서 판매되는 중고상품의 취소 및 반품은 판매자와 별도 협의 후 진행 가능합니다.<br>
										- ISBN으로 등록된 도서 이미지 및 정가는 실제와 다를 수 있습니다.
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
			<div class="order-select-container">
				<div class="order-inner-layout">
					<div class="order-frame">
						<div class="col-name">
							수량
						</div>
						<div class="quantity-img-box">
							<img class="minus-img" src="${path}/resources/img/icon/minus.png">
						</div>
						<div class="col-amount">
							1
						</div>
						<div class="quantity-img-box">
							<img class="plus-img" src="${path}/resources/img/icon/plus.png">						
						</div>
					</div>
 					<div class="order-frame alpa">
						<div class="col-name delta">
							결제예정금액
						</div>
						<div class="col-price">
							10,000
						</div>
						<div class="col-won">
							원
						</div>
					</div>
					<div class="order-button-frame">
						<div class="botton-col left">
							<button class="basket-btn" type="button"><span>장바구니</span></button>
						</div>
						<div class="botton-col right">
							<button class="purchase-btn" type="button"><span>바로구매</span></button>
						</div>
					</div>
				</div>
			</div>
			</div>
		</main>
		<footer class="st-ft-detail">
			<div class="book-recommend-container">
					<div class="book-recommend-layout">
						<div class="recommend-card">
							<div class="recommend-title">
								<div class="recommend-name">북팜 최신 등록도서</div>
							</div>
						<div class="book-sort">	
							<div class="book-fix">
								<div class="latest-book-img">
									<div class="latest-book">
										<img class="latest-recommend" src="${path}/resources/img/naomi.png">
									</div>
								</div>
								<div class="book-name-place">
									<div class="latest-book-name">나오미와 가나코</div>
								</div>
								<div class="author-name-place">
									<div class="recommend-author">오쿠다 히데오</div>
								</div>
							</div>
							<div class="book-fix">
								<div class="latest-book-img">
									<div class="latest-book">
										<img class="latest-recommend" src="${path}/resources/img/nolove.png">
									</div>
								</div>
								<div class="book-name-place">
									<div class="latest-book-name">사랑받지 못한 여자</div>
								</div>
								<div class="author-name-place">
									<div class="recommend-author">넬레 노이하우스</div>
								</div>
							</div>	
							<div class="book-fix">
								<div class="latest-book-img">
									<div class="latest-book">
										<img class="latest-recommend" src="${path}/resources/img/sample.png">
									</div>
								</div>
								<div class="book-name-place">
									<div class="latest-book-name">정미소 풍경</div>
								</div>
								<div class="author-name-place">
									<div class="recommend-author">구활</div>
								</div>
							</div>
							<div class="book-fix">
								<div class="latest-book-img">
									<div class="latest-book">
										<img class="latest-recommend" src="${path}/resources/img/polimath.png">
									</div>
								</div>
								<div class="book-name-place">
									<div class="latest-book-name">폴리매스</div>
								</div>
								<div class="author-name-place">
									<div class="recommend-author">와카스 아매드</div>
								</div>
							</div>
							<div class="book-fix">
								<div class="latest-book-img">
									<div class="latest-book">
										<img class="latest-recommend" src="${path}/resources/img/wkwhsrka.png">
									</div>
								</div>
								<div class="book-name-place">
									<div class="latest-book-name">자존감 수업</div>
								</div>
								<div class="author-name-place">
									<div class="recommend-author">윤홍균</div>
								</div>
							</div>
							<div class="book-fix">
								<div class="latest-book-img">
									<div class="latest-book">
										<img class="latest-recommend" src="${path}/resources/img/vkvldyd.png">
									</div>
								</div>
								<div class="book-name-place">
									<div class="latest-book-name">파피용</div>
								</div>
								<div class="author-name-place">
									<div class="recommend-author">베르나르 베르베르</div>
								</div>
							</div>
						</div>			
						</div>
					</div>
				</div>
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