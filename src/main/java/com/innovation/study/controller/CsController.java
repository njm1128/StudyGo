package com.innovation.study.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.innovation.study.domain.FaqVO;
import com.innovation.study.domain.QnaVO;
import com.innovation.study.domain.UserVO;
import com.innovation.study.service.FaqService;
import com.innovation.study.service.QnaService;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public String faq(@RequestParam(value="no", defaultValue="0", required=false) int faqNo, Model model) throws SQLException {
		List<FaqVO> faqList = faqService.getFaqList();
		
		model.addAttribute("menu", "menu-04");
		model.addAttribute("submenu", "1");
		model.addAttribute("faqList", faqList);
		model.addAttribute("faqNo", faqNo);
		return "cs/faq";
	}
	
	@RequestMapping(value="/qna.do", method=RequestMethod.GET)
	public String qna(Model model, HttpSession session, RedirectAttributes rttr) {
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login.do";
		}
		model.addAttribute("user", user);
		model.addAttribute("menu", "menu-04");
		model.addAttribute("submenu", "2");
		return "cs/qna";
	}
	
	@RequestMapping(value="/qna.do", method=RequestMethod.POST)
	public String qna(QnaVO qna, String qnaTitle, String userId, 
			          HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();

		String savePath = "resources/upload";
		ServletContext context = session.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		if (!qna.getUploadFile().isEmpty()) {
			File file = new File(uploadFilePath, System.currentTimeMillis() + qna.getUploadFile().getOriginalFilename());
			qna.getUploadFile().transferTo(file);
			qna.setQnaFile(file.getName());
		} 
		qnaService.insertQna(qna);
		rttr.addFlashAttribute("msg", "문의 등록이 완료되었습니다.\\n문의 답변은 이메일로 전송받으실 수 있습니다.");
		return "redirect:qna.do";
	}
	
}