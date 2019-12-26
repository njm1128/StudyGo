<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- header (S) -->
<div id="header">
	<!-- top tag start -->
	<div class="top_tag_wrap">
		<div class="container">
			<ul class="tag_list">
				<li><a href="#">#대전</a></li>
				<li><a href="#">#박물관</a></li>
				<li><a href="#">#서원</a></li>
				<li><a href="#">#도서관</a></li>
				<li><a href="#">#공원</a></li>
				<li><a href="#">#전시관</a></li>
				<li><a href="#">#산성</a></li>
				<li><a href="#">#과학관</a></li>
				<li><a href="#">#자연</a></li>
				<li><a href="#">#미술관</a></li>
				<li><a href="#">#카이스트</a></li>
				<li><a href="#">#유적지</a></li>
				<li><a href="#">#중앙시장</a></li>
				<li><a href="#">#오월드</a></li>
				<li><a href="#">#아쿠아리움</a></li>
				<li><a href="#">#천문대</a></li>
				<li><a href="#">#체험관</a></li>
				<li><a href="#">#현충원</a></li>
				<li><a href="#">#수목원</a></li>
				<li><a href="#">#동춘당</a></li>
				<li><a href="#">#남간정사</a></li>
				<li><a href="#">#예술의전당</a></li>
				<li><a href="#">#솔로몬로파크</a></li>
			</ul>
			<span class="ico_close_bt"></span>
		</div>
	</div>
	<!-- top tag end -->
	
	<!-- logo pc start -->
	<div class="logo_wrap pc">
		<div class="container">
			<h1 class="logo">
				<a href="${pageContext.request.contextPath }/main.do">
					<img src="${pageContext.request.contextPath }/resources/images/icon/ico_logo.png" />
				</a>
			</h1>
			
			<div class="search_area">
				<form>
					<input type="text" class="d-none" />
					<input autocomplete="new-password" type="text" name="keyword" class="inp_keyword" placeholder="검색어를 입력해주세요" />
					<button type="button" class="btn_search"><i class="fa fa-search" aria-hidden="true"></i></button>
				</form>
			</div>
			
			<div class="util_area">
				<ul class="util_list">
					<c:choose>
	        <c:when test="${loginUser eq null }">
						<li><a href="${pageContext.request.contextPath }/login.do"><i class="fa fa-user-o" aria-hidden="true"></i>로그인</a></li>
						<li><a href="${pageContext.request.contextPath }/join.do"><i class="fa fa-sign-in" aria-hidden="true"></i>회원가입</a></li>
	        </c:when>
	        <c:otherwise>
	        	<c:if test="${loginUser.admin_yn eq 'y'}">
		          <li><a href="${pageContext.request.contextPath }/admin/member.do"><i class="fa fa-user"></i>관리자</a></li>
	        	</c:if>
	          <li><a href="${pageContext.request.contextPath }/logout.do"><i class="fa fa-sign-out"></i>로그아웃</a></li>
	        </c:otherwise>
	        </c:choose>
				</ul>
			</div>
		</div>
	</div>	
	<!-- logo pc end -->
	
	<!-- gnb menu pc start -->
	<div class="gnb_wrap pc">
		<div class="container">
			<ul class="gnb">
				<li <c:if test="${menu eq 'menu-01' }">class="active_menu"</c:if>>
					<a href="${pageContext.request.contextPath }/app/intro.do"><i class="fa fa-mobile" aria-hidden="true" style="position: relative; top: 2px;font-size: 26px;"></i>어플소개</a>
					<div class="gnb_sub_wrap">
						<div class="gnb_sub">
							<ul>
								<li><a href="${pageContext.request.contextPath }/app/intro.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>체험학습GO란?</a></li>
								<li><a href="${pageContext.request.contextPath }/app/function.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>기능소개</a></li>
								<li><a href="${pageContext.request.contextPath }/app/method.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>학습방법</a></li>
								<li><a href="${pageContext.request.contextPath }/app/benefit.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>혜택</a></li>
							</ul>
							<div class="arrow_top"></div>
						</div>
					</div>
				</li>
				<li <c:if test="${menu eq 'menu-02' }">class="active_menu"</c:if>>
					<a href="${pageContext.request.contextPath }/cp/greet.do"><i class="fa fa-building-o" aria-hidden="true"></i>회사소개</a>
					<div class="gnb_sub_wrap">
						<div class="gnb_sub">
							<ul>
								<li><a href="${pageContext.request.contextPath }/cp/greet.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>인사말</a></li>
								<li><a href="${pageContext.request.contextPath }/cp/location.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>찾아오시는길</a></li>
							</ul>
							<div class="arrow_top"></div>
						</div>
					</div>
				</li>
				<li <c:if test="${menu eq 'menu-03' }">class="active_menu"</c:if>>
					<a href="${pageContext.request.contextPath }/pl/sights.do"><i class="fa fa-film" aria-hidden="true"></i>명소정보</a>
					<div class="gnb_sub_wrap">
						<div class="gnb_sub">
							<ul>
								<li><a href="${pageContext.request.contextPath }/pl/sights.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>출석 및 퀴즈장소</a></li>
								<li><a href="${pageContext.request.contextPath }/pl/video.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>명소영상보기</a></li>
							</ul>
							<div class="arrow_top"></div>
						</div>
					</div>
				</li>
				<li <c:if test="${menu eq 'menu-04' }">class="active_menu"</c:if>>
					<a href="${pageContext.request.contextPath }/cs/faq.do"><i class="fa fa-edit" aria-hidden="true"></i>문의하기</a>
					<div class="gnb_sub_wrap">
						<div class="gnb_sub">
							<ul>
								<li><a href="${pageContext.request.contextPath }/cs/faq.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>자주하시는질문</a></li>
								<li><a href="${pageContext.request.contextPath }/cs/qna.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>1:1문의</a></li>
							</ul>
							<div class="arrow_top"></div>
						</div>
					</div>
				</li>
				<li <c:if test="${menu eq 'menu-05' }">class="active_menu"</c:if>>
					<a href="${pageContext.request.contextPath }/resources/dist/manual.zip"><i class="fa fa-cloud-download" aria-hidden="true"></i>매뉴얼 다운로드</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- gnb menu pc end -->
	
	<!-- logo mobile start -->
	<div class="logo_mobile_wrap mobile">
		<h1 class="logo">
			<a href="${pageContext.request.contextPath }/main.do">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_logo.png" />
			</a>
		</h1>
		
		<div class="search_area">
			<form>
				<input type="text" class="d-none" />
				<input autocomplete="new-password" type="text" name="keyword" class="inp_keyword" placeholder="검색어를 입력해주세요" />
				<button type="button" class="btn_search"><i class="fa fa-search" aria-hidden="true"></i></button>
			</form>
		</div>
		
		<div class="mobile_bar">
			<a href="#">
				<i class="fa fa-bars" aria-hidden="true"></i>
			</a>
		</div>
		
		<div class="icon_area">
			<a href="#">
				<i class="fa fa-search" aria-hidden="true"></i>
			</a>
		</div>
	</div>	
	<!-- logo mobile end -->
	
	<!-- mobile menu -->
	<div class="popup_back"></div>
	<div class="mobile_menu">
		<ul class="mobile_list">
			<c:choose>
      <c:when test="${loginUser eq null }">
			<li><a onclick="location.href='${pageContext.request.contextPath }/login.do'"><i class="fa fa-user-o" aria-hidden="true"></i>로그인</a></li>
			<li><a onclick="location.href='${pageContext.request.contextPath }/join.do'"><i class="fa fa-sign-in" aria-hidden="true"></i>회원가입</a></li>
      </c:when>
      <c:otherwise>
      	<c:if test="${loginUser.admin_yn eq 'y'}">
         <li><a onclick="location.href='${pageContext.request.contextPath }/admin/member.do'"><i class="fa fa-user"></i>관리자</a></li>
      	</c:if>
        <li><a onclick="location.href='${pageContext.request.contextPath }/logout.do'"><i class="fa fa-sign-out"></i>로그아웃</a></li>
      </c:otherwise>
      </c:choose>
      
			<li <c:if test="${menu eq 'menu-01' }">class="active_menu"</c:if>>
				<a href="#"><i class="fa fa-mobile" aria-hidden="true" style="position: relative; top: 2px;font-size: 26px;"></i>어플소개</a>
				<div class="gnb_sub_wrap">
					<div class="gnb_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath }/app/intro.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>체험학습GO란?</a></li>
							<li><a href="${pageContext.request.contextPath }/app/function.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>기능소개</a></li>
							<li><a href="${pageContext.request.contextPath }/app/method.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>학습방법</a></li>
							<li><a href="${pageContext.request.contextPath }/app/benefit.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>혜택</a></li>
						</ul>
						<div class="arrow_top"></div>
					</div>
				</div>
			</li>
			<li <c:if test="${menu eq 'menu-02' }">class="active_menu"</c:if>>
				<a href="#"><i class="fa fa-building-o" aria-hidden="true"></i>회사소개</a>
				<div class="gnb_sub_wrap">
					<div class="gnb_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath }/cp/greet.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>인사말</a></li>
							<li><a href="${pageContext.request.contextPath }/cp/location.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>찾아오시는길</a></li>
						</ul>
						<div class="arrow_top"></div>
					</div>
				</div>
			</li>
			<li <c:if test="${menu eq 'menu-03' }">class="active_menu"</c:if>>
				<a href="#"><i class="fa fa-film" aria-hidden="true"></i>명소정보</a>
				<div class="gnb_sub_wrap">
					<div class="gnb_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath }/pl/sights.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>출석 및 퀴즈장소</a></li>
							<li><a href="${pageContext.request.contextPath }/pl/video.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>명소영상보기</a></li>
						</ul>
						<div class="arrow_top"></div>
					</div>
				</div>
			</li>
			<li <c:if test="${menu eq 'menu-04' }">class="active_menu"</c:if>>
				<a href="#"><i class="fa fa-edit" aria-hidden="true"></i>문의하기</a>
				<div class="gnb_sub_wrap">
					<div class="gnb_sub">
						<ul>
							<li><a href="${pageContext.request.contextPath }/cs/faq.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>자주하시는질문</a></li>
							<li><a href="${pageContext.request.contextPath }/cs/qna.do"><i class="fa fa-chevron-right" aria-hidden="true"></i>1:1문의</a></li>
						</ul>
						<div class="arrow_top"></div>
					</div>
				</div>
			</li>
			<li <c:if test="${menu eq 'menu-05' }">class="active_menu"</c:if>>
				<a onclick="location.href='${pageContext.request.contextPath }/resources/dist/manual.zip'"><i class="fa fa-cloud-download" aria-hidden="true"></i>매뉴얼 다운로드</a>
			</li>
		</ul>
	</div>
	<span id="ctx" class="d-none">${pageContext.request.contextPath }</span>
	<script>
	  $(document).ready(function(){
		  /* mobile menu open */
			$('.mobile_bar').on('click', function(){
					$('.popup_back').show();
					$(".mobile_menu").css('width', '0px').animate({
		         width: "260px"
			    }, 50, "linear");
			});
		  
			/* mobile menu close */
		  $('.popup_back').on('click', function(){
			  $('.popup_back').hide();
				$(".mobile_menu").animate({
	         width: "0px"
		    }, 50, "linear");
		  });
			
		  $(window).resize(function(){
				$('.popup_back').hide();
				$(".mobile_menu").animate({
		     width: "0px"
		    }, 50, "linear");
			});
			
		  /* gnb menu hover */
			$('.gnb > li, .gnb > li .gnb_sub_wrap').hover(function() {
				$(this).find('.gnb_sub_wrap').show();
			}, function(){
				$(this).find('.gnb_sub_wrap').hide();
			});			
		  
		  /* gnb submenu active */
		  var submenu = '${submenu}';
			$('.gnb > li .gnb_sub > ul > li').removeClass('active');
			$('.gnb > li.active_menu .gnb_sub > ul > li').eq(submenu-1).addClass('active');
			
			/* gnb submenu active mobile */
			$('.mobile_list > li .gnb_sub > ul > li').removeClass('active');
			$('.mobile_list > li.active_menu .gnb_sub > ul > li').eq(submenu-1).addClass('active');
			$('.mobile_list > li.active_menu .gnb_sub_wrap').show();
			
			/* top tag show */
			$('.top_tag_wrap').stop().animate({'height': '40px'}, 500);
			$('.top_tag_wrap .ico_close_bt').on('click', function(){
				$('.top_tag_wrap').stop().animate({'height': '0px'}, 500);
			});
			
			/* top tag click */
			$('.tag_list a').on('click', function() {
				var tag = $(this).text().replace('#', '');
				location.href = '${pageContext.request.contextPath}/search.do?keyword=' + tag;
			});
			
			/* mobile search show */
			$('.logo_mobile_wrap .icon_area .fa-search').on('click', function() {
				$('.logo_mobile_wrap .search_area').show();	
			});
			
			$('.mobile_list > li > a').on('click', function(e) {
				e.preventDefault();
				
				$('.mobile_list .gnb_sub_wrap').hide();
				$(this).parent('li').find('.gnb_sub_wrap').show();
			});
			
	  });
	</script>
</div>
<!-- header (E) -->