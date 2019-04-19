package com.pknu.blog.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomLoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String errormsg=null;
		
		if(exception instanceof BadCredentialsException) {
			errormsg="아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		}else if(exception instanceof DisabledException ) {
			errormsg="계정이 비활성화되었습니다. 관리자에게 문의하세요.";
		}
		
		request.setAttribute("username",username);
		request.setAttribute("password", password);
		request.setAttribute("errormsg", errormsg);
		
		request.getRequestDispatcher("/loginPage").forward(request, response);
	}
	
}
