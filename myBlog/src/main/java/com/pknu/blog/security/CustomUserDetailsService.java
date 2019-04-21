package com.pknu.blog.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	public static final Logger log=LoggerFactory.getLogger(CustomUserDetailsService.class);
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto dto;
		
		log.info("Load User By UserName:"+username);
		
		dto=mainDao.read(username);
		
		log.info("queried by member mapper:"+dto);
		
		if(dto==null) {
			throw new UsernameNotFoundException(username);
		}
		
		return dto;
		
	}
	
}
