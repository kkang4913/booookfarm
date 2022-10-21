let colorTemp;

$('#showPw').on("click", () => {
    $('#showPw').addClass('hidden');
    $('#hidePw').removeClass('hidden');
    $('input[name=password]').attr('type', 'text');
});

$('#hidePw').on("click", () => {
    $('#hidePw').addClass('hidden');
    $('#showPw').removeClass('hidden');
    $('input[name=password]').attr('type', 'password');
});

$('.login-input-box').hover( e => {
    colorTemp =  $(e.target).css('border-color');
    $(e.target).css('border-color', 'var(--blue)');
}, e=> {
    $(e.target).css('border-color', colorTemp);
});

$('.login-form__input').on('focus', e => {
    $(e.target).parent().css('border-color', 'var(--blue)');
});

$('.login-form__input').on('focusout', e => {
    if(  $(e.target).val() == "" || $(e.target).val() == null ) {
        $(e.target).parent().css('border-color', 'red');
        $(e.target).parent().next('div').children('span').removeClass('hidden');
    } else {
        $(e.target).parent().css('border-color', '#bebebe');
    }
});

$('.login-form__input').on('change keydown keyup paste', e => {
    if(  $(e.target).val() == "" || $(e.target).val() == null ) {
        $(e.target).parent().css('border-color', 'red');
        $(e.target).parent().next('div').children('span').removeClass('hidden');
    } else {
        $(e.target).parent().css('border-color', 'var(--blue)');
        $(e.target).parent().next('div').children('span').addClass('hidden');
    }
});