package com.innovation.study.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innovation.study.dao.QnaDAO;
import com.innovation.study.domain.QnaVO;
import com.innovation.study.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List<QnaVO> getQnaList() throws SQLException {
		return qnaDAO.selectQnaList();
	}

	@Override
	public QnaVO getQnaById(int qnaNo) throws SQLException {
		return qnaDAO.selectQnaByNo(qnaNo);
	}

	@Override
	public void insertQna(QnaVO qna) throws SQLException {
		qnaDAO.insertQna(qna);
	}
	
	@Override
	public void insertQnaReply(QnaVO qna) throws SQLException {
		System.out.println(qna);
		qnaDAO.insertQnaReply(qna);
	}

	@Override
	public void modifyQna(QnaVO qna) throws SQLException {
		qnaDAO.updateQna(qna);
	}

	@Override
	public void removeQna(int qnaNo) throws SQLException {
		qnaDAO.deleteQna(qnaNo);
	}

}
