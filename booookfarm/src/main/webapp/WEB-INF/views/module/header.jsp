<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navigation-container hn-sticky">
  <ul class="navigation-element">
		<c:choose>
			<c:when test="${not empty sessionScope.loginData}">
				<li class="element"><a href="logout">로그아웃</a></li>
			</c:when>
			<c:otherwise>
				<li class="element"><a href="login">로그인</a></li>
			</c:otherwise>
		</c:choose>
    <li class="element"><a href="join">회원가입</a></li>
    <li class="element">1:1문의</li>
    <li class="element">마이페이지</li>
    <li class="element"><a href="basket">장바구니</a></li>
  </ul>
</nav>
		<header class="st-hd h-sticky">
				<div class="head-container hc-sticky">
					<div class="mainlogo-img">
						<a class="mainlogo" onclick="location.href='/boookfarm'">
							<img src="${path}/resources/img/mainlogo.png">
						</a>
					</div>
					<div class="serach-container">
						<div class="serach-box" >
		            		<select class="serach-select" title="목록 보기 유형 선택" id="select_search_sort">
		                		<option value="booktitle">도서명</option>
		                		<option value="bookpublisher">출판사</option>
		                		<option value="isbn">ISBN</option>
		            		</select>
	            		</div>
					<div class="full-sear input-container">
						<div class="sear-place input-layout">
							<form class="form-box" method="get">
								<input id="input_search_data" class="sear input-box" type="text">
								<button  class="serch-box" type="button">
									<img id="search_btn" src="${path}/resources/img/icon/serch_icon.png">
								</button>
							</form>
						</div>
					</div>
				</div>
				</div>
	<!-- 오른쪽 사이드 퀵메뉴(최근 본 목록) css: quick -->
	<div class="quickmenu">
	  <div class="quickmenu-title">
	  	<div>최근 본 상품</div>
	  		<div class="quickmenu-contianer">
	  				<div class="boookcard-view-box">
	  					<a class="bookcard-view-a">
	  						<img class="bookcard-view-img" src="${path}/resources/img/card-img.png">
	  						<div class="bookcard-cancel"></div>
		  					<div class="bookcard-view-info">
		  						<button class="bookcard-view-btn">
		  							<img src="${path}/resources/img/icon/x_icon_white.png" style="width: 1rem; height: 1.2rem;">
		  						</button>
		  						<div class="boook-view-title">이미지를 넣는 법에대해 알아보는 책입니다요</div>
		  						<div class="boook-view-price">30,000원</div>
		  					</div>
 					   </a>
 					</div>
  			</div>
	 	</div>
	</div>
		</header>