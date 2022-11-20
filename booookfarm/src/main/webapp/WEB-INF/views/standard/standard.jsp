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
<%@ include file="/WEB-INF/views/module/header.jsp" %>
		<main class="st-ma">
		<div class="main-container">
			<!-- 왼쪽 사이드 메뉴 -->
			<div class="row-4">
				<div class="sidemenu-container">
					<div class="sidemenu-title">
						 전체분류보기
				 	</div>
				 </div>
				 <div id="L-main-category-list" class="sidemenu-item-container">
					 	<!-- 왼쪽 사이드 카테고리 메뉴 -->
				 </div>
		</div>
			<div class="row-8">
			 <div class="book-list-container"></div>
			 <div class="select-basket">
			 </div>
				<div class="chkbox-container">
					<div class="chbox-container-layout">
				 		<input class="book-chkbox" id="chkbox-input" type="checkbox" onclick="selectAll(this);">
				   		 <label for="chkbox-input">전체</label>
				<div>
            		<select class="select-list-box" title="목록 보기 유형 선택" id="select_page_count">
                		<option value="5">5개씩 보기</option>
                		<option value="10">10개씩 보기</option>
                		<option value="15">15개씩 보기</option>
                		<option value="100">100개씩 보기</option>
            		</select>
            	</div>
            		<select class="select-list-box"  title="목록 보기 유형 선택" id="select_page_sort">
                		<option value="sortData">최신 등록순</option>
                		<option value="sortAccuracy">정확도 높은순</option>
                		<option value="sortLprice">낮은 가격순</option>
                		<option value="sortHprice">높은 가격순</option>
            		</select>
            		</div>
				 </div>
					 <div class="main-book-list" id="book-list">
					<!-- DB에서 불러온 데이터 나열 -->
					</div>
					<ul class="pagination">
						<li id="p_btn" class="page-item">
							<button id="p_page" class="page-link">
								<img src="${path}/resources/img/icon/prev_arrow.png">
							</button>
						</li>
						<li id="page_list" class="paging_on">
						</li>
						<li id="n_btn" class="page-item">
							<button id="n_page" class="page-link" >
								<img src="${path}/resources/img/icon/next_arrow.png">
							</button>
						</li>
					</ul>
			</div>
		</div>
		</main>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>
<div id="teet" >
<!-- 	<div  class="trigger-body">
		<div class="trigger-message">
			로그인 후 이용해주세요.
		</div>
	</div> -->
</div>
</body>
<script type="text/javascript">
$(function(){
	//DOM(Document Object Model)을 불러온후 실행 
	main_page_list(1);

	// left 사이드바 배열에 담기 const[재선언, 변수 재할당] 불가 
	const categoryname=['전체보기','건강,취미 스포츠/잡지,만화','여행/요리,가정생활/예술','어린이교구,아동','초/중/고학습','日本書籍','Foreign Books/어린이 영어','외국어/한국소개도서'
	,'경제,경영,자기계발/정치,사회','과학,기술,컴퓨터','소설,시,에세이','인문,역사,문화,종교'];
	
	// 사이드바 전역 변수 let[초기화 후 재사용] 가능
	let _sidehtml ='';
	
	//반복문 사이드바[배열의 크기]
	for (var i = 0; i < categoryname.length; i++) {
		_sidehtml +=  '<div class="menu-item" id='+[i]+'><span>'+categoryname[i]+'</span></div>'
	}
	//HTML 단 id="L-main-category-list" 위치에 반복한 _sidehtml .html 실행
	$('#L-main-category-list').html(_sidehtml);
	
	// left 사이드바 class 위치 저장 
	const menuWrap = document.querySelector('.sidemenu-item-container');
        
		// select 함수 실행 (카테고리 영역의 div의 element, 클릭 한 타겟)
		function select(divEl,target){
			/*console.log("divEl[menuWrap]의 자식 div의 배열로 나열" + Array.from(divEl.children));*/
			
			//divEl=[menuWrap의 자식 div 배열로 나열]
            Array.from(divEl.children).forEach(
				//배열을 돌면서 selected 클래스가 있으면 remove 실행하여 제거
                v => v.classList.remove('selected')
            )
			// 클릭[target]의 클래스에 selected 클래스 추가 
            if(target) target.classList.add('selected');
        }
		// 저장한 위치에 [클릭] 이벤트 발생 
       	 menuWrap.addEventListener('click', e => {
			  // e.target -> selected에 저장
          	  const selected = e.target;
			    //select 함수 실행 (class 위치, 타겟 위치)
            	select(menuWrap, selected);
			    
				/* console.log("menuWrap 값(위치)" + menuWrap );
				console.log("selected 값(위치)" + selected ); 
				console.log("카테고리 실행");*/
				
				main_page_list(1);
      	  });
	});


