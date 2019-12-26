<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="sub_content login_wrap pb-4">
		<div class="form_inner">
			<h2 class="sub_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_login.png" /></h2>
			
			<div class="form_content">
				<form method="post" id="frm_login">
					<input type="text" style="display:none" aria-hidden="true">
					<input type="password" style="display:none" aria-hidden="true">
					<div class="form-row">
						<i class="fa fa-user" aria-hidden="true"></i>
						<input autocomplete="new-password" type="text" name="userId" class="form-control" value="${res.userId }" placeholder="아이디를 입력해주세요" onkeyup="go_enter_process()"/>
					</div>
					<div class="form-row">
						<i class="fa fa-lock" aria-hidden="true"></i>	
						<input autocomplete="new-password" type="password" name="userPw" class="form-control" value="${res.userPw }" placeholder="비밀번호를 입력해주세요" onkeyup="go_enter_process()" />
					</div>
					<div class="form-check form-check-save">
						<span class="form-checkbox" id="chk_save_id"><i class="fa fa-check" aria-hidden="true"></i></span>
						<span class="form-checkbox-label">아이디 저장</span>
					</div>
					<div class="form-button">
						<button type="button" class="btn btn-large" onclick="go_login_process()">로그인</button>
					</div>
					<div class="form-bottom">
						<a href="javascript:show_find_popup()">아이디 / 비밀번호 찾기</a>
						<a href="${pageContext.request.contextPath }/join.do">회원이 아니신가요? 회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="find_wrap form_content popup_wrap">
		<div class="popup_top">
			<h2 class="popup_title">아이디/비밀번호 찾기</h2>
		</div>
		<div class="popup_content">
			<div class="form-check-group">
				<div class="form-check">
						<span class="form-checkbox checked" data-target="find_id"><i class="fa fa-check" aria-hidden="true"></i></span>
						<span class="form-checkbox-label">아이디 찾기</span>
				</div>
				<div class="form-check">
						<span class="form-checkbox" data-target="find_pw"><i class="fa fa-check" aria-hidden="true"></i></span>
						<span class="form-checkbox-label">비밀번호 찾기</span>
				</div>
			</div>
			
			<div class="find_content" id="find_id">
				<input type="text" style="display:none" aria-hidden="true">
				<input type="password" style="display:none" aria-hidden="true">
				<div class="form-row">
					<i class="fa fa-envelope" aria-hidden="true"></i>
					<input autocomplete="new-password" type="text" name="userEmail" class="form-control" placeholder="이메일을 입력해주세요."/>
				</div>
				<div class="form-row">
					<i class="fa fa-phone" aria-hidden="true"></i>
					<input autocomplete="new-password" type="text" name="userPhone" class="form-control" placeholder="핸드폰번호를 '-'없이 입력해주세요" maxlength="11"/>
				</div>
				<div class="text_message">회원님의 아이디는 <span class="text_id"></span>입니다.</div>
				<div class="form-button">
					<button type="button" class="btn btn-large" onclick="go_find_process('id')">아이디 찾기</button>
				</div>
			</div>
			
			<div class="find_content d-none" id="find_pw">
				<input type="text" style="display:none" aria-hidden="true">
				<input type="password" style="display:none" aria-hidden="true">
				<div class="form-row">
					<i class="fa fa-user" aria-hidden="true"></i>
					<input autocomplete="new-password" type="text" name="userId" class="form-control" value="" placeholder="아이디를 입력해주세요."/>
				</div>
				<div class="form-row">
					<i class="fa fa-envelope" aria-hidden="true"></i>
					<input autocomplete="new-password" type="text" name="userEmail" class="form-control" placeholder="이메일을 입력해주세요."/>
				</div>
				<div class="form-row">
					<i class="fa fa-phone" aria-hidden="true"></i>
					<input autocomplete="new-password" type="text" name="userPhone" class="form-control" placeholder="핸드폰번호를 '-'없이 입력해주세요" maxlength="11"/>
				</div>
				<div class="text_message">회원님의 비밀번호는 <span class="text_pw"></span>입니다.</div>
				<div class="form-button">
					<button type="button" class="btn btn-large" onclick="go_find_process('pw')">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	function show_find_popup() {
		$('.popup_bg').show();
		$('.find_wrap').show();
		$('.find_wrap input').val('');
		$('.text_message').hide();
	}
	
	function go_find_process(type) {
		var userId;
		var userEmail;
		var userPhone;
		
		if(type == 'id') {
			userEmail = $('#find_id input[name=userEmail]').val();
			userPhone = $('#find_id input[name=userPhone]').val();
			if(userEmail == '') {
				alert('이메일을 입력해주세요.');
				$('#find_id input[name=userEmail]').focus();
				return false;
			} else if(userPhone == '') {
				alert('핸드폰 번호를 입력해주세요.');
				$('#find_id input[name=userPhone]').focus();
				return false;
			}
			$.ajax({
				url: 'find_process.do',
				type: 'post',
				dataType: 'json',
				data: {'type': 'id', 'userEmail': userEmail, 'userPhone': userPhone},
				success: function(data) {
					var html = '';
					if(data.user == null) {
						html = '입력한 정보와 일치하는 데이터가 없습니다.';
					} else {
						html = '회원님의 아이디는 <span class="text_id">' + data.user.userId + '</span>입니다.';
					}
					$('#find_id .text_message').html(html);
					$('#find_id .text_message').show();
				},
				error: function() {
					console.log('error');
				}
			});
		} else if(type == 'pw') {
			userId = $('#find_pw input[name=userId]').val();
			userEmail = $('#find_pw input[name=userEmail]').val();
			userPhone = $('#find_pw input[name=userPhone]').val();
			if(userId == '') {
				alert('아이디를 입력해주세요.');
				$('#find_pw input[name=userId]').focus();
				return false;
			} else if(userEmail == '') {
				alert('이메일을 입력해주세요.');
				$('#find_pw input[name=userEmail]').focus();
				return false;
			} else if(userPhone == '') {
				alert('핸드폰 번호를 입력해주세요.');
				$('#find_pw input[name=userPhone]').focus();
				return false;
			}
			$.ajax({
				url: 'find_process.do',
				type: 'post',
				dataType: 'json',
				data: {'type': 'pw', 'userId': userId, 'userEmail': userEmail, 'userPhone': userPhone},
				success: function(data) {
					var html = '';
					if(data.user == null) {
						html = '입력한 정보와 일치하는 데이터가 없습니다.';
					} else {
						html = '회원님의 비밀번호는 <span class="text_pw">' + data.user.userPw + '</span>입니다.';
					}
					$('#find_pw .text_message').html(html);
					$('#find_pw .text_message').show();
				},
				error: function() {
					console.log('error');
				}
			});
		}
	}
	$(document).ready(function(){
			$('input[name=userId]').focus();
			
			if('${res.userId}') {
			  $('input[name=userId]').val('${res.userId}');
		  }	else {
		    var userInputId = getCookie("userInputId"); //저장된 쿠기값 가져오기
		    $("input[name=userId]").val(userInputId); 
		  }
	    if($("input[name=userId]").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                               // 아이디 저장하기 체크되어있을 시,
	        $("#chk_save_id").addClass("checked"); // ID 저장하기를 체크 상태로 두기.
	    }
	    $(".form-check-save").on('click', function(){ // 체크박스에 변화가 발생시
	        if($("#chk_save_id").hasClass("checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name=userId]").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 쿠키 저장.
	    $("input[name=userId]").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#chk_save_id").hasClass("checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name=userId]").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
	    $('.find_wrap .form-check').on('click', function() {
	    	var target = $(this).find('.form-checkbox').data('target');
	    	$('.find_content').addClass('d-none');
	    	$('#' + target).removeClass('d-none');
	    	$('.find_wrap .form-check .form-checkbox').removeClass('checked');
	    	$(this).find('.form-checkbox').addClass('checked');
	    });
	    
	});
	</script>
</div>