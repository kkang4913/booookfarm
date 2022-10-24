/**
 *  회원가입 페이지 스크립트
 *  @todo 입력창 별 err메세지 출력 기능 추가
 */

/** 약관 전문 보기 기능 */
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
    if($(e.target).closest($('.join-form-line')).next('div').find('span').hasClass('null-err')) { // 필수 입력 요소 체크
        if(  $(e.target).val() == "" || $(e.target).val() == null ) { // 입력 내용이 없을 경우
            $(e.target).parent().css('border-color', 'var(--red)');
            $(e.target).closest($('.join-form-line')).next('div').removeClass('hidden');
            $(e.target).closest($('.join-form-line')).next('div').find($('.null-err')).removeClass('hidden');
        } else { // 입력 내용이 있을 경우
            $(e.target).parent().css('border-color', '#bebebe');
        }
    } else {
        $(e.target).parent().css('border-color', '#bebebe');
    }
});

/** 입력 창 입력시 조건에 따라 입력 내용 체크 기능 */
$('.join-form__input>input').on('change keydown keyup paste', e => {
    if($(e.target).closest($('.join-form-line')).next('div').find('span').hasClass('null-err')) {
        if(  $(e.target).val() == "" || $(e.target).val() == null ) {
            $(e.target).parent().css('border-color', 'var(--red)');
            $(e.target).closest($('.join-form-line')).next('div').removeClass('hidden');
            $(e.target).closest($('.join-form-line')).next('div').find($('.null-err')).removeClass('hidden');
        } else {
            $(e.target).parent().css('border-color', 'var(--blue)');
            $(e.target).closest($('.join-form-line')).next('div').addClass('hidden');
            $(e.target).closest($('.join-form-line')).next('div').find($('.null-err')).addClass('hidden');
        }
    }
});