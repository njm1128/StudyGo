<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- main (S) -->
<div class="content main_wrap">
	<!-- 대전 42선 명소 start -->
	<div class="section section_01">
		<div class="container">
			<h2 class="main_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_main_title_01.png" /></h2>
			
			<div class="owl-carousel owl-theme slide_wrap">
				<c:forEach var="data" items="${dataList}">
					<div class="item video_data" data-no="${data.dataNo}">
			    	<div class="image_area">
			    		<img src="http://img.youtube.com/vi/${data.dataVideo }/maxresdefault.jpg">
			    		<div class="hover_icon">
								<i class="fa fa-youtube-play" aria-hidden="true"></i>
							</div>
			    	</div>
			    	<div class="text_area">
			    		<h3 class="item_title">${data.dataName }</h3>
			    		<p class="item_desc">${data.dataDesc1 }</p>
			    	</div>
			    </div>
				</c:forEach>
			</div>
			
			<div class="button_area">
				<a href="${pageContext.request.contextPath }/pl/video.do" class="btn_all_view">전체보기</a>
			</div>
		</div>
	</div>
	<!-- 대전 42선 명소 end -->
	
	<!-- 출석 및 퀴즈풀이 장소보기 start -->
	<div class="section section_02">
		<div class="container">
			<h2 class="main_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_main_title_02.png" /></h2>
			
			<div class="owl-carousel owl-theme slide_wrap">
				<c:forEach var="data" items="${dataList}">
					<div class="item image_data" data-view="${data.dataNo }">
			    	<div class="image_area">
			    		<img src="${pageContext.request.contextPath }/resources/images/data/view_${data.dataImage}.jpg" />
			    		<div class="hover_icon">
								<i class="fa fa-youtube-play" aria-hidden="true"></i>
							</div>
			    	</div>
			    	<div class="text_area">
			    		<h3 class="item_title">${data.dataName }</h3>
			    	</div>
			    </div>
				</c:forEach>
			</div>
			
			<div class="button_area">
				<a href="${pageContext.request.contextPath }/pl/sights.do" class="btn_all_view">전체보기</a>
			</div>
		</div>
	</div>
	<!-- 출석 및 퀴즈풀이 장소보기 end -->
	
	<!-- 추천 명소 영상 start -->
	<div class="section section_03">
		<div class="container">
			<h2 class="main_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_main_title_03.png" /></h2>
			
			<div class="owl-carousel owl-theme slide_wrap">
		    <c:forEach var="data" items="${dataHitList}">
					<div class="item video_data" data-no="${data.dataNo}">
			    	<div class="image_area">
			    		<img src="http://img.youtube.com/vi/${data.dataVideo }/maxresdefault.jpg">
			    		<div class="hover_icon">
								<i class="fa fa-youtube-play" aria-hidden="true"></i>
							</div>
			    	</div>
			    	<div class="text_area">
			    		<h3 class="item_title">${data.dataName }</h3>
			    		<p class="item_desc">${data.dataDesc1 }</p>
			    	</div>
			    </div>
				</c:forEach>
			</div>
			
			<div class="button_area">
				<a href="${pageContext.request.contextPath }/pl/video.do" class="btn_all_view">전체보기</a>
			</div>
		</div>
	</div>
	<!-- 추천 명소 영상 end -->
	
	<!-- 현장체험학습 이야기 start -->
	<div class="section section_04">
		<div class="container">
			<h2 class="main_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_main_title_04.png" /></h2>
			
			<div class="inline_div">
				<h3 class="title">자주 하시는 질문</h3>
				
				<ul class="list">
					<c:choose>
					<c:when test="${empty faqList }">
						<li class="empty">등록된 질문이 없습니다.</li>
					</c:when>
					<c:otherwise>
						<c:forEach var="faq" items="${faqList }" varStatus="status">
							<c:if test="${status.index < 3 }">
								<li><a href="${pageContext.request.contextPath }/cs/faq.do?no=${faq.faqNo}">${faq.faqQuestion }</a></li>
							</c:if>
						</c:forEach>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
			
			<div class="inline_div">
				<h3 class="title">명소 영상보기</h3>
				
				<ul class="list">
					<c:forEach var="data" items="${dataHitList }" varStatus="status">
						<c:if test="${status.index < 3 }">
							<li class="video_data" data-no="${data.dataNo}"><a href="#">[${data.dataArea}명소]&nbsp;&nbsp;${data.dataName }</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			
			<div class="inline_div">
				<h3 class="title">출석 및 퀴즈풀이 장소보기</h3>
				
				<ul class="list">
					<c:forEach var="data" items="${dataHitList }" varStatus="status">
						<c:if test="${status.index < 3 }">
							<li><a href="${pageContext.request.contextPath }/pl/sights_view.do?view=${data.dataNo}">[${data.dataArea}명소]&nbsp;&nbsp;${data.dataName }</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 현장체험학습 이야기 end -->
	
	<script>
		$(document).ready(function(){
			$('.section_01 .owl-carousel').owlCarousel({
			    autoplay: true,
			    autoplayHoverPause: true,
			    loop:true,
			    nav:true,
			    navText: ["<i class='fa fa-chevron-left' aria-hidden='true'></i>", "<i class='fa fa-chevron-right' aria-hidden='true'></i>"],
			    dots:false,
			    responsive:{
			        0:{
			            items:1
			        },
			        475:{
			            items:2
			        },
			        800:{
			            items:3,
			            margin:15
			        }
			    }
			});

			$('.section_02 .owl-carousel').owlCarousel({
					autoplay: true,
					autoplayHoverPause: true,
			    loop:true,
			    nav:true,
			    navText: ["<i class='fa fa-chevron-left' aria-hidden='true'></i>", "<i class='fa fa-chevron-right' aria-hidden='true'></i>"],
			    dots:false,
			    responsive:{
			        0:{
			            items:1
			        },
			        600:{
			            items:2
			        },
			        992:{
			            items:3
			        },
			        1200:{
			            items:4,
			            margin:15
			        }
			    }
			});
			
			$('.section_03 .owl-carousel').owlCarousel({
					autoplay: true,
					autoplayHoverPause: true,
			    loop:true,
			    margin:15,
			    nav:true,
			    navText: ["<i class='fa fa-chevron-left' aria-hidden='true'></i>", "<i class='fa fa-chevron-right' aria-hidden='true'></i>"],
			    dots:false,
			    responsive:{
			        0:{
			            items:1
			        },
			        475:{
			            items:2
			        },
			        800:{
			            items:3,
			            margin:15
			        }
			    }
			});
			
			/* mouse scroll */
			/*
			$('.owl-carousel').on('mousewheel', '.owl-stage', function (e) {
			    if (e.deltaY<0) {
			    	$(this).trigger('next.owl');
			    } else {
			    	$(this).trigger('prev.owl');
			    }
			    e.preventDefault();
			});
			*/
		});
	</script>
</div>
<!-- main (E) -->