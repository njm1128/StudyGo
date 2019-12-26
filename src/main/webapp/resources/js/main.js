function go_login_process() {
	if(!$('input[name=userId]').val()) {
		alert('아이디를 입력해주세요.');
		$('input[name=userId]').focus();
		return false;
	} else if(!$('input[name=userPw]').val()) {
		alert('비밀번호를 입력해주세요.');
		$('input[name=userPw]').focus();
		return false;
	}
	$('#frm_login').submit();
}

function go_enter_process() {
	if(window.event.keyCode == 13) {
		go_login_process();
	}
}

function go_join_process() {
	var phone_reg = /^\d{3}\d{3,4}\d{4}$/;
	var phone_match = phone_reg.exec($('input[name=userPhone]').val());
	var email_reg = new RegExp('^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$', 'i');
	var email_match = email_reg.exec($('input[name=userEmail]').val());
	
	if ($('input[name=userId]').val() == '') {
		alert('아이디를 입력해주세요.');
		$('input[name=userId]').focus();
		return;
	} else if ($('input[name=userId]').val().length < 4 || $('input[name=userId]').val().length > 12) {
		alert('아이디는 4~12자 까지 사용할 수 있습니다.');
		$('input[name=userId]').focus();
		return;
	} else if ($('#id_check').text() == '중복체크') {
		alert('아이디 중복체크를 해주세요.');
		$('input[name=userId]').focus();
		return;
	} else if ($('input[name=userPw]').val() == '') {
		alert('비밀번호를 입력해주세요.');
		$('input[name=userPw]').focus();
		return;
	} else if ($('input[name=userPw]').val().length < 6 || $('input[name=userPw]').val().length > 16) {
		alert('비밀번호는 6~16자 까지 사용할 수 있습니다.');
		$('input[name=userPw]').focus();
		return;
	} else if ($('input[name=userPw]').val() != $('input[name=userPwChk]').val()) {
		alert('비밀번호가 일치하지 않습니다.');
		$('input[name=userPwChk]').focus();
		return;
	} else if ($('input[name=userEmail]').val() == '') {
		alert('이메일을 입력해주세요.');
		$('input[name=userEmail]').focus();
		return;
	} else if (email_match == null) {
		alert('이메일이 올바르지 않습니다.');
		$('input[name=userEmail]').focus();
		return;
	} else if ($('input[name=userPhone]').val() == '') {
		alert('핸드폰 번호를 입력해주세요.');
		$('input[name=userPhone]').focus();
		return;
	} else if (phone_match == null){
		alert('핸드폰 번호가 올바르지 않습니다.');
		$('input[name=userPhone]').focus();
		return;
	}  
	$('#frm_join').submit();
}

function check_id() {
	var text = $('#id_check').text();
	if(text == '중복체크') {
		if($('input[name=userId]').val() == '') {
			alert('아이디를 입력해주세요');
			$('input[name=userId]').focus();
			return;
		} else if ($('input[name=userId]').val().length < 4 || $('input[name=userId]').val().length > 12) {
			alert('아이디는 4~12자 까지 사용할 수 있습니다.');
			$('input[name=userId]').focus();
			return;
		}
		$.ajax({
			type: 'post',
			url: 'ajaxIdCheck.do',
			dataType: 'json',
			data: {'userId': $('input[name=userId]').val()},
			success: function(data) {
				if(data.result == true) {
					alert('사용 가능한 아이디입니다.');
					$('input[name=userId]').prop('readonly', true);
					$('input[name=userId]').css('background', '#f5f4f4');
					$('#id_check').text('변 경');
				} else {
					alert('이미 존재하는 아이디입니다.');
					return;
				}
			},
			error: function() {
				console.log('error');
			}
		});
	} else {
		$('input[name=userId]').prop('readonly', false);
		$('input[name=userId]').focus();
		$('input[name=userId]').css('background', '#fff');
		$('#id_check').text('중복체크');
	}
}

