<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<div class="sub_content faq_wrap admin_wrap pb-4">
		<h2 class="sub_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_admin.png" /></h2>
		
		<%@ include file="/WEB-INF/tiles/components/admin_top_menu.jsp" %>
		
		<div class="content_wrap">
			<div class="faq_list faq_write">
				<form action="${pageContext.request.contextPath }/admin/faq_write_process.do" method="post" id="frm_faq_write">
					<ul>
							<li class="on">
								<div class="div_question">
									<span>Q</span>
									<strong><input type="text" name="faqQuestion" class="inp_question" placeholder="질문을 입력해주세요." /></strong>
								</div>
								<div class="div_answer d-block">
									<textarea name="faqAnswer" class="inp_answer" ></textarea>
								</div>
							</li>
					</ul>
				</form>
			</div>
			
			<div class="button_box">
				<button type="button" class="btn btn-medium" onclick="faq_write_process()">등록하기</button>
			</div>
			
			<div class="faq_list">
				<c:choose>
				<c:when test="${empty faqList}">
					<div class="empty_wrap">등록된 질문이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<form method="post" id="frm_faq">
						<input type="hidden" name="faqNo" />
						<input type="hidden" name="faqQuestion" />
						<input type="hidden" name="faqAnswer" />
						<ul class="faq_inner">
							<c:forEach var="faq" items="${faqList}">
								<li>
									<div class="faq-modify-off">
										<div class="div_question">
											<span>Q</span>
											<strong>${faq.faqQuestion }</strong>
										</div>
										<div class="div_answer">${faq.faqAnswer }</div>
									</div>
									<div class="faq-modify-on d-none">
										<div class="div_question">
											<span>Q</span>
											<strong><input type="text" class="inp_question" value="${faq.faqQuestion }" /></strong>
										</div>
										<div class="div_answer">
											<textarea class="inp_answer">${faq.faqAnswer }</textarea>	
										</div>
										<div class="button_box">
											<button type="button" class="btn btn-medium btn_modify_submit" data-no="${faq.faqNo }">수정하기</button>
										</div>
									</div>
									<div class="div_button">
										<a href="#" class="btn_modify">수정</a>
										<a href="#" data-no="${faq.faqNo }" class="btn_remove">삭제</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</form>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script>	
		$(document).ready(function() {
			$('.faq_list .div_question').on('click', function(){
				if(!$(this).parents('li').find('.faq-modify-on').hasClass('d-none'))
					return;
				$(this).next().slideToggle(400).parents('li').siblings().find('.div_answer').slideUp(400);
				$(this).parents('li').siblings().removeClass('on');
				$(this).parents('li').toggleClass('on');
				$(this).parents('li').siblings().find('.faq-modify-on').addClass('d-none');
				$(this).parents('li').siblings().find('.faq-modify-off').removeClass('d-none');
			});
			$('.faq_write').off('click');
		});
		
		 function faq_write_process() {
			 if($('.faq_write').hasClass('on')) {
				 if($('.faq_write input[name=faqQuestion]').val() == '') {
					 alert('질문 제목을 입력해주세요.');
					 $('.faq_write input[name=faqQuestion]').focus();
					 return false;
				 } else if($('.faq_write textarea[name=faqAnswer]').val() == '') {
					 alert('질문 내용을 입력해주세요.');
					 $('.faq_write textarea[name=faqAnswer]').focus();
					 return false;
				 }
				 var answer = $('.faq_write textarea[name=faqAnswer]').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
				 $('.faq_write textarea[name=faqAnswer]').val(answer);

				 $('#frm_faq_write').submit();
			 } else {
				 $('.faq_write').show();
				 $('.faq_write').addClass('on');
			 }
		 }
		 
		 $('.faq_list .btn_modify').on('click', function(e) {
			 e.preventDefault();
			 var faqAnswer = $(this).parents('li').find('.faq-modify-on .inp_answer').val();
			 $(this).parents('li').find('.faq-modify-on .inp_answer').val(faqAnswer.split('<br/>').join("\r\n"));
			 $(this).parents('li').find('.faq-modify-off').addClass('d-none');
			 $(this).parents('li').find('.faq-modify-on').removeClass('d-none');
			 $(this).parents('li').find('.div_answer').show();
			 
			 $(this).parents('li').siblings().find('.faq-modify-on').addClass('d-none');
			 $(this).parents('li').siblings().find('.faq-modify-off').removeClass('d-none');
			 
			 $(this).parents('li').siblings().removeClass('on');
			 $(this).parents('li').siblings().find('.div_answer').slideUp(400);
			 $(this).parents('li').addClass('on');
		 });
		 
		 $('.faq_list .btn_modify_submit').on('click', function(e) {
			 e.preventDefault();
			 var faqNo = $(this).data('no');
			 var faqQuestion = $(this).parents('.faq-modify-on').find('.inp_question').val();
			 var faqAnswer = $(this).parents('.faq-modify-on').find('.inp_answer').val();
			 if(faqQuestion == '') {
				 alert('질문 제목을 입력해주세요.');
				 $(this).parents('.faq-modify-on').find('.inp_question').focus();
				 return false;
			 } else if(faqAnswer == '') {
				 alert('질문 내용을 입력해주세요.');
				 $(this).parents('.faq-modify-on').find('.inp_answer').focus();
				 return false;
			 }
			 faqAnswer = faqAnswer.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			 
			 if(confirm('위의 내용으로 변경하시겠습니까 ?')) {
				 $('#frm_faq').attr('action', '${pageContext.request.contextPath}/admin/faq_modify_process.do');
				 $('#frm_faq input[name=faqNo]').val(faqNo);
				 $('#frm_faq input[name=faqQuestion]').val(faqQuestion);
				 $('#frm_faq input[name=faqAnswer]').val(faqAnswer);
				 $('#frm_faq').submit();
			 }
		 });
		 
		 $('.faq_list .btn_remove').on('click', function(e) {
			 e.preventDefault();
			 var faqNo = $(this).data('no');
			 if(confirm('정말 삭제하시겠습니까 ?\n삭제된 데이터는 복구할 수 없습니다.')) {
				 $('#frm_faq').attr('action', '${pageContext.request.contextPath}/admin/faq_remove_process.do');
				 $('#frm_faq input[name=faqNo]').val(faqNo);
				 $('#frm_faq').submit();
			 }
		 });
		 
	</script>
</div>