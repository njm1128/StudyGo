package com.innovation.study.domain;

import org.springframework.mail.MailSender;

public abstract class AbstractMailSender {	
	
	protected MailSender mailSender;		
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public abstract void sendMail(UserVO user,MailRequest mail);
	
	
}
