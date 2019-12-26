package com.innovation.study.domain;

import org.springframework.mail.SimpleMailMessage;

public class UserMailSender extends AbstractMailSender{

	@Override
	public void sendMail(UserVO user, MailRequest mail) {
		SimpleMailMessage message=new SimpleMailMessage();
		
		message.setSubject(mail.getTitle());
		message.setFrom("njm1128@naver.com");
		message.setText(mail.getMessage());
		message.setTo(user.getUserEmail());
		mailSender.send(message);
	}
	
}
