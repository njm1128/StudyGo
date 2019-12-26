package com.innovation.study.domain;

import lombok.Data;

@Data
public class VisitorVO {
	
	private int visitorNo; // 일련번호
	private String visitorIp; // 접속 아이피
	private String visitorTime; // 접속 시간
}