package com.pknu.blog.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import com.pknu.blog.dto.MemberDto;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private CustomUserDetailsService userDeSer;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String username=(String)authentication.getPrincipal();//아이디
		String password=(String)authentication.getCredentials();//비밀번호
		
		String auth="null";
		
		MemberDto user=(MemberDto)userDeSer.loadUserByUsername(username);
	
		if(!mathPassword(password, user.getPassword())) {
			throw new BadCredentialsException(username);
		}
		
		if(!user.isEnabled()) {
			throw new BadCredentialsException(username);
		}
		
		return new UsernamePasswordAuthenticationToken(username,password,user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}
	
	private boolean mathPassword(String loginPwd,String password) {
		return loginPwd.equals(password);
	}
}
