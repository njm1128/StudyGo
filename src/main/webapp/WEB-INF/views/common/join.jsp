<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="sub_content join_wrap pb-4">
		<div class="form_inner">
			<h2 class="sub_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_join.png" /></h2>
			
			<div class="form_content">
				<form method="post" id="frm_join">
					<input type="text" style="display:none" aria-hidden="true">
					<input type="password" style="display:none" aria-hidden="true">
					<div class="form-row">
						<i class="fa fa-user" aria-hidden="true"></i>
						<input autocomplete="new-password" type="text" name="userId" class="form-control" value="${res.userId }" placeholder="아이디를 입력해주세요"/>
					</div>
					<div class="form-row">
						<i class="fa fa-lock" aria-hidden="true"></i>	
						<input autocomplete="new-password" type="password" name="userPw" class="form-control" value="${res.userPw }" placeholder="비밀번호를 입력해주세요"/>
					</div>
					<div class="form-row">
						<i class="fa fa-lock" aria-hidden="true"></i>
						<input type="password" name="userPwChk" class="form-control" placeholder="비밀번호를 확인해주세요"/>
					</div>
					<div class="form-row">
						<i class="fa fa-envelope" aria-hidden="true"></i>	
						<input type="email" name="userEmail" class="form-control" value="${res.userEmail }" placeholder="이메일을 입력해주세요"/>
					</div>
					<div class="form-row">
						<i class="fa fa-phone" aria-hidden="true"></i>		
						<input type="text" name="userPhone" class="form-control" value="${res.userPhone }" placeholder="핸드폰번호를 '-'없이 입력해주세요" maxlength="11"/>
					</div>
					<div class="form-row form-inline mb-4 d-none">
						<input type="text" class="form-control" placeholder="인증번호를 입력하세요"/>
						<button type="button" class="btn btn-xs white">인증확인</button>
						<span class="form-info">인증 대기중입니다</span>
					</div>
					<div class="form-button">
						<button type="button" class="btn btn-large" onclick="go_join_process()">회원가입</button>
					</div>
					<div class="form-bottom">
						<a href="${pageContext.request.contextPath }/login.do">이미 계정이 있으신가요?</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		$('input[name=userId]').focus();
	</script>
</div>