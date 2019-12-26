<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- right_side (S) -->
<div id="right_side">
	<div class="side_wrap">
		<h3 class="side_top">
			<img src="${pageContext.request.contextPath }/resources/images/text/txt_sidemenu.png" />
		</h3>
		<div class="side_content"></div>
		<div class="side_bottom" onclick="location.href='${pageContext.request.contextPath}/pl/video.do'">전체보기</div>
	</div>
	<script>
		$(document).ready(function() {
			$.ajax({
				url: '${pageContext.request.contextPath}/get_side_data.do',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					var html = '';
					$.each(data.dataList, function(index, value) {
						if(index >= 4) return;
						html += '<div class="side_item video_data" data-no="' + value.dataNo + '">';
				    html += '	<div class="image_area">';
				    html += '		<img src="http://img.youtube.com/vi/' + value.dataVideo + '/maxresdefault.jpg">';
						html+= '    <div class="hover_icon">';
						html+= '       <i class="fa fa-youtube-play" aria-hidden="true"></i>';
						html+= '    </div>';
				    html += '	</div>';
				    html += '	<div class="text_area">';
				    html += '		<h3 class="item_title">' + value.dataName + '</h3>';
				    html += '		<p class="item_desc">' + value.dataAddr + '</p>';
				    html += '	</div>';
				    html += '</div>';
					});
					$('#right_side .side_content').html(html);
				},
				error: function() {
					console.log('error');
				}
			});
		});
	</script>
</div>
<!-- right_side (E) -->