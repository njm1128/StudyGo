package com.innovation.study.controller;

import java.io.File;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController implements ApplicationContextAware{
	
	private WebApplicationContext context = null; 
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext) applicationContext;
	}
	
	@RequestMapping("/download.do")
	public ModelAndView download(@RequestParam("path") String filePath,
			                     @RequestParam("file") String fileName, 
		              	         HttpServletResponse response) throws Exception {
		File downloadFile = getFile(filePath, fileName);
		if(downloadFile == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
		return new ModelAndView("download", "downloadFile", downloadFile);
	}
	
	private File getFile(String filePath, String fileName) {
		String baseDir = context.getServletContext().getRealPath("resources/" + filePath);
		
		
		return new File(baseDir, fileName);
	}
}