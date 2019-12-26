<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
	<div class="sub_content qna_wrap pb-4">
		<div class="write_wrap">
			<p class="txt_require">
				<span class="txt_star">*</span>항목은 필수입력 항목입니다.
			</p>
			<div class="write_form">
				<form method="post" enctype="multipart/form-data" id="frm_qna">
					<input type="hidden" name="userId" value="${loginUser.userId }" />
					<table>
						<tr>
							<th>
								<label for="qnaTitle">
									<span class="txt_star">*</span>
									<span class="tbl_title">문의제목</span>
								</label>
							</th>
							<td>
								<div class="tbl_content">
									<input type="text" name="qnaTitle" id="qnaTitle" class="form-control" />
								</div>
							</td>
						</tr>
						<tr class="flex_row">
							<th>
								<label>
									<span class="txt_star">*</span>
									<span class="tbl_title">이메일</span>
								</label>
							</th>
							<td>
								<div class="tbl_content">
										<input type="hidden" name="qnaEmail" value="${loginUser.userEmail}" />
										<span class="txt_email">${loginUser.userEmail}</span>
								</div>
							</td>
						</tr>
						<tr>
							<th style="padding-top: 35px; vertical-align: top;">
								<label for="qnaContent">
									<span class="txt_star">*</span>
									<span class="tbl_title">문의내용</span>
								</label>
							</th>
							<td>
								<div class="tbl_content">
									<textarea name="qnaContent" id="qnaContent" class="form-control" rows="5"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<label for="phone_01">
									<span class="txt_star">*</span>
									<span class="tbl_title">휴대폰</span>
								</label>
							</th>
							<td>
								<div class="tbl_content form-inline">	
									<input type="hidden" name="qnaPhone" />
									<div class="sel">
										<div class="form-control form-sm">
											<span class="sel_text">010</span>
											<i class="fa fa-angle-down"></i>
										</div>
										<ul class="sel_phone">
											<li>010</li>
											<li>011</li>
											<li>016</li>
											<li>017</li>
											<li>018</li>
											<li>019</li>
										</ul>
									</div>
									<span class="mid_dash">-</span>
									<input type="text" name="phone_01" id="phone_01" class="form-control form-sm" maxlength="4">
									<span class="mid_dash">-</span>
									<input type="text" name="phone_02" class="form-control form-sm" maxlength="4">
								</div>
							</td>
						</tr>
						<tr>
							<th>
								<label>
									<span class="tbl_title pl-1">첨부파일</span>
								</label>
							</th>
							<td>
								<div class="tbl_content">
									<div class="inp_file form-inline">
										<input type="text" id="attachFile" class="form-control" readonly>
										<label for="file" class="btn">파일첨부
											<input type="file" name="uploadFile" class="file" id="file" accept="image/*" capture="camera">
										</label>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div class="form_button">
						<button type="button" class="btn btn-large" onclick="go_qna_process()">문의하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>