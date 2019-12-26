package com.innovation.study.domain;

import lombok.Data;

@Data
public class DataVO {
	
	private int dataNo; // 일련번호
	private int dataCate; // 카테고리 번호 (1:역사, 2:공원, 3:과학, 4:문화, 5:생태)
	private String dataArea; // 지역
	private String dataName; // 명소명
	private String dataAddr; // 주소
	private String dataTel; // 전화번호
	private String dataRefer; // 출처
	private String dataDesc1; // 내용1
	private String dataDesc2; // 내용2
	private String dataDesc3; // 내용3
	private String dataImage; // 이미지 정보
	private String dataVideo; // 비디오 정보
	private int dataHit; // 조회수
}
