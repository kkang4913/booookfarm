/**
 *  회원가입 페이지 스크립트
 *  @todo 핸드폰 중복 체크, alert->modal
 */
let certificationNumber = "";
let cNumTimer = null;
let cNumTimerIsRun = false;
let chkTimeOver = false;
let isId = false;
let isCNum = false;
let isUseInfoTerms = false;
let isOfferInfoTerms = false;
let isServiceTerms = false;

/** 패스워드 입력 내용 보기 기능 */
$('#showPw').on("click", () => {
    $('#showPw').addClass('hidden');
    $('#hidePw').removeClass('hidden');
    $('input[name=pw]').attr('type', 'text');
});

/** 패스워드 입력 내용 숨기기 기능 */
$('#hidePw').on("click", () => {
    $('#hidePw').addClass('hidden');
    $('#showPw').removeClass('hidden');
    $('input[name=pw]').attr('type', 'password');
});

/** 패스워드 확인 입력 내용 보기 기능 */
$('#showChkPw').on("click", () => {
    $('#showChkPw').addClass('hidden');
    $('#hideChkPw').removeClass('hidden');
    $('input[name=chkPw]').attr('type', 'text');
});

/** 패스워드 확인 입력 내용 숨기기 기능 */
$('#hideChkPw').on("click", () => {
    $('#hideChkPw').addClass('hidden');
    $('#showChkPw').removeClass('hidden');
    $('input[name=chkPw]').attr('type', 'password');
});

/** 약관 모달 보기 기능 */
$('#showUseInfoTerms').on('click', e => {
    $('#useInfoTerms').removeClass('hidden');
    $('body').css('overflow', 'hidden');
});

$('#showOfferInfoTerms').on('click', e => {
    $('#offerInfoTerms').removeClass('hidden');
    $('body').css('overflow', 'hidden');
});

$('#showServiceTerms').on('click', e => {
    $('#serviceTerms').removeClass('hidden');
    $('body').css('overflow', 'hidden');
});

/** 약관 모달 끄기 기능 */
$('.hide-modal').on('click', e => {
    $(e.target).closest($('.modal')).addClass('hidden');
    $('body').css('overflow', 'auto');
});

/**
 *  입력 창 hover 기능
 *  @todo 빠르게 hover, unhover시  오류 있음 로직 수정 필요
 */
// $('.join-form__input').hover( e => {
//     joinColorTemp =  $(e.target).css('border-color');
//     $(e.target).css('border-color', 'var(--blue)');
// }, e=> {
//     $(e.target).css('border-color', joinColorTemp);
// });

/** 입력 창 focus 시 테두리 강조 기능 */
$('.join-form__input>input').on('focus', e => {
    $(e.target).parent().css('border-color', 'var(--blue)');
});

