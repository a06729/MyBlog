package com.pknu.blog.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.pknu.blog.dao.MainDao;
import com.pknu.blog.dto.MemberDto;
import com.pknu.blog.security.securityDto.CustomUser;

public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private MainDao mainDao;
	
	@Autowired
	private PasswordEncoder encoder;
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto dto;
		System.out.println("Load User By UserName:"+username);
		
		dto=mainDao.read(username);
		
		System.out.println("queried by member mapper:"+dto);
		
		return dto==null ? null:new CustomUser(dto);
	}
	
}
