package com.innovation.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cp")
public class CompanyController {
	
	@RequestMapping(value="/greet.do", method=RequestMethod.GET)
	public String greet(Model model) {
		model.addAttribute("menu", "menu-02");
		model.addAttribute("submenu", "1");
		return "cp/greet";
	}
	
	@RequestMapping(value="/location.do", method=RequestMethod.GET)
	public String location(Model model) {
		model.addAttribute("menu", "menu-02");
		model.addAttribute("submenu", "2");
		return "cp/location";
	}
	
}
