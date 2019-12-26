package com.innovation.study.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovation.study.dao.FaqDAO;
import com.innovation.study.domain.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	private static final String NAMESPACE = "Faq-Mapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FaqVO> selectFaqList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectFaqList");
	}

	@Override
	public FaqVO selectFaqByNo(int faqNo) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".selectFaqByNo", faqNo);
	}

	@Override
	public void insertFaq(FaqVO faq) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertFaq", faq);
	}

	@Override
	public void updateFaq(FaqVO faq) throws SQLException {
		sqlSession.update(NAMESPACE + ".updateFaq", faq);
	}

	@Override
	public void deleteFaq(int faqNo) throws SQLException {
		sqlSession.delete(NAMESPACE + ".deleteFaq", faqNo);
	}

}
