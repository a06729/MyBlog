package com.pknu.blog.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.blog.dto.BoardFileDto;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

public interface MainService {

	void memberSing(MemberDto memberDto, MemberAuthDto memberAuthDto);

	Map<String, Object> boardImage(BoardFileDto fileDto, HttpServletRequest req, MultipartFile upload, Map<String, Object> fileMap);

}
