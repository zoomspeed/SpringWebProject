package com.multi.travel.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor 
                  extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
					throws Exception {
		
		//url 요청이 오면 먼저 preHandler가 다 받아서 
		//로그온 여부에 따라, 로그온 페이지로 보낼지 아니면
		//그대로 진행할지를 결정한다 
		System.out.println("Interceptor : PreHandle");
		   
		//세션에 로그온을 하였는지 상태를 알아본다 
		HttpSession session = request.getSession();   
		String email = (String)session.getAttribute("email");
		
		// Login 이 안되었을 경우 로그인 페이지로 이동한다
		if(email==null || email.equals("")) {
		    System.out.println("Interceptor : Session Check Fail");
		   			 
		    String url="/travel/member/login.do";
		    response.sendRedirect(url);
		    return false;//반드시 false를 리턴한다 
		}
		
		
	    
	   //로그인 성공시 	    
	   System.out.println("Interceptor : Session Check true");
	   return super.preHandle(request, response, handler);
	   //꼭 부모클래스의 preHandler를 호출해야 한다 
	}
}
