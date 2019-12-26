package com.innovation.study.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.innovation.study.domain.DataVO;
import com.innovation.study.domain.FaqVO;
import com.innovation.study.service.DataService;
import com.innovation.study.service.FaqService;

@Controller
public class MainController {
	
	@Autowired
	private DataService dataService;
	
	@Autowired
	private FaqService faqService;
	
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model) throws SQLException {
		List<DataVO> dataList = dataService.getDataListBySearch("대전", 0);
		List<DataVO> dataHitList = dataService.getDataListByHit();
		List<FaqVO> faqList = faqService.getFaqList();
		
		model.addAttribute("dataList", dataList);
		model.addAttribute("dataHitList", dataHitList);
		model.addAttribute("faqList", faqList);
		
		return "main";
	}
	
}
