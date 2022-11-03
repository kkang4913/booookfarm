<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>Booookfarm</title>
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
		<form action=""></form>
		<main class="st-ma">
		<div class="main-container">
			<!-- 왼쪽 사이드 메뉴 -->
			<div class="row-4">
				<div class="sidemenu-container">
					<div class="sidemenu-title">
						 전체분류보기
				 	</div>
				 </div>
				 <div id="main-category-list" class="sidemenu-item-container">
				 	<!-- 
				 	<div class="menu-item">
				 		<span>전체보기</span>
				 	</div>
				 	<div class="menu-item ">
				 		<span>건강,취미 스포츠/잡지,만화</span>
				 	</div>
				 	<div class="menu-item ">
				 		<span>여행/요리,가정생활/예술</span>
				 	</div>
				 	<div class="menu-item ">
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
				 	 -->
				 </div>
			</div>
			<div class="row-8">
			 <div class="book-list-container">
				<div class="chkbox-container">
					<div class="chbox-container-layout">
				 		<input class="book-chkbox" id="chkbox-input" type="checkbox" onclick="selectAll(this);">
				   		 <label for="chkbox-input">전체</label>
				<div>
            		<select class="select-list-box" title="목록 보기 유형 선택" id="select_page_cnt">
                		<option value="5">5개씩 보기</option>
                		<option value="10">10개씩 보기</option>
                		<option value="15">15개씩 보기</option>
                		<option value="100">100개씩 보기</option>
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
		<%-- 			 <div class="bookcard-container">
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
								<div>
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
								<div class="book-buy-layout top">
									<button class="book-buy-btn"  type="button">
										<span>바로구매</span>
									</button>
								</div>
								<div class="book-basket-layout bottom">
									<button class="book-basket-btn" type="button">
										<span>장바구니</span>
									</button>
								</div>
							</div>
						</li>
					</ol>
				</div>
				--%>
			</div>
				<ul id="pagingul">
				</ul>
		</main>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
</body>


<!-- 왼쪽 퀵 메뉴(최근 본 상품) 조절 스크립트 -->
<script type="text/javascript">
let totalData ='';
let dataPerPage= '';
let globalCurrentPage = 1; //현재 페이지
let pageCount = 5; //페이징에 나타낼 페이지 수

$(document).ready(function(){
	dataPerPage= $('#select_page_cnt').val();
	main_page_list(1,dataPerPage);
	   
var currentPosition = parseInt($(".quickmenu").css("top"));

$(window).scroll(function() {
  var position = $(window).scrollTop();
  $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},500);
	});
});


