package com.innovation.study.util;

public class DataUtil {

	public static String getCateName(int category) {
		String cateName = "";
		switch(category) {
		case 1:
			cateName = "역사명소";
			break;
		case 2:
			cateName = "공원명소";
			break;
		case 3:
			cateName = "과학명소";
			break;
		case 4:
			cateName = "문화명소";
			break;
		case 5:
			cateName = "생태명소";
			break;
		default: 
			cateName = "기타명소";
		}
		return cateName;
	}
}
