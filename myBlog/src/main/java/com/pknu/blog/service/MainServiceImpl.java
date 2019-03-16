package com.pknu.blog.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.pknu.blog.dao.MainDao;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDao mainDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public void memberSing(MemberDto memberDto,MemberAuthDto memberAuthDto) {
		// TODO Auto-generated method stub
		Map<String, Object> memberMap=new HashMap<String,Object>();
		String encode=passwordEncoder.encode(memberDto.getUserPw());
		memberDto.setUserPw(encode);
		memberAuthDto.setAuth("ROLE_MEMBER");
		
		memberMap.put("memberDto", memberDto);
		memberMap.put("memberAuthDto",memberAuthDto);
		
		mainDao.memberSing(memberMap);
		mainDao.memberAuth(memberMap);
	}

}
