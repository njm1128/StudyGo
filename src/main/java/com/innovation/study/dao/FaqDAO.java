package com.innovation.study.dao;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.FaqVO;

public interface FaqDAO {

	List<FaqVO> selectFaqList() throws SQLException;

	FaqVO selectFaqByNo(int faqNo) throws SQLException;

	void insertFaq(FaqVO faq) throws SQLException;

	void updateFaq(FaqVO faq) throws SQLException;

	void deleteFaq(int faqNo) throws SQLException;
}
