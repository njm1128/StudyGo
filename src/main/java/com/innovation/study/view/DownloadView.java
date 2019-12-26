package com.innovation.study.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class DownloadView extends AbstractView{ 
	
	public DownloadView() { 
		setContentType("application/download; charset=utf-8");
	}
	
	@Override                               
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		File downloadFile = (File) model.get("downloadFile"); 
		
		response.setContentType(getContentType()); 
		response.setContentLength((int)downloadFile.length()); 

		String header = request.getHeader("User-Agent");
        boolean ie = header.indexOf("MSIE") > -1;
        String fileName = null;
        
        if(ie) {
            fileName = URLEncoder.encode(downloadFile.getName(), "utf-8");
        } else {
            fileName = new String(downloadFile.getName().getBytes("utf-8"), "iso-8859-1");
        }	
		response.setHeader("Content-Disposition", "attachment;fileName=\"" + fileName + "\";");
		response.setHeader("Content-Transter-Encoding", "binary");

		OutputStream out = response.getOutputStream(); 
		FileInputStream fis = null; 
		
		try{
			fis = new FileInputStream(downloadFile);
			FileCopyUtils.copy(fis, out); 
		}finally{
			if(fis != null) fis.close();
		}
		out.flush(); 
	} 
}