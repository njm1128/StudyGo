package com.innovation.study.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovation.study.dao.QnaDAO;
import com.innovation.study.domain.QnaVO;

@Repository
public class QnaDAOImpl implements QnaDAO {

	private static final String NAMESPACE = "Qna-Mapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<QnaVO> selectQnaList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectQnaList");
	}

	@Override
	public QnaVO selectQnaByNo(int qnaNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectQnaByNo", qnaNo);
	}

	@Override
	public void insertQna(QnaVO qna) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertQna", qna);
	}
	
	@Override
	public void insertQnaReply(QnaVO qna) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertQnaReply", qna);
	}

	@Override
	public void updateQna(QnaVO qna) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateQna", qna);
	}

	@Override
	public void deleteQna(int qnaNo) throws SQLException {
		sqlSession.delete(NAMESPACE + ".deleteQna", qnaNo);
	}

}
