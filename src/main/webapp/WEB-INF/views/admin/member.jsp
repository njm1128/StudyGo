<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
	<div class="sub_content admin_wrap pb-4">
		<h2 class="sub_title"><img src="${pageContext.request.contextPath }/resources/images/text/txt_admin.png" /></h2>
		
		<%@ include file="/WEB-INF/tiles/components/admin_top_menu.jsp" %>
		
		<div class="content_wrap">
			<div class="member_search">
				<div class="search_input">
					<i class="fa fa-user"></i>
					<input type="text" name="keyword" class="inp_keyword" value="${cri.keyword }" placeholder="아이디를 입력하세요 "/>
				</div>
				<button class="btn btn-small btn_mem_search">검색</button>
			</div>
				
			<div class="member_wrap">
				<div class="member_list">
					<ul class="list_head">
						<li><input type="checkbox" class="chk chk_all" /></li>
						<li>아이디</li>
						<li>구분</li>
						<li>접속횟수</li>
						<li>가입일</li>
					</ul>
					<c:choose>
					<c:when test="${empty userList }">
					<div class="empty_wrap pt-3 pb-3" style="font-size: 17px; border-radius: 0;">조회된 결과가 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="user" items="${userList }">
							<fmt:parseDate value="${user.reg_date}" var="reg_date" pattern="yyyy-mm-dd HH:mm:ss.0"/>
							<fmt:formatDate value="${reg_date}" var="reg_date" pattern="yyyy-MM-dd"/>
							<ul class="list_body">
								<li><input type="checkbox" class="chk" data-id="${user.userId }" data-admin="${user.admin_yn }" /></li>
								<li>${user.userId }</li>
								<li>
									<c:if test="${user.admin_yn eq 'y' }">관리자</c:if>
									<c:if test="${user.admin_yn eq 'n' }">사용자</c:if>
								</li>
								<li>${user.login_count } 회</li>
								<li>${reg_date }</li>
							</ul>
						</c:forEach>
					</c:otherwise>					
					</c:choose>
				</div>
				
				<div class="text-center mb-2">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a href="member.do${pageMaker.makeQuery(pageMaker.startPage-1)}&keyword=${cri.keyword}">&lt;</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
								<a href="member.do${pageMaker.makeQuery(idx)}&keyword=${cri.keyword}">${idx}</a>
							</li>
						</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="member.do${pageMaker.makeQuery(pageMaker.endPage+1)}&keyword=${cri.keyword}">&gt;</a></li>
						</c:if>
					</ul>
				</div>
							
				<div class="button_box">
					<button class="btn btn-small btn_sms">문자전송</button>
					<button class="btn btn-small btn_email">이메일전송</button>
					<button class="btn btn-small btn_remove">삭제</button>
				</div>
				
				<form method="post" id="frm_member">
					<input type="hidden" name="userList" />
				</form>
			</div>
		</div>
	</div>
	<div class="find_wrap form_content popup_wrap member_popup" id="sms_popup">
		<form action="${pageContext.request.contextPath }/admin/sendSms.do" method="post" id="frm_sms">
			<input type="hidden" name="userList" />
			<div class="popup_top">
				<h2 class="popup_title">문자 전송</h2>
			</div>
			<div class="popup_content">
				<div class="input_div">
					<span class="input_title">문자내용</span>
					<textarea name="sms_content"></textarea>
				</div>
				<div class="form-button">
					<button type="button" class="btn btn-large" onclick="go_sms_process()">전송하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<div class="find_wrap form_content popup_wrap member_popup" id="email_popup">
		<form action="${pageContext.request.contextPath }/admin/sendEmail.do" method="post" id="frm_email">
			<input type="hidden" name="userList" />
			<div class="popup_top">
				<h2 class="popup_title">이메일 전송</h2>
			</div>
			<div class="popup_content">
				<div class="input_div">
					<span class="input_title">이메일 제목</span>
					<input type="text" name="title" />
				</div>
				<div class="input_div">
					<span class="input_title">이메일 내용</span>
					<textarea name="message"></textarea>
				</div>
				<div class="form-button">
					<button type="button" class="btn btn-large" onclick="go_email_process()">전송하기</button>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
			$(".chk_all").change(function(){
	        if($(this).is(":checked")){
	           $('.chk').prop('checked', true);
	        }else{
	        	 $('.chk').prop('checked', false);
	        }
	    });
			
			$('.btn_remove').on('click', function() {
				 var userList = '';
				 var count = 0;
				 var admin_yn = false;
				 $.each($('.chk:checked'), function(index, value) {
					 var id = $(this).data('id');
					 var admin = $(this).data('admin');
					 if(!id) return false;
					 userList += userList == '' ? id : ',' + id;
					 count ++;
					 if(admin == 'y') {
						 admin_yn = true;
						 return false;
					 }
				 });
				 if(count == 0) {
					 alert('삭제하실 회원을 선택해주세요.');
					 return;
				 }
				 if(admin_yn) {
					 alert('관리자는 삭제하실 수 없습니다.');
					 return;
				 }
				 
				 if(confirm('총 ' + count + '명의 회원을 삭제하시겠습니까 ?\n삭제하신 데이터는 복구할 수 없습니다.')) {
					 $('#frm_member input[name=userList]').val(userList);
					 $('#frm_member').attr('action', '${pageContext.request.contextPath}/admin/member_remove_process.do');
					 $('#frm_member').submit();
				 }
			});
			
			$('.member_search .btn_mem_search').on('click', function() {
				var keyword = $('.member_search .inp_keyword').val();
				memberSearch(keyword);
			});
			
			$(".member_search .inp_keyword").keydown(function(e) {
			    if (e.keyCode == 13){
			    	var keyword = $(this).val();
			    	memberSearch(keyword);
			    }    
			});
			
			function memberSearch(keyword) {
				location.href = $('#ctx').text() + '/admin/member.do${pageMaker.makeQuery(1)}&keyword=' + keyword;
			}
			
			$('.btn_sms').on('click', function() {
				 var userList = '';
				 var count = 0;
				 $.each($('.chk:checked'), function(index, value) {
					 var id = $(this).data('id');
					 if(!id) return false;
					 userList += userList == '' ? id : ',' + id;
					 count ++;
				 });
				 if(count == 0) {
					 alert('문자를 보낼 회원을 선택해주세요.');
					 return;
				 }
				 $('#sms_popup input[name=userList]').val(userList);
				 $('.popup_bg').show();
				 $('#sms_popup').show();
			});
			
			$('.btn_email').on('click', function() {
				 var userList = '';
				 var count = 0;
				 $.each($('.chk:checked'), function(index, value) {
					 var id = $(this).data('id');
					 if(!id) return false;
					 userList += userList == '' ? id : ',' + id;
					 count ++;
				 });
				 if(count == 0) {
					 alert('이메일을 보낼 회원을 선택해주세요.');
					 return;
				 }
				 $(' input[name=userList]').val(userList);
				 $('.popup_bg').show();
				 $('#email_popup').show();
			});
			
		});
		
		function go_sms_process() {
			if($('#sms_popup textarea').val() == '') {
				alert('문자 내용을 입력해주세요.');
				$('#sms_popup textarea').focus();
				return;
			}
			if(confirm('입력하신 내용으로 문자를 전송하시겠습니까 ?')) {
				$('#frm_sms').submit();
			}
		}
		
		function go_email_process() {
			if($('#email_popup input[name=title]').val() == '') {
				alert('이메일 제목을 입력해주세요.');
				$('#email_popup input[name=title]').focus();
				return;
			} else if($('#email_popup textarea[name=message]').val() == '') {
				alert('이메일 내용을 입력해주세요.');
				$('#email_popup textarea[name=message]').focus();
				return;
			}
			if(confirm('입력하신 내용으로 이메일을 전송하시겠습니까 ?')) {
				$('#frm_email').submit();
			}
		}
	</script>
</div>