<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="popup_bg"></div>
    
    <div class="video-popup">
			<div class="video-popup-closer"></div>
		</div>
</div>
<!-- wrapper (E) -->
<script>
	if('${msg}' != '') {
		alert('${msg}');	
	}
	if('${res.msg}' != '') {
		alert('${res.msg}');	
	}
	
	var scrollPosition = $(".sub_content").offset().top;
	/*
	$("html, body").animate({
		scrollTop: scrollPosition + 50
	}, 100);
	*/
	$('html, body').scrollTop(scrollPosition + 50);
	
</script>
</body>
</html>