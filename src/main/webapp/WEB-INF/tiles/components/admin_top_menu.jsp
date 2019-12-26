<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- admin_side (S) -->
<div id="admin_top_menu">
	<ul class="side_list">
		<li>
			<a href="${pageContext.request.contextPath }/admin/member.do"><i class="fa fa-caret-down" aria-hidden="true"></i>회원관리</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath }/admin/faq.do"><i class="fa fa-caret-down" aria-hidden="true"></i>게시판관리</a>
			<div class="side_sub_wrap">
				<ul class="side_sub">
					<li><a href="${pageContext.request.contextPath }/admin/faq.do"><i class="fa fa-angle-right" aria-hidden="true"></i>자주하시는 질문</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/qna.do"><i class="fa fa-angle-right" aria-hidden="true"></i>1:1 문의</a></li>
				</ul>
			</div>
		</li>
	</ul>
	
	<ul class="count_list">
		<li>
			<i class="fa fa-users"></i>
			<span class="count_type">금일 접속<span class="count">${dayCount }</span></span>
		</li>
		<li>
			<i class="fa fa-users"></i>
			<span class="count_type">월 접속<span class="count">${monthCount }</span></span>
		</li>
		<li>
			<i class="fa fa-users"></i>
			<span class="count_type">총 접속<span class="count">${totalCount }</span></span>
		</li>
		<li>
			<i class="fa fa-users"></i>
			<span class="count_type">총 회원<span class="count">${userCount }</span></span>
		</li>
	</ul>
	<script>
		$('.side_list > li, .side_sub_wrap').hover(function() {
			$(this).find('.side_sub_wrap').show();
		}, function() {
			$(this).find('.side_sub_wrap').hide();
		});
	</script>
</div>
<!-- admin_side (E) -->