package com.innovation.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/app")
public class AppController {
	
	@RequestMapping(value="/intro.do", method=RequestMethod.GET)
	public String intro(Model model) {
		model.addAttribute("menu", "menu-01");
		model.addAttribute("submenu", "1");
		return "app/intro";
	}
	
	@RequestMapping(value="/function.do", method=RequestMethod.GET)
	public String function(Model model) {
		model.addAttribute("menu", "menu-01");
		model.addAttribute("submenu", "2");
		return "app/function";
	}
	
	@RequestMapping(value="/method.do", method=RequestMethod.GET)
	public String method(Model model) {
		model.addAttribute("menu", "menu-01");
		model.addAttribute("submenu", "3");
		return "app/method";
	}
	
	@RequestMapping(value="/benefit.do", method=RequestMethod.GET)
	public String benefit(Model model) {
		model.addAttribute("menu", "menu-01");
		model.addAttribute("submenu", "4");
		return "app/benefit";
	}
	
}
