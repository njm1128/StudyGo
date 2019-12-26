package com.innovation.study.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaVO {
	
	private String qnaNo; // 일련번호
	private String qnaTitle; // 문의 제목 
	private String qnaEmail; // 이메일
	private String qnaContent; // 문의 내용 
	private String qnaPhone; // 핸드폰
	private String qnaFile; // 첨부파일
	private String qnaAnswer; // 문의 답변
	private Timestamp reg_date; // 작성일
	private String answer_date; // 답변일
	private String userId; // 작성자 아이디
	private MultipartFile uploadFile; // 첨부파일 객체

}
