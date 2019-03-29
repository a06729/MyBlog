package com.pknu.blog.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.BoardFileDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

public interface MainService {

	void memberSing(MemberDto memberDto, MemberAuthDto memberAuthDto);

	BoardFileDto boardImage(BoardFileDto fileDto, MultipartHttpServletRequest mtfRequest);

	BoardFileDto deletFile(String[] date, String original_File_Name, String stored_File_Name, BoardFileDto boardFileDto, HttpServletRequest req);

	void insertWrite(BoardDto boardDto);

	int getTotal();

	List<BoardDto> getList(Criteria cri);


}
