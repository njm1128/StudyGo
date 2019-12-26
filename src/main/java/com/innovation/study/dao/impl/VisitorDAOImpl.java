package com.innovation.study.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.innovation.study.dao.VisitorDAO;
import com.innovation.study.domain.VisitorVO;

@Repository
public class VisitorDAOImpl implements VisitorDAO {

	private static final String NAMESPACE = "Visitor-Mapper";
	
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<VisitorVO> selectVisitorList() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectVisitorList");
	}
	
	@Override
	public List<VisitorVO> selectVisitorListByDay() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectVisitorListByDay");
	}
	
	@Override
	public List<VisitorVO> selectVisitorListByMonth() throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectVisitorListByMonth");
	}

	@Override
	public void insertVisitor(VisitorVO visitor) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertVisitor", visitor);
	}
	
}