// 할인이 적용된 가격에 (,)와 원 단위에 맞춰 소수점을 계산
// 원 단위=*10 , 십 단위 =*100 백 단위=*1000
 function AmountCommas(price){
	 	modify_price = Math.floor(price/10) * 10; 
	 	return modify_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}
 function AmountDiscount(price){
	 	modify_price = Math.floor(price/100) * 10; 
	 	return modify_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
}

// 전역 변수=[초기화 후 재사용]
let main_page = 1;		// 첫 번째 페이징 리스트를 보여주기 위한 변수 할당
let category_id = 0;	// 

let sort_data = '';     //

let m_price = 0;		//
let result_price = 0;	//


let loginchk = "로그인 후 이용해주세요.";
let fixed = "고정";
// 메인 페이지 리스트를 불러오는 함수 
function main_page_list(page) {

	main_page = page;
	
	/* 재사용 가능한 전역변수[현재 페이지 번호 / 한 페이지에 보여질 데이터 수/ 페이지 sort /
					검색 내용 / 검색 필터[타입] 리스트 / 카테고리 선택 ]*/
	let _url = "./list?page=" + page + "&page_count=" + $('#select_page_count').val() + "&page_sort=" + $('#select_page_sort').val() +
					"&search_data=" + $('#input_search_data').val()+ "&search_sort=" + $('#select_search_sort').val()+ "&category_select=" +$(".menu-item.selected>span").text();
	$.ajax({
		url: _url,
		type: "GET",
		dataType: "json",
		success: function(res) {
			let book_html = '';
			let _page = '';
			for (var i=0 ; i < res.datas.length ; i++) {
				result_price = res.datas[i].bookPrice - (res.datas[i].bookPrice * (res.datas[i].bookDiscount*0.01));
				
				book_html += '<div class="bookcard-container">';
				book_html += '<ol>';
				book_html += '<li class="bookcard-flex">';
				book_html += '<div>';
				book_html += '<input name="select_book" class="bookcard-chkbox-card" id="chkbox-input" type="checkbox" value="'+res.datas[i].bookCode+'">';
				book_html += '<label class="bookcard-chkbox-input" for="chkbox-input">';
				book_html += '<span>상품선택</span>';
				book_html += '</label>';
				book_html += '</div>';
				book_html += '<div>';
				book_html += '</div>';
				book_html += '<div onclick=location.href="detail?bookcode='+res.datas[i].bookCode+'"><div>';
				book_html += '<a>';
				book_html += '<span>';
				book_html += '<img class="bookcard-img" src="${path}/resources/img/card-img.png">';
				book_html += '</span>';
				book_html += '</a>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '<div class="card-info-box">';
				book_html += '<div class="book-view">';
				book_html += '<a href=# onclick=location.href="detail?bookcode='+res.datas[i].bookCode+'">';
				book_html += '<span >'+res.datas[i].bookTitle+'</span>';
				book_html += '</a>';
				//조회수 기능 시작 안함 -> DB 추가 or 다른 기능 생각 중
				book_html += '<span class="book-view-cnt">조회수 :'+0+'</span>';
				book_html += '</div>';
				book_html += '<div class="book-info-author">';
				book_html += '<span>';
				book_html += '<a>저자 '+res.datas[i].bookAuthor+'&nbsp;|&nbsp;출판사 '+res.datas[i].publisher+'&nbsp;|&nbsp; 등록일(test) '+res.datas[i].createDate+'</a>';
				book_html += '</span>';
				book_html += '</div>';
				book_html += '<div class="card-info-price">';
				book_html += '<div class="card-price">정가: '+AmountCommas(res.datas[i].bookPrice)+'원</div>';
				book_html += '<div class="card-sale-price">';
				book_html += ''+AmountCommas(res.datas[i].bookPrice - (res.datas[i].bookPrice * (res.datas[i].bookDiscount*0.01))) +'원';
				book_html += '</div>';
				
				// DB 테이블 정상가격은 컬럼 존재, 할인이 계산된 판매가격 컬럼이 존재하지 않아 구분이 불가능
				// 추후 DB BOOK 테이블에 할인이 계산된 판매가격 컬럼 추가하는 방법이 최선으로 보임
				if (res.datas[i].bookPrice > result_price) {
					console.log("정상가격 할인o ");
					book_html += '<div class="down-sale">'+res.datas[i].bookDiscount+'%';
					book_html += '<div class="down-arrow">➔</div>';	
				}else if(res.datas[i].bookPrice < result_price){
					console.log("판매가격 할인x");
					book_html += '<div class="up-sale">정상가격 보다 판매가격이 더 높습니다.';
					book_html += '<div class="up-arrow">➔</div>';
				}
				book_html += '</div>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '<div class="book-basket-buy">';
				book_html += '<div class="book-buy-layout top">';
				book_html += '<c:if test="${not empty sessionScope.loginData}">'
				book_html += '<button onclick="toast(loginchk)" id="buy_active" class="book-buy-btn" type="button"><span>바로구매</span></button>';
				book_html += '</c:if>'
				book_html += '<c:if test="${empty sessionScope.loginData}">'
				book_html += '<button onclick="toast(loginchk)" id="buy_active" class="book-buy-btn" type="button"><span>바로구매</span></button>';
				book_html += '</c:if>'
				book_html += '</div>';
				book_html += '<div class="book-basket-layout bottom">';
				book_html += '<div class="book__info"><input id="bCode" type="hidden" value="'+res.datas[i].bookCode+'"></div>';
				book_html += '<c:if test="${not empty sessionScope.loginData}">'
				book_html += '<button onclick="add_basket('+res.datas[i].bookCode+');"class="book-basket-btn" type="button"><span>장바구니</span></button>';
				book_html += '</c:if>'
				book_html += '<c:if test="${empty sessionScope.loginData}">'
				book_html += '<button onclick="toast(loginchk)"class="book-basket-btn" type="button"><span>장바구니</span></button>';
				book_html += '</c:if>'
				book_html += '</div>';
				book_html += '</div>';
				book_html += '</div>';
				book_html += '</li>';
				book_html += '</ol>';
				book_html += '</div>';
			}
			$('#book-list').html(book_html);
			
			for (var i=0 ; i < res.pager.pagelist.length; i++) {
				let add_class = '';
					if (res.pager.c_page == res.pager.pagelist[i]) {
						add_class = 'selected_on';
					}
					_page += '<button class="page-link '+ add_class +'" onclick="main_page_list('+ res.pager.pagelist[i] +');">'+ res.pager.pagelist[i] +'</button>';
					
			}	
			$('#p_page').attr('onclick', 'main_page_list('+ res.pager.p_page +');');
			if (res.pager.c_page == 1) {
				$('#p_page').prop('disabled', true);
				$('#p_btn').addClass('disabled');
				$('#p_btn').addClass('disnone');
			} else {
				$('#p_page').prop('disabled', false);
				$('#p_btn').removeClass('disabled');
				$('#p_btn').removeClass('disnone');
			}
			$('#n_page').attr('onclick', 'main_page_list('+ res.pager.n_page +');');

			if (res.pager.is_npage == false) {
				$('#n_page').prop('disabled', true);
				$('#n_btn').addClass('disabled');
				$('#n_btn').addClass('disnone');
			}else{
				$('#n_page').prop('disabled', false);
				$('#n_btn').removeClass('disabled');
				$('#n_btn').removeClass('disnone');
			}
			$('#page_list').html(_page);
			
		},

	})
}
// 시작페이지

