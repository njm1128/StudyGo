<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="sub_content sights_view_wrap pb-4">
		<div class="image_wrap">
			<h3 class="main_image">
				<img src="${pageContext.request.contextPath }/resources/images/data/view_${data.dataImage}.jpg" />
			</h3>
			<ul class="sub_image">
				<li><img src="${pageContext.request.contextPath }/resources/images/data/view_${data.dataImage}_01.jpg" /></li>
				<li class="ml-2 mr-2"><img src="${pageContext.request.contextPath }/resources/images/data/view_${data.dataImage}_02.jpg" /></li>
				<li><img src="${pageContext.request.contextPath }/resources/images/data/view_${data.dataImage}_03.jpg" /></li>
			</ul>
		</div>
		<div class="info_wrap">
			<div class="info_top">
				<h2 class="info_title">${data.dataName }</h2>
				<p class="info_desc"><i class="fa fa-map-marker" aria-hidden="true"></i>주소 : ${data.dataAddr }</p>
				<p class="info_desc"><i class="fa fa-phone" aria-hidden="true"></i>전화 : ${data.dataTel }</p>
				<p class="info_desc"><i class="fa fa-share" aria-hidden="true"></i>출처 : ${data.dataRefer }</p>
			</div>
			<div class="info_bottom">
				<p class="info_desc pb-2">${data.dataDesc1 }</p>
				<p class="info_desc pb-2">${data.dataDesc2 }</p>
				<p class="info_desc">${data.dataDesc3 }</p>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$('.sub_image > li').on('click', function(){
				var sub_image = $(this).find('img').attr('src');
				var main_image = $('.main_image img').attr('src');
				$(this).find('img').attr('src', main_image);
				$('.main_image img').attr('src', sub_image);
			});
		});
	</script>
</div>