function go_qna_process() {
	if($('input[name=qnaTitle]').val() == '') {
		alert('문의 제목을 입력해주세요.');
		$('input[name=qnaTitle]').focus();
		return false;
	} else if($('textarea[name=qnaContent]').val() == '') {
		alert('문의 내용을 입력해주세요.');
		$('textarea[name=qnaContent]').focus();
		return false;
	} else if($('input[name=phone_01]').val() == '') {
		alert('휴대폰 번호를 입력해주세요.');
		$('input[name=phone_01]').focus();
		return false;
	} else if(isNaN($('input[name=phone_01]').val()) == true) {
		alert('휴대폰 번호는 숫자만 입력할 수 있습니다.');
		$('input[name=phone_01]').focus();
		return false;
	} else if($('input[name=phone_02]').val() == '') {
		alert('휴대폰 번호를 입력해주세요.');
		$('input[name=phone_02]').focus();
		return false;
	} else if(isNaN($('input[name=phone_02]').val()) == true) {
		alert('휴대폰 번호는 숫자만 입력할 수 있습니다.');
		$('input[name=phone_02]').focus();
		return false;
	}
	var qnaPhone = $('.sel .sel_text').text() + '-' + $('input[name=phone_01]').val() + '-' + $('input[name=phone_02]').val();
	$('input[name=qnaPhone]').val(qnaPhone);
	
	$('#frm_qna').submit();
}

function changeObject(num) {
	$('.sub_content .section').hide();
	$('#section_0' + num).show();
	
	$('.object_wrap li').removeClass('active');
	$('.object_wrap li').eq(num-1).addClass('active');
	
	$.each($('.object_wrap li'), function(index, value) {
		var src = $(this).find('img').attr('src');
		$(this).find('img').attr('src', src.replace('_on', '_off'));
	});
	var src = $('.object_wrap li.active img').attr('src');
	$('.object_wrap li.active img').attr('src', src.replace('_off', '_on'));
}

function toggle_area() {
	$('.category_wrap .area_list').toggle();
}

$(document).ready(function() {
	
$(document).on("click", ".image_data", function(e) {
	e.stopImmediatePropagation();
	var view = $(this).data('view');
	location.href = $('#ctx').text() + '/pl/sights_view.do?view=' + view;
});
	
$(document).on("click", ".video_data", function(e) {
	e.stopImmediatePropagation();
	
	$.ajax({
		url: $('#ctx').text() + '/pl/modifyDataHit.do',
		type: 'post',
		dataType: 'json',
		data: {'dataNo': $(this).data('no')},
		success: function(data) {
			$(".video-popup").addClass("reveal");
			$(".video-popup .video-wrapper").remove();
			$(".video-popup").append("<div class='video-wrapper'><iframe width='560' height='315' src='https://youtube.com/embed/" + data.obj.dataVideo + "?controls=2&modestbranding=1&rel=0&showinfo=0&playsinline=1&autoplay=1' frameborder='0' allow='autoplay; encrypted-media; accelerometer' allowfullscreen></iframe></div>");
		},
		error: function() {
			console.log('error');
		}
	});
});

$(".video-popup-closer").click(function() {
	$(".video-popup .video-wrapper").remove();
	$(".video-popup").removeClass("reveal");
});

$('.form-check').on('click', function() {
	$(this).find('.form-checkbox').toggleClass('checked');
});

$('.write_form .sel').on('click', function() {
	$(this).find('ul').toggle();
});

$('.write_form .sel > ul > li').on('click', function() {
	var text = $(this).text();
	setTimeout(function() {
		$('.write_form .sel .sel_phone').hide();
	}, 100);
	$(this).parents('.sel').find('.sel_text').text(text);
});

$('input[name=uploadFile]').on('change', function(){ 
	if(window.FileReader){ // modern browser
		var filename = $(this)[0].files[0].name;
	} else { // old IE
		var filename = $(this).val().split('/').pop().split('\\').pop(); 
	}
	$('#attachFile').val(filename); 
});

$('.btn_search').on('click', function() {
	var keyword_obj = $(this).parents('.search_area').find('input[name=keyword]');
	search_keyword(keyword_obj);
});

$(".search_area input[name=keyword]").keydown(function(e) {
    if (e.keyCode == 13){
    	var keyword_obj = $(this);
    	search_keyword(keyword_obj);
    }    
});

function search_keyword(keyword_obj) {
	if(keyword_obj.val() == '') {
		alert('검색할 내용을 입력해주세요.');
		keyword_obj.focus();
		return false;
	}
	location.href = $('#ctx').text() + '/search.do?keyword=' + encodeURI(keyword_obj.val());
}

$('.popup_bg').on('click', function() {
	$(this).hide();
	$('.popup_wrap').hide();
});

	
});