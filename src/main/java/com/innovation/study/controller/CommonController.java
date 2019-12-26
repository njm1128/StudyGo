package com.innovation.study.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.innovation.study.domain.DataVO;
import com.innovation.study.domain.PageMaker;
import com.innovation.study.domain.SearchCriteria;
import com.innovation.study.domain.UserVO;
import com.innovation.study.service.DataService;
import com.innovation.study.service.UserService;

@Controller
public class CommonController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private DataService dataService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "common/login";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_process(UserVO user, RedirectAttributes rttr, HttpSession session) throws SQLException {
		Map<String, Object> res = new HashMap<String, Object>();
		res.put("userId", user.getUserId());
		res.put("userPw", user.getUserPw());
		
		int result = userService.getLoginResult(user);
		if(result == -1) {
			res.put("msg", "아이디가 존재하지 않습니다.");
			rttr.addFlashAttribute("res", res);
			return "redirect:login.do";
		} else if (result == 0) {
			res.put("msg", "비밀번호가 일치하지 않습니다.");
			rttr.addFlashAttribute("res", res);
			return "redirect:login.do";
		} else if (result == 1){
			UserVO loginUser = userService.getUserById(user.getUserId());
			userService.modifyUserLoginCount(loginUser);
			session.setAttribute("loginUser", loginUser);
			return "redirect:/main.do";
		} 
		return "common/login";
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) throws SQLException {
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃 되었습니다.");
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "common/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join_process(UserVO user, RedirectAttributes rttr, Model model) throws SQLException {
		Map<String, Object> res = new HashMap<String, Object>();
		
		UserVO other = userService.getUserById(user.getUserId());
		UserVO other2 = userService.getUserByPhone(user.getUserPhone());
		if(other != null) {
			res.put("userId", user.getUserId());
			res.put("userPw", user.getUserPw());
			res.put("userEmail", user.getUserEmail());
			res.put("userPhone", user.getUserPhone());
			
			res.put("msg", "아이디가 이미 사용중입니다.");
			rttr.addFlashAttribute("res", res);
			return "redirect:join.do";
		} else if(other2 != null) {
			res.put("userId", user.getUserId());
			res.put("userPw", user.getUserPw());
			res.put("userEmail", user.getUserEmail());
			res.put("userPhone", user.getUserPhone());
			
			res.put("msg", "사용중인 핸드폰 번호입니다.");
			rttr.addFlashAttribute("res", res);
			return "redirect:join.do";
		} else {
			res.put("userId", user.getUserId());
			res.put("userPw", user.getUserPw());
			
			//user.setUserPw(UserSha256.encrypt(user.getUserPw()));
			
			userService.insertUser(user);
			
			res.put("msg", "회원가입 되었습니다.");
			rttr.addFlashAttribute("res", res);
			return "redirect:login.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxIdCheck.do", method=RequestMethod.POST)
	public Map<String, Object> ajaxIdCheck(String userId) throws SQLException {
		Map<String, Object> data = new HashMap<String, Object>();
		UserVO user = userService.getUserById(userId);
		if(user == null) 
			data.put("result", true);
		else
			data.put("result", false);
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value="/find_process.do", method=RequestMethod.POST)
	public Map<String, Object> find_process(String type, UserVO user) throws SQLException {
		Map<String, Object> data = new HashMap<String, Object>();
		UserVO vo = userService.getUserFind(type, user);
		data.put("user", vo);
		
		return data;
	}
	
	@RequestMapping(value="/search.do", method=RequestMethod.GET)
	public String search(@ModelAttribute("cri") SearchCriteria cri, Model model) throws SQLException {
		cri.setPerPageNum(3);
		List<DataVO> dataList = dataService.getDataListByKeyword(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dataService.getDataListByKeywordCount(cri));
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageMaker", pageMaker);
		return "common/search";
	}
	
	@ResponseBody
	@RequestMapping(value="/get_side_data.do", method=RequestMethod.POST)
	public Map<String, Object> get_side_data() throws SQLException {
		Map<String, Object> data = new HashMap<String, Object>();
		List<DataVO> dataList = dataService.getDataListByHit();
		
		data.put("dataList", dataList);
		
		return data;
	}
	
	@RequestMapping(value="/privacy.do", method=RequestMethod.GET)
	public String privacy() {
		return "common/privacy";
	}
	
	@RequestMapping(value="/error.do", method=RequestMethod.GET)
	public String error() {
		return "err/error";
	}
}
