<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	<div class="sub_content faq_wrap admin_wrap pb-4">
		<h2 class="sub_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_admin.png" /></h2>
		
		<%@ include file="/WEB-INF/tiles/components/admin_top_menu.jsp" %>
		
		<div class="content_wrap">
			<div class="faq_list">
				<c:choose>
				<c:when test="${empty qnaList}">
					<div class="empty_wrap">등록된 문의가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<form method="post" id="frm_qna">
						<input type="hidden" name="qnaNo" />
						<input type="hidden" name="qnaEmail" />
						<input type="hidden" name="qnaAnswer" />
						<ul class="faq_inner">
							<c:forEach var="qna" items="${qnaList}">
								<fmt:formatDate value="${qna.reg_date}" var="reg_date" pattern="yyyy-MM-dd HH시 mm분"/>
								<fmt:parseDate value="${qna.answer_date}" var="answer_date" pattern="yyyy-mm-dd HH:mm:ss.0"/>
								<fmt:formatDate value="${answer_date}" var="answer_date" pattern="yyyy-MM-dd HH시 mm분"/>
								<li class="qna_info">
									<div class="div_question">
										<span>Q</span>
										<strong>${qna.qnaTitle }</strong>
										<b class="answer_yn">
											<c:if test="${empty qna.qnaAnswer }">답변없음</c:if>
											<c:if test="${not empty qna.qnaAnswer }">답변완료</c:if>
										</b>
									</div>
									<div class="div_answer">
										<ul class="user_info">
											<li>아이디 : ${qna.userId }</li>
											<li>문의일 : ${reg_date }</li>
											<c:if test="${not empty qna.qnaAnswer }"><li>답변일 : ${answer_date}</li></c:if>
											<li>첨부파일 : 
												<c:choose>
												<c:when test="${empty qna.qnaFile }">없음</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/download.do?path=upload&file=${qna.qnaFile}" class="attach_file">확인</a>
												</c:otherwise>
												</c:choose>
											</li>
										</ul>
										<div class="answer_content">문의내용<span>${qna.qnaContent }</span></div>
										
										<c:choose>
										<c:when test="${empty qna.qnaAnswer }">
											<div class="admin_answer">
												<span>문의답변</span>
												<textarea class="inp_answer"></textarea>
											</div>
											
											<div class="button_box pt-4">
												<button type="button" class="btn btn-medium btn_reply_submit" data-no="${qna.qnaNo }" data-email="${qna.qnaEmail }">답변하기</button>
											</div>
										</c:when>
										<c:otherwise>
											<div class="answer_content">문의답변<span>${qna.qnaAnswer }</span></div>
										</c:otherwise>
										</c:choose>
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
				$(this).next().slideToggle(400).parents('li').siblings().find('.div_answer').slideUp(400);
				$(this).parents('li').siblings().removeClass('on');
				$(this).parents('li').toggleClass('on');
			});
			
			$('.btn_reply_submit').on('click', function() {
				var $target = $(this).parents('.div_answer').find('.admin_answer');
				if(!$target.hasClass('on')) {
					$target.addClass('on');
					$target.show();
				} else {
					if($target.find('textarea').val() == '') {
						alert('문의 답변을 입력해주세요.');
						$target.find('textarea').focus();
						return false;
					}
					if(confirm('위의 입력하신 내용으로 답변을 보내시겠습니까 ?')) {
						var answer = $target.find('textarea').val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
						$('#frm_qna input[name=qnaNo]').val($(this).data('no'));
						$('#frm_qna input[name=qnaEmail]').val($(this).data('email'));
						$('#frm_qna input[name=qnaAnswer]').val(answer);
						$('#frm_qna').attr('action', '${pageContext.request.contextPath}/admin/qna_reply_process.do');
						$('#frm_qna').submit();
					}
				}
			});
		});
	</script>
</div>