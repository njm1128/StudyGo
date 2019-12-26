package com.innovation.study.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.innovation.study.dao.VisitorDAO;
import com.innovation.study.domain.AbstractMailSender;
import com.innovation.study.domain.FaqVO;
import com.innovation.study.domain.MailRequest;
import com.innovation.study.domain.PageMaker;
import com.innovation.study.domain.QnaVO;
import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.domain.UserVO;
import com.innovation.study.service.FaqService;
import com.innovation.study.service.QnaService;
import com.innovation.study.service.UserService;
import com.innovation.study.util.SmsUtil;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private AbstractMailSender mailSender;
	
	@Autowired
	private VisitorDAO visitorDAO;
	
	@RequestMapping(value="/member.do", method=RequestMethod.GET)
	public String member(@ModelAttribute("cri") SearchCriteria cri, Model model, 
			      HttpSession session, RedirectAttributes rttr) throws SQLException {
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login.do";
		} else if(!user.getAdmin_yn().equals("y")) {
			rttr.addFlashAttribute("msg", "접근 권한이 없습니다.");
			return "redirect:/main.do";
		}
		List<UserVO> userList = userService.getUserListSearch(cri);
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(userService.getUserListSearchCount(cri));
		model.addAttribute("admin_menu", "menu-01");
		model.addAttribute("userList", userList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("userCount", userService.getUserList().size());
		model.addAttribute("dayCount", visitorDAO.selectVisitorListByDay().size());
		model.addAttribute("monthCount", visitorDAO.selectVisitorListByMonth().size());
		model.addAttribute("totalCount", visitorDAO.selectVisitorList().size());
		return "admin/member";
	}
	
	@RequestMapping(value="/member_remove_process.do", method=RequestMethod.POST)
	public String member_remove_process(String userList, RedirectAttributes rttr) throws SQLException {
		for(String userId : userList.split(",")) {
			userService.removeUser(userId);
		}
		rttr.addFlashAttribute("msg", "삭제 처리되었습니다.");
		return "redirect:member.do";
	}
	
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public String faq(Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login.do";
		} else if(!user.getAdmin_yn().equals("y")) {
			rttr.addFlashAttribute("msg", "접근 권한이 없습니다.");
			return "redirect:/main.do";
		}
		List<FaqVO> faqList = faqService.getFaqList();
		
		model.addAttribute("admin_menu", "menu-02");
		model.addAttribute("faqList", faqList);
		model.addAttribute("userCount", userService.getUserList().size());
		model.addAttribute("dayCount", visitorDAO.selectVisitorListByDay().size());
		model.addAttribute("monthCount", visitorDAO.selectVisitorListByMonth().size());
		model.addAttribute("totalCount", visitorDAO.selectVisitorList().size());
		return "admin/faq";
	}
	
	@RequestMapping(value="/faq_write_process.do", method=RequestMethod.POST)
	public String faq_write_process(FaqVO faq, RedirectAttributes rttr) throws SQLException {
		faqService.insertFaq(faq);
		rttr.addFlashAttribute("msg", "질문이 등록되었습니다.");
		return "redirect:faq.do";
	}
	
	@RequestMapping(value="/faq_modify_process.do", method=RequestMethod.POST)
	public String faq_modify_process(FaqVO faq, RedirectAttributes rttr) throws SQLException {
		faqService.modifyFaq(faq);
		rttr.addFlashAttribute("msg", "변경 되었습니다.");
		return "redirect:faq.do";
	}
	
	@RequestMapping(value="/faq_remove_process.do", method=RequestMethod.POST)
	public String faq_remove_process(FaqVO faq, RedirectAttributes rttr) throws SQLException {
		faqService.removeFaq(faq.getFaqNo());
		rttr.addFlashAttribute("msg", "삭제 처리되었습니다.");
		return "redirect:faq.do";
	}
	
	@RequestMapping(value="/qna.do", method=RequestMethod.GET)
	public String qna(Model model, HttpSession session, RedirectAttributes rttr) throws SQLException {
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user == null) {
			rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
			return "redirect:/login.do";
		} else if(!user.getAdmin_yn().equals("y")) {
			rttr.addFlashAttribute("msg", "접근 권한이 없습니다.");
			return "redirect:/main.do";
		}
		List<QnaVO> qnaList = qnaService.getQnaList();
		
		model.addAttribute("admin_menu", "menu-02");
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("userCount", userService.getUserList().size());
		model.addAttribute("dayCount", visitorDAO.selectVisitorListByDay().size());
		model.addAttribute("monthCount", visitorDAO.selectVisitorListByMonth().size());
		model.addAttribute("totalCount", visitorDAO.selectVisitorList().size());
		return "admin/qna";
	}
	
	@RequestMapping(value="/qna_reply_process.do", method=RequestMethod.POST)
	public String qna_reply_process(QnaVO qna, RedirectAttributes rttr) throws SQLException {
		qnaService.insertQnaReply(qna);
		UserVO user = userService.getUserById(qna.getUserId());
		MailRequest mail = new MailRequest();
		String title = "[체험학습GO] 문의사항에 대한 답변입니다.";
		mail.setTitle(title);
		mail.setMessage(qna.getQnaAnswer());
		mailSender.sendMail(user, mail);
		rttr.addFlashAttribute("msg", "답변이 완료 되었습니다.");
		return "redirect:qna.do";
	}
	
	@RequestMapping(value="/sendSms.do", method=RequestMethod.POST)
	public String qna_reply_process(String userList, String sms_content, 
			                        RedirectAttributes rttr) throws Exception {
		String phoneList = "";
		for(String user : userList.split(",")) {
			UserVO vo = userService.getUserById(user);
			
			String userPhone = vo.getUserPhone();
			String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		    if(!Pattern.matches(regEx, userPhone)) continue;
		    userPhone = userPhone.replaceAll(regEx, "$1-$2-$3");

			phoneList += phoneList == "" ? userPhone : "," + userPhone;
		}
		SmsUtil.sendSMS(sms_content, phoneList, null);
		rttr.addFlashAttribute("msg", "문자 전송이 완료 되었습니다.");
		return "redirect:member.do";
	}
	
	@RequestMapping(value="/sendEmail.do", method=RequestMethod.POST)
	public String qna_reply_process(String userList, MailRequest mail, 
			RedirectAttributes rttr) throws Exception {
		for(String user : userList.split(",")) {
			UserVO vo = userService.getUserById(user);
			mailSender.sendMail(vo, mail);
		}
		rttr.addFlashAttribute("msg", "이메일 전송이 완료 되었습니다.");
		return "redirect:member.do";
	}
	
}
