package com.pknu.blog.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.savedrequest.SavedRequest;

@Configuration
public class CustomLoginFailureHandler implements AuthenticationFailureHandler{
	
	public static final Logger log=LoggerFactory.getLogger(CustomLoginFailureHandler.class);
	
	private String loginIdName;
	private String loginPwdName;
	private String errorMsgName;
	private String defaultFailureUrl;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String errormsg=null;
		
		if(exception instanceof BadCredentialsException) {
			log.info("아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.");
			
			errormsg="아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		}else if(exception instanceof DisabledException ) {
			log.info("계정이 비활성화되었습니다. 관리자에게 문의하세요.");
			
			errormsg="계정이 비활성화되었습니다. 관리자에게 문의하세요.";
		}
		
		request.setAttribute(loginIdName,username);
		request.setAttribute(loginPwdName, password);
		request.setAttribute(errorMsgName, errormsg);
		
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
	}

	public String getLoginIdName() {
		return loginIdName;
	}

	public void setLoginIdName(String loginIdName) {
		this.loginIdName = loginIdName;
	}

	public String getLoginPwdName() {
		return loginPwdName;
	}

	public void setLoginPwdName(String loginPwdName) {
		this.loginPwdName = loginPwdName;
	}

	public String getErrorMsgName() {
		return errorMsgName;
	}

	public void setErrorMsgName(String errorMsgName) {
		this.errorMsgName = errorMsgName;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	
	
}
