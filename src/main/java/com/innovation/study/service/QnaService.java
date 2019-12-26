package com.innovation.study.service;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.QnaVO;

public interface QnaService {

	List<QnaVO> getQnaList() throws SQLException;
	
	QnaVO getQnaById(int qnaNo) throws SQLException;
	
	void insertQna(QnaVO qna) throws SQLException;
	
	void insertQnaReply(QnaVO qna) throws SQLException;
	
	void modifyQna(QnaVO qna) throws SQLException;
	
	void removeQna(int qnaNo) throws SQLException;
	
}
