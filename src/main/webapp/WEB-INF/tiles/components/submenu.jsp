<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- submenu (S) -->
<div id="submenu">
	<div class="container px-0">
		<ul class="menu_list menu_4" id="menu-01">
			<li><a href="${pageContext.request.contextPath }/app/intro.do">체험학습GO란?</a></li>
			<li><a href="${pageContext.request.contextPath }/app/function.do">기능소개</a></li>
			<li><a href="${pageContext.request.contextPath }/app/method.do">학습방법</a></li>
			<li><a href="${pageContext.request.contextPath }/app/benefit.do">혜택</a></li>
		</ul>
		<ul class="menu_list menu_2" id="menu-02">
			<li><a href="${pageContext.request.contextPath }/cp/greet.do">인사말</a></li>
			<li><a href="${pageContext.request.contextPath }/cp/location.do">찾아오시는 길</a></li>
		</ul>
		<ul class="menu_list menu_2" id="menu-03">
			<li><a href="${pageContext.request.contextPath }/pl/sights.do">둘러보기</a></li>
			<li><a href="${pageContext.request.contextPath }/pl/video.do">명소영상보기</a></li>
		</ul>
		<ul class="menu_list menu_2" id="menu-04">
			<li><a href="${pageContext.request.contextPath }/cs/faq.do">자주 하시는 질문</a></li>
			<li><a href="${pageContext.request.contextPath }/cs/qna.do">1:1 문의</a></li>
		</ul>
	</div>
	<script>
		var menu = '${menu}';
		var submenu = '${submenu}';
		
		$.each($('.menu_list'), function(index, value) {
			if($(this).attr('id') == menu) {
				$(this).show();
				$(this).find('li').eq(submenu-1).addClass('active_menu');
			}
		});
	</script>
</div>
<!-- submenu (E) -->