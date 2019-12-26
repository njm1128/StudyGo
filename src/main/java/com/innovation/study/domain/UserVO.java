package com.innovation.study.domain;

import lombok.Data;

@Data
public class UserVO {
	
	private String userId; // 사용자 아이디
	private String userPw; // 사용자 비밀번호 
	private String userEmail; // 사용자 이메일
	private String userPhone; // 사용자 핸드폰
	private String reg_date; // 가입일
	private String admin_yn; // 관리자 여부 (y/n)
	private int login_count; // 로그인 횟수
}
