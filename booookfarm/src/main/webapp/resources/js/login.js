/**
 *  로그인 페이지 스크립트
 */

let colorTemp;

/** 패스워드 입력 내용 보기 기능 */
$('#showPw').on("click", () => {
    $('#showPw').addClass('hidden');
    $('#hidePw').removeClass('hidden');
    $('input[name=password]').attr('type', 'text');
});

/** 패스워드 입력 내용 숨기기 기능 */
$('#hidePw').on("click", () => {
    $('#hidePw').addClass('hidden');
    $('#showPw').removeClass('hidden');
    $('input[name=password]').attr('type', 'password');
});

/**
 *  id, pw 입력 창 hover시 테두리 강조 기능
 *  @todo 빠르게 hover, unhover시  오류 있음 로직 수정 필요
 */
$('.login-input-box').hover( e => {
    colorTemp =  $(e.target).css('border-color');
    $(e.target).css('border-color', 'var(--blue)');
}, e=> {
    $(e.target).css('border-color', colorTemp);
});

/** id, pw 입력 창 focus 시 테두리 강조 기능 */
$('.login-form__input').on('focus', e => {
    $(e.target).parent().css('border-color', 'var(--blue)');
});

/** id, pw 입력 창 focusout 시 입력 내용 체크 기능 */
$('.login-form__input').on('focusout', e => {
    if(  $(e.target).val() == "" || $(e.target).val() == null ) { // 입력 내용이 없을 경우 테두리 강조 및 메시지 표시
        $(e.target).parent().css('border-color', 'var(--red)');
        $(e.target).parent().next('div').children('span').removeClass('hidden');
    } else { // 입력 내용 있을 경우 기본
        $(e.target).parent().css('border-color', '#bebebe');
    }
});

/** 입력시 조건에 따라 입력 내용 체크 기능 */
$('.login-form__input').on('change keydown keyup paste', e => {
    if(  $(e.target).val() == "" || $(e.target).val() == null ) { // 입력 내용이 없을 경우 테두리 강조 및 메시지 표시
        $(e.target).parent().css('border-color', 'var(--red)');
        $(e.target).parent().next('div').children('span').removeClass('hidden');
    } else { // 입력 내용이 있을 경우 기본
        $(e.target).parent().css('border-color', 'var(--blue)');
        $(e.target).parent().next('div').children('span').addClass('hidden');
    }
});