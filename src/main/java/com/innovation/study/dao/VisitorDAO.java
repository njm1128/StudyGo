package com.innovation.study.dao;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.VisitorVO;

public interface VisitorDAO {

	List<VisitorVO> selectVisitorList() throws SQLException;
	
	List<VisitorVO> selectVisitorListByDay() throws SQLException;
	
	List<VisitorVO> selectVisitorListByMonth() throws SQLException;

	void insertVisitor(VisitorVO visitor) throws SQLException;
	
}
