package com.innovation.study.service.impl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.innovation.study.dao.FaqDAO;
import com.innovation.study.domain.FaqVO;
import com.innovation.study.service.FaqService;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDAO;
	
	@Override
	public List<FaqVO> getFaqList() throws SQLException {
		return faqDAO.selectFaqList();
	}

	@Override
	public FaqVO getFaqById(int faqNo) throws SQLException {
		return faqDAO.selectFaqByNo(faqNo);
	}

	@Override
	public void insertFaq(FaqVO faq) throws SQLException {
		faqDAO.insertFaq(faq);
	}

	@Override
	public void modifyFaq(FaqVO faq) throws SQLException {
		faqDAO.updateFaq(faq);
	}

	@Override
	public void removeFaq(int faqNo) throws SQLException {
		faqDAO.deleteFaq(faqNo);
	}

}
