/**
 *  로그인 페이지 스크립트
 */

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
 */
$('.login-input-box').hover( e => {
    $(e.target).addClass('bd-color--blue');
    $(window).scroll( () => {
        $(e.target).removeClass('bd-color--blue');
    });
}, e=> {
    $(e.target).removeClass('bd-color--blue');
});

/** id, pw 입력 창 focus 시 테두리 강조 기능 */
$('.login-form__input').on('focus', e => {
    $(e.target).parent().addClass('bd-color--blue');
});

/** id, pw 입력 창 focusout 시 입력 내용 체크 기능 */
$('.login-form__input').on('focusout', e => {
    $(e.target).parent().removeClass('bd-color--blue');
    if(  $(e.target).val() == "" || $(e.target).val() == null ) { // 입력 내용이 없을 경우 테두리 강조 및 메시지 표시
        $(e.target).parent().addClass('bd-color--red');
        $(e.target).parent().next('div').children('span').removeClass('hidden');
    } else {
        $(e.target).parent().removeClass('bd-color--red');
        $(e.target).parent().next('div').children('span').addClass('hidden');
    }
});

/** 입력시 조건에 따라 입력 내용 체크 기능 */
$('.login-form__input').on('change keydown keyup paste', e => {
    if(  $(e.target).val() == "" || $(e.target).val() == null ) { // 입력 내용이 없을 경우 테두리 강조 및 메시지 표시
        $(e.target).parent().removeClass('bd-color--blue');
        $(e.target).parent().addClass('bd-color--red');
        $(e.target).parent().next('div').children('span').removeClass('hidden');
    } else {
        $(e.target).parent().removeClass('bd-color--red');
        $(e.target).parent().addClass('bd-color--blue');
        $(e.target).parent().next('div').children('span').addClass('hidden');
    }
});