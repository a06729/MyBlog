package com.pknu.blog.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

	void insertWrite(BoardDto boardDto, Principal principal);

	int getTotal();

	List<BoardDto> getList(Criteria cri);

	BoardDto getContent(int boardNum);

	void viewUp(int boardNum);

	void boardDelete(int boardNum);

	Map<String, Object> getBoardEdit(BoardDto boardDto,BoardFileDto boardFileDto);

	void boardModify(BoardDto boardDto, Principal principal);

	int serchCount(Criteria cri);

	List<BoardDto> serchList(Criteria cri);

	int IdFind(String username);

	void uuidInsert(String username, UUID uuid);

	boolean checkUsername(String uuid, String username);

	void passReset(String userPw, String username);

	int tagTotal(Criteria cri);

	List<BoardDto> tagList(Criteria cri);

	int emailCheck(String userId);

	int userNameCheck(String userName);

	MemberDto getUserInfo(String userId);

	int changePass(String nowPass, String newPass, String userId);



}
