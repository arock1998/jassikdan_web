package com.jassikdan.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor{
 
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException{
		logger.info(request.getRequestURI());
		
		//세션을 가져온다.
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		//URL path를 가져온다.
		String uri = request.getRequestURI();
		
		//만약 로그인이 안되어있으면 mypage를 보여줄 수 없다.
		if(userId == null && uri.startsWith("/mypage")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		if(userId == null && uri.startsWith("/timeline")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		if(userId == null && uri.startsWith("/recipe_course")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		if(userId == null && uri.startsWith("/recipe")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		
		
		//로그인이 되어있으면 sign_in_view, sign_up_view 를 보여주지 않는다.
		if(userId != null && uri.startsWith("/user/sign_in_view")) {
			response.sendRedirect("/mypage/refrigerator_view");
			return false;
		} else if(userId != null && uri.startsWith("/user/sign_up_view")) {
			response.sendRedirect("/mypage/refrigerator_view");
			return false;
		}
		return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) {
		logger.warn(" ### postHandler" + request.getRequestURI());
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception) {
		logger.error(" ### postHandler " + request.getRequestURI());
	}
	
}
