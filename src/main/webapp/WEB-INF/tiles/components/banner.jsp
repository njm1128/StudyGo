<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- banner (S) -->
<div id="banner">
	<div class="banner_wrap">
		<div class="banner_item item_01 active" data-index="0">
			<div class="banner_bg"></div>
			<div class="banner_outer">
				<div class="banner_layer ico_layer_01">
			 		<a href="https://www.youtube.com/channel/UCRjAYxMLiWOr0NBVM4HyEKA" target="_blank">
				 		<img src="${pageContext.request.contextPath }/resources/images/icon/ico_banner_layer_01.png" />
			 		</a>
			  </div>
			</div>
			<div class="container">
				<div class="banner_content">
					<div class="banner_layer main_title">
						<img src="${pageContext.request.contextPath }/resources/images/text/txt_banner.png" />
					</div>
				</div>
				
				<div class="banner_content banner_content_mobile d-none">
					<div class="banner_layer main_title">
						<img src="${pageContext.request.contextPath }/resources/images/text/txt_banner_m.png" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- slide button 
	<div class="slide_bt">
		<span class="active" data-index="0"></span>
		<span data-index="1"></span>
	</div>
	 -->
	 
	<script>
	/* banner slide */
	/*
		$('#banner .slide_bt span').on('click', function(){
			var index = $(this).index();
			change_banner(index);
		});
		
		var timer = setInterval("change_banner()", 8000);
		
		$('.slide_bt').hover(function(){
			clearInterval(timer);
			console.log('hover');
		}, function(){
			timer = setInterval("change_banner()", 4000);
			console.log('leave');
		});
		
		function change_banner(target_index) {
			var total_length = $('.banner_item').length;
			var current_index = $('.banner_item.active').index();
			var next_index = current_index + 1 == total_length ? 0 : current_index + 1; 
			
			var current_item = $('.banner_item.active');
			var next_item = $('.banner_item').eq(next_index);
			
			
			if($.isNumeric(target_index)) {
				var is_equal = false;
				$.each($('.banner_item'), function(index, value) {
						if($(this).data('index') == target_index && $(this).hasClass('active')) {
							is_equal = true;
							return false;
						}
				});
				if(is_equal) return;
				
				next_index = target_index;
				next_item = $('.banner_item').eq(next_index);
			}
			
			if(next_index == 0) {
				next_item.addClass("active");
				current_item.fadeOut(1000, function(){
					current_item.removeClass("active");
					current_item.show();
				});
			} else {
				next_item.addClass("active").css("opacity",0).animate({"opacity":1},1000, function(){
					current_item.removeClass('active');
				});
			}
			$('.slide_bt span').removeClass('active');
			$('.slide_bt span').eq(next_index).addClass('active');
		}
		*/
	</script>
</div>
<!-- banner (E) -->