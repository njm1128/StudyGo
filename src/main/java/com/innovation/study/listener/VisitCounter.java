package com.innovation.study.listener;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.innovation.study.dao.VisitorDAO;
import com.innovation.study.dao.impl.VisitorDAOImpl;
import com.innovation.study.domain.VisitorVO;

public class VisitCounter implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		VisitorDAO visitorDAO = (VisitorDAOImpl) wac.getBean("visitorDAO");
		VisitorVO visitor = new VisitorVO();
		visitor.setVisitorIp(req.getRemoteAddr());
		try {
			List<VisitorVO> visitorList = visitorDAO.selectVisitorListByDay();
			boolean isEqual = false;
			for(VisitorVO vo : visitorList) {
				if(vo.getVisitorIp().equals(visitor.getVisitorIp())) {
					isEqual = true;
					break;
				}
			}
			if(!isEqual)
				visitorDAO.insertVisitor(visitor);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {}

}
