<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navigation-container">
  <ul class="navigation-element">
    <li class="element"><a href="login">로그인</a></li>
    <li class="element"><a href="join">회원가입</a></li>
    <li class="element">1:1문의</li>
    <li class="element">마이페이지</li>
    <li class="element">장바구니</li>
  </ul>
</nav>
		<header class="st-hd">
				<div class="head-container">
					<div class="mainlogo-img">
						<a class="mainlogo" onclick="location.href='/boookfarm'">
							<img src="${path}/resources/img/mainlogo.png">
						</a>
					</div>
					<div class="serach-container">
						<div class="serach-box" >
		            		<select class="serach-select" title="목록 보기 유형 선택" id="">
		                		<option value="10">도서명</option>
		                		<option value="20">출판사</option>
		                		<option value="50">ISBN</option>
		            		</select>
	            		</div>
					<div class="full-sear input-container">
						<div class="sear-place input-layout">
							<input class="sear input-box" type="text">
						</div>
							<a class="serch-box">
								<img src="${path}/resources/img/icon/serch_icon.png">
							</a>
					</div>
				</div>
				</div>
		</header>