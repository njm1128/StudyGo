<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
	<div class="sub_content faq_wrap pb-4">
		<div class="text_wrap">
			<h2 class="sub_title">자주 하시는 질문</h2>
			<p class="desc_text"><i class="fa fa-phone"></i>문의전화 : 070-8093-4580</p>
			<p class="desc_text"><i class="fa fa-clock-o"></i>고객 상담시간 : 09:00 ~ 18:00</p>
		</div>
		
		<div class="faq_list">
			<c:choose>
			<c:when test="${empty faqList}">
				<div class="empty_wrap">등록된 질문이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<ul class="faq_inner">
					<c:forEach var="faq" items="${faqList}">
						<li <c:out value="${faqNo == faq.faqNo ?'class=on':''}"/>>							
							<div class="div_question">
								<span>Q</span>
								<strong>${faq.faqQuestion }</strong>
							</div>
							<div class="div_answer">${faq.faqAnswer }</div>
						</li>
					</c:forEach>
				</ul>
			</c:otherwise>
			</c:choose>
			<!-- <div class="div_more">
				<button type="button" class="btn_more">더보기<i class="fa fa-angle-down"></i></button>
			</div>	 -->
		</div>
	</div>
	<script>
		$('.faq_list .div_question').on('click', function(){
			$(this).next().slideToggle(400).parent().siblings().find('.div_answer').slideUp(400);
			$(this).parent().siblings().removeClass('on');
			$(this).parent().toggleClass('on');
		});
	</script>
</div>