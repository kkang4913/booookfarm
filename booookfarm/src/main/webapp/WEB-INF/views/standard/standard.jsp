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
	<!-- 왼쪽 사이드 퀵메뉴(최근 본 목록) css: quick -->
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
<%@ include file="/WEB-INF/views/module/header.jsp" %>
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
				 		<span>건강,취미 스포츠/잡지,만화</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>여행/요리,가정생활/예술</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>어린이교구,아동</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>초/중/고학습</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>日本書籍</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>Foreign Books/어린이 영어</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>외국어/한국소개도서</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>경제,경영,자기계발/정치,사회</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>과학,기술,컴퓨터</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>소설,시,에세이</span>
				 	</div>
				 	<div class="menu-item name">
				 		<span>인문,역사,문화,종교</span>
				 	</div>
				 </div>
			</div>
			<div class="row-8">
			 <div class="book-list-container">
				<div class="chkbox-container">
					<div class="chbox-container-layout">
				 		<input class="book-chkbox" id="chkbox-input" type="checkbox" onclick="selectAll(this);">
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
			 <div class="main-book-list" id="book-list">
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
											<img class="bookcard-img" src="${path}/resources/img/card-img.png">
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
								<div class="card-info-price">
									<div class="card-price">정가: 30,000원</div>
									<div class="card-sale-price">판매가: 15,000원</div>
									<div class="sale">50%
										<div class="down-arrow">➔</div>
									</div>
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
											<img class="bookcard-img" src="${path}/resources/img/card-img.png">
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
								<div class="card-info-price">
									<div class="card-price">정가: 30,000원</div>
									<div class="card-sale-price">판매가: 15,000원</div>
									<div class="sale">50%
										<div class="down-arrow">➔</div>
									</div>
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
											<img class="bookcard-img" src="${path}/resources/img/card-img.png">
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
								<div class="card-info-price">
									<div class="card-price">정가: 30,000원</div>
									<div class="card-sale-price">판매가: 15,000원</div>
									<div class="sale">50%
										<div class="down-arrow">➔</div>
									</div>
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
											<img class="bookcard-img" src="${path}/resources/img/card-img.png">
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
								<div class="card-info-price">
									<div class="card-price">정가: 30,000원</div>
									<div class="card-sale-price">판매가: 15,000원</div>
									<div class="sale">50%
										<div class="down-arrow">➔</div>
									</div>
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
		 </div>
	 </div>
				<ul id="pagingul">
				</ul>
				</div>
		</main>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
		
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
$(document).on('mouseover', '.boookcard-view-box', function(e){
    e.preventDefault();  
  $('.bookcard-view-info').css('display', 'block');
})


$(document).on('mouseout', '.boookcard-view-box', function(e){
    e.preventDefault();  
  $('.bookcard-view-info').css('display', 'none');
})

<!-- 사이드바 카테고리 선택  -->
const menuWrap = document.querySelector('.sidemenu-item-container');
 
        function select(divEl,target){
            Array.from(divEl.children).forEach(
                v => v.classList.remove('selected')
            )
            if(target) target.classList.add('selected');
        }
       	 menuWrap.addEventListener('click', e => {
          	  const selected = e.target;
            	select(menuWrap, selected);
        })

<!-- 전체 체크박스 스크립트 -->
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
</html>