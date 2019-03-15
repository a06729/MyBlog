package com.pknu.blog.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse res,
			Authentication auth) throws IOException, ServletException {
		// TODO Auto-generated method stub
		List<String>roleNames=new ArrayList<>();
		auth.getAuthorities().forEach(authority -> {
			System.out.println("authority:"+authority);
			roleNames.add(authority.getAuthority());
		});
		
		if(roleNames.contains("ROLE_ADMIN")) {
			res.sendRedirect("/admin");
			return ;
		}
		
		if(roleNames.contains("ROLE_MEMBER")) {
			res.sendRedirect("/member");
			return;
		}
		
		res.sendRedirect("/");
	}
	
}
