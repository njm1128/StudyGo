<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="sub_content video_wrap pb-4">
		<div class="category_wrap">
			<ul class="cate_list">
				<li class="area_wrap">
					<a href="javascript:toggle_area()">지역명소 선택<i class="fa fa-angle-down" aria-hidden="true"></i></a>
					<div class="area_list">
						<ul>
							<li><a href="javascript:displayList('a', '서울')">서울</a></li>
							<li><a href="javascript:displayList('a', '부산')">부산</a></li>
							<li><a href="javascript:displayList('a', '대구')">대구</a></li>
							<li><a href="javascript:displayList('a', '인천')">인천</a></li>
							<li><a href="javascript:displayList('a', '제주')">제주</a></li>
							<li><a href="javascript:displayList('a', '대전')">대전</a></li>
							<li><a href="javascript:displayList('a', '광주')">광주</a></li>
						</ul>
					</div>
				</li>
				<li><a href="javascript:displayList('c', 1)">역사명소</a></li>
				<li><a href="javascript:displayList('c', 2)">공원명소</a></li>
				<li><a href="javascript:displayList('c', 3)">과학명소</a></li>
				<li><a href="javascript:displayList('c', 4)">문화명소</a></li>
				<li><a href="javascript:displayList('c', 5)">생태명소</a></li>
			</ul>
		</div>
		
		<div class="grid_list_wrap"></div>
		
	</div>
	<script>
		displayList('a', '${area}');
		displayList('c', '${category}');
		function displayList(type, keyword) {
			var area = '';
			var category = '';
			if(type == 'a') {
				area = keyword;
				category = $('.cate_list > li.active').index();
				if(area != '대전') {
					alert('서비스 준비중입니다.');
					return;
				}
				$('.area_list li').removeClass('active');
				$.each($('.area_list li'), function(index, value) {
					if($(this).find('a').text() == area) {
						$(this).addClass('active');
						return false;
					}
				});
				$('.category_wrap .area_list').hide();
			} else if (type == 'c') {
				area = $('.area_list li.active').find('a').text();
				category = keyword;
				$('.cate_list > li').removeClass('active');
				$('.cate_list > li').eq(category).addClass('active');
			}
			if(category < 1 || category > 5) return;
			
			$.ajax({
				url: 'getDataListByCate.do',
				type: 'post',
				dataType: 'json',
				data: {'dataArea': area, 'dataCate': category},
				success: function(data) {
					var html = '';
					$.each(data, function(index, value) {
						html+= '<div class="section">';
						html+= '	<h2 class="sec_title">' + value.cateName + '</h2>';
						html+= '	<div class="grid_list">';
						$.each(value.dataList, function(idx, val) {
							html+= '		  <div class="list_item video_data" data-no="' + val.dataNo + '">';
							html+= '    		<div class="image_area">';
							html+= '   				<img src="http://img.youtube.com/vi/' + val.dataVideo + '/maxresdefault.jpg">';
							html+= '    			<div class="hover_icon">';
							html+= '    				<i class="fa fa-youtube-play" aria-hidden="true"></i>';
							html+= '    			</div>';
							html+= '    		</div>';
							html+= '   			<div class="text_area">';
							html+= '    			<h3 class="item_title">' + val.dataName + '</h3>';
							html+= '    		</div>';
							html+= '  		</div>';
						});
					  html+= '	 </div>';
						html+= '</div>';
					});
					$('.grid_list_wrap').html(html);
				},
				error: function() {
					console.log('error');
				}
			});
		}
	</script>
</div>