package com.pda.intecepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MyInteceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
	//	System.out.println("afterCompletion...................");
		arg0.setCharacterEncoding("utf-8");
		arg1.setContentType("text/html;charset=utf-8");

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
	//	System.out.println("postHandle...................");
		//arg0.setCharacterEncoding("utf-8");
     	arg0.setCharacterEncoding("utf-8");
		arg1.setContentType("text/html;charset=utf-8");
	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
	//	System.out.println("preHandle...................");
		arg0.setCharacterEncoding("utf-8");
		arg1.setContentType("text/html;charset=utf-8");
		return true;
	}

}
