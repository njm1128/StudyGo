<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="sub_content method_wrap pb-4">
		<div class="object_wrap">
			<ul>
				<li class="active" onclick="changeObject(1)">
					<img src="${pageContext.request.contextPath }/resources/images/button/btn_object_01_on.png">
					<p class="object_name">학생</p>
				</li>
				<li onclick="changeObject(2)">
					<img src="${pageContext.request.contextPath }/resources/images/button/btn_object_02_off.png">
					<p class="object_name">학교 및 교사</p>
				</li>
				<li onclick="changeObject(3)">
					<img src="${pageContext.request.contextPath }/resources/images/button/btn_object_03_off.png">
					<p class="object_name">학부모</p>
				</li>
				<li onclick="changeObject(4)">
					<img src="${pageContext.request.contextPath }/resources/images/button/btn_object_04_off.png">
					<p class="object_name">공공기관 및 지역</p>
				</li>
			</ul>
		</div>
		
		<div class="section" id="section_01">
			<div class="image_wrap">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_01_1.png">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_01_2.png">
			</div>
			<div class="info_wrap">
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">1</span>장소 둘러보기 기능</h3>
					<p class="info_desc">현장체험 학습을갈 명소에 대한 정보를 미리 확인할 수 있습니다.</p>
				</div>
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">2</span>체험학습 기능</h3>
					<p class="info_desc">GPS를 이용한 출석체크, 퀴즈풀이, 쿠폰획득, 보고서 작성 등 기능과 함께 현장체험 학습을 시작할수 있는 메뉴입니다.</p>
				</div>
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">3</span>보고서 작성 기능</h3>
					<p class="info_desc">현장체험 학습 후 보고서를 작성, 수정 및 제출 할 수 있는 메뉴입니다.</p>
				</div>
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">4</span>쿠폰</h3>
					<p class="info_desc">퀴즈 풀이 후 획득한 쿠폰 목록을 볼 수 있는 메뉴입니다.</p>
				</div>
			</div>
		</div>
		
		<div class="section" id="section_02">
			<div class="image_wrap">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_02_1.png">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_02_2.png">
			</div>
			<div class="info_wrap">
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">1</span>담당반 학생확인</h3>
					<p class="info_desc">학생들이 작성한 현장체험 학습 보고서를 열람할 수 있습니다.</p>
				</div>
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">2</span>학생 보고서확인</h3>
					<p class="info_desc">담당반의 학생을 확인할 수 있습니다.</p>
				</div>
			</div>
		</div>
		
		<div class="section" id="section_03">
			<div class="image_wrap">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_03_1.png">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_03_2.png">
			</div>
			<div class="info_wrap">
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">1</span>자녀 정보확인</h3>
					<p class="info_desc">자녀의 정보를 확인할 수 있습니다.</p>
				</div>
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">2</span>자녀 보고서확인</h3>
					<p class="info_desc">자녀의 현장체험 학습 정보를 열람할 수 있습니다.</p>
				</div>
			</div>
		</div>
		
		<div class="section" id="section_04">
			<div class="image_wrap">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_04_1.png">
				<img src="${pageContext.request.contextPath }/resources/images/icon/ico_method_04_2.png">
			</div>
			<div class="info_wrap">
				<div class="info_list">
					<h3 class="info_title"><span class="title_number">1</span>QR코드 스캔</h3>
					<p class="info_desc">학생들은 현장체험 학습 중 퀴즈 풀이를 통해 주변 상권에서 사용할 수 있는 쿠폰을 획득합니다.<br/>학생들이 쿠폰을 제시하면 QR코드 스캔 메뉴로 들어가서 스캔할 수 있습니다.</p>
				</div>
			</div>
		</div>
		
	</div>
</div>
