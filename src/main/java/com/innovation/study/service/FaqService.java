package com.innovation.study.service;

import java.sql.SQLException;
import java.util.List;

import com.innovation.study.domain.FaqVO;

public interface FaqService {

	List<FaqVO> getFaqList() throws SQLException;
	
	FaqVO getFaqById(int faqNo) throws SQLException;
	
	void insertFaq(FaqVO faq) throws SQLException;
	
	void modifyFaq(FaqVO faq) throws SQLException;
	
	void removeFaq(int faqNo) throws SQLException;
	
}
