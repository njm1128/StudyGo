package com.innovation.study.dao;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.QnaVO;

public interface QnaDAO {

	List<QnaVO> selectQnaList() throws SQLException;

	QnaVO selectQnaByNo(int qnaNo) throws SQLException;

	void insertQna(QnaVO qna) throws SQLException;
	
	void insertQnaReply(QnaVO qna) throws SQLException;

	void updateQna(QnaVO qna) throws SQLException;

	void deleteQna(int qnaNo) throws SQLException;
}
