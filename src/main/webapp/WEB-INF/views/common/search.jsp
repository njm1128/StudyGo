<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<div class="sub_content search_wrap pb-4">
		<h2 class="search_title">키워드 <span class="keyword">“${cri.keyword}”</span>(으)로 검색하신 결과입니다.</h2>

		<c:choose>
		<c:when test="${empty dataList}">
			<div class="empty_wrap">검색 결과를 찾을 수 없습니다.</div>
		</c:when>
		<c:otherwise>
		<div class="search_list">
			<ul>
				<c:forEach var="data" items="${dataList }">
					<c:forEach begin="0" end="1" varStatus="status">
						<c:if test="${status.index eq 0 }">
							<li class="image_data" data-view="${data.dataImage }">
								<div class="image_wrap">
									<img src="${pageContext.request.contextPath }/resources/images/data/view_${data.dataImage}.jpg" />
									<div class="hover_icon">
										<i class="fa fa-search" aria-hidden="true"></i>
									</div>
								</div>
								<div class="info_wrap">
									<h3 class="info_title">[퀴즈풀이 장소보기] ${data.dataName }</h3>
									<p class="info_desc"><i class="fa fa-map-marker"></i>주소 : ${data.dataAddr }</p>
									<p class="info_desc"><i class="fa fa-phone"></i>전화 : ${data.dataTel }</p>
									<p class="info_desc"><i class="fa fa-share"></i>출처 : ${data.dataRefer }</p>
								</div>
							</li>
						</c:if>
						<c:if test="${status.index eq 1 }">
							<li class="video_data" data-no="${data.dataNo}">
								<div class="image_wrap">
									<img src="http://img.youtube.com/vi/${data.dataVideo }/maxresdefault.jpg" />
									<div class="hover_icon">
										<i class="fa fa-youtube-play" aria-hidden="true"></i>
									</div>
								</div>
								<div class="info_wrap">
									<h3 class="info_title">[명소 영상보기] ${data.dataName }</h3>
									<p class="info_desc"><i class="fa fa-map-marker"></i>주소 : ${data.dataAddr }</p>
									<p class="info_desc"><i class="fa fa-phone"></i>전화 : ${data.dataTel }</p>
									<p class="info_desc"><i class="fa fa-share"></i>출처 : ${data.dataRefer }</p>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</c:forEach>
			</ul>
		</div>
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li><a href="search.do?keyword=${cri.keyword }&page=${pageMaker.startPage - 1}">&lt;</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
						<a href="search.do?keyword=${cri.keyword }&page=${idx}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="search.do?keyword=${cri.keyword }&page=${pageMaker.endPage +1}">&gt;</a></li>
				</c:if>
			</ul>
		</div>
		</c:otherwise>
		</c:choose>
	</div>
</div>