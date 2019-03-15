package com.pknu.blog.security;

import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoOpPassordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		// TODO Auto-generated method stub
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		// TODO Auto-generated method stub
		return rawPassword.toString().equals(encodedPassword);
	}
	
}
