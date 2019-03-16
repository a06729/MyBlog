package com.pknu.blog.service;

import org.springframework.stereotype.Service;

import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

public interface MainService {

	void memberSing(MemberDto memberDto, MemberAuthDto memberAuthDto);

}
