<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
  <meta charset="UTF-8">
  <title>BooookFarm</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="${path}/resources/css/styles.css" />
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav class="navigation-container">
  <ul class="navigation-element">
    <li class="element"><a href="login">로그인</a></li>
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
  <div class="login-container">
    <div class="login-title">
      로그인
    </div>
    <form class="login-form">
      <div class="login-input-box">
        <input class="login-form__input" type="text" name="id" placeholder="아이디를 입력해주세요.">
      </div>
      <div class="login-err-box">
        <span class="login-err-msg hidden">아이디를 입력해주세요.</span>
      </div>
      <div class="login-input-box">
        <input class="login-form__input" type="password" name="password" placeholder="비밀번호를 입력해주세요.">
        <i id="showPw" class="fa-solid fa-eye"></i>
        <i id="hidePw" class="fa-solid fa-eye-slash hidden"></i>
      </div>
      <div class="login-err-box">
        <span class="login-err-msg hidden">비밀번호를 입력해주세요.</span>
      </div>
      <div class="login-check-box">
        <input id="saveId" class="login-form__checkbox" type="checkbox">
        <label for="saveId">아이디 기억하기</label>
      </div>
      <button class="login-form__btn btn--rec btn--blue" type="button">로그인</button>
    </form>
      <button class="login-form__btn btn--rec btn--green" type="button"><img src="${path}/resources/img/logos/naver-logo.png" /><span>네이버 아이디로 로그인</span></button>
      <button class="login-form__btn btn--rec btn--yellow" type="button"><img src="${path}/resources/img/logos/kakao-logo.png" /><span>카카오 아이디로 로그인</span></button>
      <div class="login-row">
        <span>회원가입</span>
        <span>아이디찾기</span>
        <span>비밀번호찾기</span>
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
<script>
</script>
<script src="${path}/resources/js/login.js"></script>

</body>
</html>