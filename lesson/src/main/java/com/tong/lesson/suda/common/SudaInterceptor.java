package com.tong.lesson.suda.common;

import javax.servlet.http.*;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SudaInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws Exception {
		boolean result = true;
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null)
			response.sendRedirect("loginGo.do");
		return result;
	}
}