/** 입력 창 focusout 시 조건에 따라 입력 내용 체크 기능 */
$('.join-form__input>input').on('focusout', e => {
    if($(e.target).attr('name') == 'name') {
        chkName($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'id') {
        chkId($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'pw') {
        chkPw($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'chkPw') {
        chkChkPw($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'phone') {
        chkPhone($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'email') {
        chkEmail($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'detailAddress') {
        chkDetailAddress($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'refundAccount') {
        chkRefundAccount($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'chkPhone') {
        chkChkPhone($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'postalCode') {
        chkPostalCode($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'address') {
        chkAddress($(e.target), e.type);
    }
});

/** 입력 창 입력시 조건에 따라 입력 내용 체크 기능 */
$('.join-form__input>input').on('change keydown keyup paste', e => {
    if($(e.target).attr('name') == 'name') {
        chkName($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'id') {
        chkId($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'pw') {
        chkPw($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'chkPw') {
        chkChkPw($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'phone') {
        chkPhone($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'email') {
        chkEmail($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'detailAddress') {
        chkDetailAddress($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'refundAccount') {
        chkRefundAccount($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'chkPhone') {
        chkChkPhone($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'postalCode') {
        chkPostalCode($(e.target), e.type);
    }
    if($(e.target).attr('name') == 'address') {
        chkAddress($(e.target), e.type);
    }
});

/**
 * 이름 입력 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkName(element, type) {
    let name = element.val();
    if(name == '' || name == null) {    // 입력 내용 유무 체크
        showErrMsg(element, '.null-err');
        return;
    } else {
        hideErrMsg(element, '.null-err', type);
    }

    if(name.length > 33) {      // 입력 내용 길이 체크
        showErrMsg(element, '.len-err');
    } else {
        hideErrMsg(element, '.len-err', type);
    }
};


/**
 *  아이디 입력 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkId(element, type) {
    let id = element.val();
    const reg = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi;    // 특수문자 체크용 변수
    const hangeulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;     // 한글 체크용 변수
    let idFlag = false;     //

    if(hangeulcheck.test(id)) {
        idFlag = true;
    } else if(id.search(/\s/) != -1) {
        idFlag = true;
    } else if(id.search(reg)>0) {
        idFlag = true;
    } else {
        idFlag = false;
    }

    if(id == '' || name == null) {    // 입력 내용 유무 체크
        showErrMsg(element, '.null-err');
        return;
    } else {
        hideErrMsg(element, '.null-err', type);
    }

    if(id.length <5 || id.length > 15 || idFlag) {      // 입력 내용 길이 및 한글&특수문자 체크
        showErrMsg(element, '.len-err');
    } else {
        hideErrMsg(element, '.len-err', type);
    }
}

/**
 *  패스워드 입력 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkPw(element, type) {
    let pw = element.val();
    const num = pw.search(/[0-9]/g);
    const eng = pw.search(/[a-z]/ig);
    const spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let pwFlag = false;

    if(num < 0 || eng < 0 || spe <0) {
        pwFlag = true;
    }

    if(pw.length <8 || pw.length > 15 || pwFlag) {      // 입력 내용 길이 체크
        showErrMsg(element, '.len-err');
    } else {
        hideErrMsg(element, '.len-err', type);
    }
}

/**
 *  패스워드 확인 입력 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkChkPw(element, type) {
    let pwChk = element.val();
    let pw = $('.join-form__input>input[name=pw]').val();
    if(pw !== pwChk) {  // 패스워드와 일치 여부 체크
        showErrMsg(element, '.not-match-err');
    } else {
        hideErrMsg(element, '.not-match-err', type);
    }

}

/**
 *  핸드폰 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkPhone(element, type) {
    let phone = element.val();

    if(phone == '' || phone == null) {      // 입력 내용 유무 체크
        showErrMsg(element, '.null-err');
    } else {
        hideErrMsg(element, '.null-err', type);
    }
}

/**
 *  인증번호 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkChkPhone(element, type) {
    let chkPhone = element.val();

    if(chkPhone == '' || chkPhone == null) {
        showErrMsg(element, '');
    } else {
        hideErrMsg(element, '', type);
    }
}

/**
 *  이메일 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkEmail(element, type) {
    let email = element.val();
    let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');

    if(email == '' || email == null) {      // 입력 내용 유무 체크
        showErrMsg(element, '.null-err');
        return;
    } else {
        hideErrMsg(element, '.null-err', type);
    }

    if(!(regex.test(email))) {
        showErrMsg(element, '.not-match-err');
    } else {
        hideErrMsg(element, '.not-match-err', type);
    }
}

/**
 *  우편번호 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkPostalCode(element, type) {
    let postalCode = element.val();

    if(postalCode == '' || postalCode == null) {
        showErrMsg(element, '');
    } else {
        hideErrMsg(element, '', type);
    }
}

/**
 *  기본주소 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkAddress(element, type) {
    let address = element.val();

    if(address == '' || address == null) {
        showErrMsg(element, '');
    } else {
        hideErrMsg(element, '', type);
    }
}

/**
 *  상세 주소 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkDetailAddress(element, type) {
    let detailAddress = element.val();

    if(detailAddress == '' || detailAddress == null) {      // 입력 내용 유무 체크
        showErrMsg(element, '.null-err');
    } else {
        hideErrMsg(element, '.null-err', type);
    }
}

/**
 *  환불 계좌 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkRefundAccount(element, type) {
    let refundAccount = element.val();

    if(refundAccount == '' || refundAccount == null) {      // 입력 내용 유무 체크
        showErrMsg(element, '.null-err');
    } else {
        hideErrMsg(element, '.null-err', type);
    }
}

/**
 * 오류 메시지 표시해주는 함수
 * @param element input element
 * @param className 표시할 오류 class명
 */
function showErrMsg(element, className) {
    element.parent().css('border-color', 'var(--red)');
    if(!(className == '' || className == null)) {
        element.closest($('.join-form-line')).next('div').removeClass('hidden');
        element.closest($('.join-form-line')).next('div').find(className).removeClass('hidden');
    }
};

/**
 * 오류 메시지 숨겨주는 함수
 * @param element input element
 * @param className 숨길 오류 class명
 */
function hideErrMsg(element, className, type) {
    if(type == 'focusout') {
        element.parent().css('border-color', '#bebebe');
    } else {
        element.parent().css('border-color', 'var(--blue)');
    }
    if(!(className == '' || className == null)) {
        element.closest($('.join-form-line')).next('div').addClass('hidden');
        element.closest($('.join-form-line')).next('div').find(className).addClass('hidden');
    }
};

/**
 *  아이디 중복 체크 함수
 *  @todo 사용가능한 ID일 경우 사용 여부 묻는 기능 추가
 */
function idDupChk() {
    if(isId) {
        alert('사용 가능한 아이디입니다.');
        return ;
    }

    const id = $('.join-form__input>input[name=id]').val();
    const sendId = { 'id' : id };

    $.ajax({
        type: "post",
        url: "idDupChk",
        traditional: true,
        contentType: "application/json",
        data: JSON.stringify(sendId),
        dataType: "json",
        success: (res) => {
            console.log(res.dupChk);
            if(res.dupChk) {
                alert('중복입니다.')
            } else {
                $('.join-form__input>input[name=id]').prop('readonly', true);
                isId = true;
            }
        }
    });
}

/**
 *  인증번호 SMS 발송 요청 함수
 *  @todo alert -> modal 변경
 */
function sendSMS() {
    if(isCNum) {
        alert('인증이 완료되었습니다.');
        return ;
    }

    const pNum = $('.join-form__input>input[name=phone]').val();
    const sendPhone = { 'pNum' : pNum };

    $.ajax({
        type: "post",
        url: "phoneChk",
        traditional: true,
        contentType: "application/json",
        data: JSON.stringify(sendPhone),
        dataType: "json",
        success: (res) => {
            $('.join-form__input>input[name=phone]').prop('readonly', true);
            certificationNumber = res.cNum;
            let display = $('#cNumTimer');
            let leftSec = 300;

            if(cNumTimerIsRun){
                clearInterval(cNumTimer);
                display.html("");
                startTimer(leftSec, display);
            } else {
                startTimer(leftSec, display);
            }
            console.log(certificationNumber);
        }
    });
}

/**
 *  인증번호 인증 시간 제한
 * @param count 제한시간 (초 단위)
 * @param display 타이머 표시할 element
 */
function startTimer(count, display) {
    let minutes, seconds;
    chkTimeOver = false;
    cNumTimer = setInterval( () => {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.html(minutes + ":" + seconds);

        if (--count < 0) {
            clearInterval(cNumTimer);
            display.html("00:00");
            chkTimeOver = true;
            cNumTimerIsRun = false;
        }
    }, 1000);
    cNumTimerIsRun = true;
}

/**
 *  인증번호 일치 체크 함수
 *  @todo 인증 완료/실패시 처리 내용 추가, alert -> modal 변경
 */
function chkCNum() {
    const cNum = $('.join-form__input>input[name=chkPhone]').val();

    if(chkTimeOver) {
        alert("인증 시간이 만료되었습니다. 다시 요청해주세요.");
        return ;
    }

    if(cNum == certificationNumber) {
        clearInterval(cNumTimer);
        $('.join-form__input>input[name=chkPhone]').prop('disabled', true);
        isCNum = true;
        alert("인증이 완료되었습니다.")
    } else {
        alert("인증이 실패하였습니다.")
    }
}

/**
 *  다음 우편번호 검색 API
 */
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }

            // 우편번호와 주소 정보+참고항목을 해당 필드에 넣는다.
            document.getElementById('postalCode').value = data.zonecode;
            document.getElementById("address").value = addr + extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

$('input[type=checkbox]').on('click', e => {
    const chkboxId = $(e.target).attr('id');
    let isAllChk = false;
    switch (chkboxId) {
        case "allCheck" :
            if($(e.target).is(':checked')) {
                $('input[type=checkbox]').prop('checked', true);
                isUseInfoTerms = true;
                isOfferInfoTerms = true;
                isServiceTerms = true;
            } else {
                $('input[type=checkbox]').prop('checked', false);
                isUseInfoTerms = false;
                isOfferInfoTerms = false;
                isServiceTerms = false;
            }
            break;
        case "chkUseInfoTerms" :
            isUseInfoTerms = $(e.target).is(':checked') ? true : false;
            isAllChk = isUseInfoTerms && isOfferInfoTerms && isServiceTerms;
            $('#allCheck').prop('checked', isAllChk);
            break;
        case "chkOfferInfoTerms" :
            isOfferInfoTerms = $(e.target).is(':checked') ? true : false;
            isAllChk = isUseInfoTerms && isOfferInfoTerms && isServiceTerms;
            $('#allCheck').prop('checked', isAllChk);
            break;
        case "chkServiceTerms" :
            isServiceTerms = $(e.target).is(':checked') ? true : false;
            isAllChk = isUseInfoTerms && isOfferInfoTerms && isServiceTerms;
            $('#allCheck').prop('checked', isAllChk);
            break;
    }
});

$(document).ready( () => {

});