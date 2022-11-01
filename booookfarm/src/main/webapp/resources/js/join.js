/**
 *  회원가입 페이지 스크립트
 *  @todo 입력창 별 err메세지 출력 기능 추가
 */
let certificationNumber = "";

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
    if($(e.target).attr('name') == 'chkCNum') {
        chkChkPhone($(e.target), e.type);
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
    if($(e.target).attr('name') == 'chkCNum') {
        chkChkPhone($(e.target), e.type);
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

    if(chkCNum == '' || chkCNum == null) {
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
 *  상세 주소 내용 체크 함수
 * @param element input 값
 * @param type 이벤트 종류
 */
function chkDetailAddress(element, type) {
    let refundAccount = element.val();

    if(refundAccount == '' || refundAccount == null) {      // 입력 내용 유무 체크
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
 *  인증번호 SMS 발송 요청 함수
 */
function sendSMS() {
    const pNum = $('.join-form__input>input[name=phone]').val();
    const sendData = { 'pNum' : pNum };

    $.ajax({
        type: "post",
        url: "sens",
        traditional: true,
        contentType: "application/json",
        data: JSON.stringify(sendData),
        dataType: "json",
        success: (res) => {
            certificationNumber = res.cNum;
            console.log(certificationNumber);
        }
    });
}

/**
 *  인증번호 일치 체크 함수
 *  @todo 인증 완료/실패시 처리 내용 추가
 */
function chkCNum() {
    const cNum = $('.join-form__input>input[name=chkPhone]').val();

    if(cNum == certificationNumber) {
        alert("인증이 완료되었습니다.")
    } else {
        alert("인증이 실패하였습니다.")
    }
}

$(document).ready( () => {

});