/* let m_page = 1;
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
		    
		    if(res.pages.Cnt < 5  ){
		    	dataPerPage = res.pages.Cnt;
		    }
		    
		    console.log(dataPerPage);
			
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
				book_html += '<div onclick=location.href="detail?bookcode='+res.datas[i].bookCode+'">';
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
     		console.log("//총 데이터 수 = " + totalData);
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

*/
// 페이지 정렬 기능 --> 보여질 게시글 수 변경시 기능
$('#select_page_count').on('change', function() {
	main_page_list(1);
});

//페이지 정렬 기능 --> 상황에 따라 기능
$('#select_page_sort').on('change', function() {
	sort_data = $('#select_sort_data').val();
		main_page_list(main_page);
});

$('#search_btn').on('click', function(){
	console.log('검색 실행');	
	main_page_list(1);
});

$('#input_search_data').on('keydown', function(e) {
	if(e.keyCode == 13){
		e.preventDefault();
		main_page_list(1);
	}
});
function add_basket(code) {
	let bookCode  = [];
	$('input[name=select_book]:checked').each(function(){
		bookCode.push($(this).val());
	});
	
	
	$.ajax({
		url : "./basket-main-info",
		type : "POST",
		data: {
			bookCode :bookCode
			},
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success: function(data){
			if(data.code == 'success'){
				alert("장바구니에 추가되었습니다.");
			}/* else if(data.code == 'fail'){
				alert("이미 담겨진 상품입니다.");
			} */
		}
	});
}

function fillWidth(elem, timer, limit) {
	if (!timer) { timer = 3000; }	
	if (!limit) { limit = 100; }
	var width = 1;
	var id = setInterval(frame, timer / 100);
		function frame() {
		if (width >= limit) {
			clearInterval(id);
		} else {
		}
	}
};

function toast(msg, timer) {
	if (!timer) { timer = 3000; }
	var $elem = $("<div class='toastWrap'><span class='toast'>" + msg + "<b></b></span></div>");
	$("#teet").append($elem); //top = prepend, bottom = append
	$elem.slideToggle(100, function() {
		$('.timerWrap', this).first().outerWidth($elem.find('.toast').first().outerWidth() - 10);
		if (!isNaN(timer)) {
			fillWidth($elem.find('.timer').first()[0], timer);
			setTimeout(function() {
				$elem.fadeOut(function() {
					$(this).remove();
				});
			}, timer);			
		}
	});
}


function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  });
	}


</script>
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "0c188261-acbc-4429-ad63-d6ea32ca05c0", //please fill with your plugin key
  });
</script>
</html>