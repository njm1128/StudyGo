package com.innovation.study.domain;

import lombok.Data;

@Data
public class FaqVO {
	
	private int faqNo; // 일련번호
	private String faqQuestion; // 질문 
	private String faqAnswer; // 답변
	private String reg_date; // 작성일
}