let m_page = 1;
function main_page_list(page,dataPerPage) {
	m_page = page;
	let _url = "./list?page="+ page + "&page_count=" + $('#select_page_cnt').val();
	$.ajax({
		url: _url,
		type: "GET",
		dataType: "json",
		success: function(res) {
			let book_html='';
			let _page = '';
			
			m_page = Number(page);
		    dataPerPage = Number(dataPerPage);
			
		    console.log("현재 페이지" + m_page);
		    console.log("한 페이지에 나타낼 글 수" + dataPerPage);
		    
		    for ( var i = (m_page - 1) * dataPerPage;
		    			i < (m_page - 1) * dataPerPage + dataPerPage; i++) {
				book_html += '<div class="bookcard-container">';
				book_html += '<ol>';
				book_html += '<li class="bookcard-flex">';
				book_html += '<div>';
				book_html += '<input class="bookcard-chkbox-card" id="chkbox-input" type="checkbox">';
				book_html += '<label class="bookcard-chkbox-input" for="chkbox-input">';
				book_html += '<span>상품선택</span>';
				book_html += '</label>';
				book_html += '</div>';
				book_html += '<div>';
				book_html += '<div>';
				book_html += '<a>';
				book_html += '<span>';
				book_html += '<img class="bookcard-img" src="${path}/resources/img/card-img.png">';
				book_html += '</span>';
				book_html += '</a>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '<div class="card-info-box">';
				book_html += '<div class="book-view">';
				book_html += '<a href=#>';
				book_html += '<span>'+res.datas[i].bookTitle+'</span>';
				book_html += '</a>';
				book_html += '<span class="book-view-cnt">조회수 :'+0+'</span>';
				book_html += '</div>';
				book_html += '<div class="book-info-author">';
				book_html += '<span>';
				book_html += '<a>저자 '+res.datas[i].bookAuthor+'&nbsp;|&nbsp;출판사 '+res.datas[i].publisher+'&nbsp;|&nbsp; 출간일 '+res.datas[i].createDate+'</a>';
				book_html += '</span>';
				book_html += '</div>';
				book_html += '<div class="card-info-price">';
				book_html += '<div class="card-price">정가: '+res.datas[i].bookPrice+'원</div>';
				book_html += '<div class="card-sale-price">판매가: 15,000원</div>';
				book_html += '<div class="sale">'+res.datas[i].bookDiscount+'%';
				book_html += '<div class="down-arrow">➔</div>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '<div class="book-basket-buy">';
				book_html += '<div class="book-buy-layout top">';
				book_html += '<button class="book-buy-btn"  type="button">';
				book_html += '<span>바로구매</span>';
				book_html += '</button>';
				book_html += '</div>';
				book_html += '<div class="book-basket-layout bottom">';
				book_html += '<button class="book-basket-btn" type="button">';
				book_html += '<span>장바구니</span>';
				book_html += '</button>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '</li>';
				book_html += '</ol>';
				book_html += '</div>';
			}
			$('#book-list').html(book_html);
			
			totalData = res.pages.Cnt; //총 데이터 수
			paging(totalData, dataPerPage, pageCount, page);
			
			$("#select_page_cnt").change(function () {
			    dataPerPage = $("#select_page_cnt").val();
			    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
			    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
			    main_page_list(globalCurrentPage, dataPerPage);
			 });
		}
	});
}

function paging(totalData, dataPerPage, pageCount, currentPage) {

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  console.log("총 페이지 수 = " + totalPage);
	  
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  console.log("페이지 그룹 = " + pageGroup);

	  
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  console.log("화면에 보여질 마지막 페이지 번호 = " + last);

	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  console.log("화면에 보여질 첫번째 페이지 번호 = " + first);

	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a class='paging-_btn' href='#' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='paging_on'><a class='paging-_btn' href='#' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li><a class='paging-_btn' href='#' id='" + i + "'>" + i + "</a></li>";
	    }
	  }

	  if (last < totalPage) {
	    pageHtml += "<li><a class='paging-_btn' href='#' id='next'> 다음 </a></li>";
	  }

	  $("#pagingul").html(pageHtml);
	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	    console.log(selectedPage);
	
	    //글 목록 표시 재호출
	    main_page_list(selectedPage, dataPerPage);
	  });
	}


	
$(document).on('mouseover', '.boookcard-view-box', function(e){
    e.preventDefault();  
  $('.bookcard-view-info').css('display', 'block');
});


$(document).on('mouseout', '.boookcard-view-box', function(e){
    e.preventDefault();  
  $('.bookcard-view-info').css('display', 'none');
});

<!-- 사이드바 카테고리 리스트 & 선택  -->
$(document).ready(function(){
const categoryname=['전체보기','건강,취미 스포츠/잡지,만화','여행/요리,가정생활/예술','어린이교구,아동','초/중/고학습','日本書籍','Foreign Books/어린이 영어','외국어/한국소개도서'
	,'경제,경영,자기계발/정치,사회','과학,기술,컴퓨터','소설,시,에세이','인문,역사,문화,종교'];
	
	let _sidehtml ='';
	for (var i = 0; i < categoryname.length; i++) {
		var categorylist = categoryname[i];
		_sidehtml +=  '<div class="menu-item"><span>'+categoryname[i]+'</span></div>'
	}
	$('#main-category-list').html(_sidehtml);
	
	
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
        });
});
<!-- 전체 체크박스 스크립트 -->
function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  });
	}
	
	

</script>
</html>