package com.pknu.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.BoardFileDto;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;
import com.pknu.blog.service.MainService;


@Controller
public class MainController {
	@Autowired
	private MainService mainervice;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index() {

		return "index";
	}
	@GetMapping("/member")
	public void doMember() {
		
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		
	}
	
	//회원가입페이지로 이동
	@GetMapping("/singup")
	public String singupPage() {
		return "singupPage";
	}
	
	//회원가입 기능구현
	@PostMapping("/sing")
	public void sing(MemberDto memberDto,MemberAuthDto memberAuthDto){
		mainervice.memberSing(memberDto,memberAuthDto);
	}
	
	//게시판 글쓰기 페이지로 이동
	@GetMapping("/boardPage")
	public void boardPage() {
		
	}
	//게시판 글쓰기
	@PostMapping("/boardWrite")
	public void boardWrite(BoardDto boardDto,BoardFileDto boardFileDto,HttpServletResponse res) {
		
		res.encodeRedirectURL("/");
	}
	
	@RequestMapping(value="/imageFile",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> boardImage(BoardFileDto fileDto,HttpServletRequest req,@RequestParam MultipartFile upload,Model model) {
		System.out.println("이미지 업로드");
		Map<String, Object>fileMap=new HashMap<>();
		fileMap=mainervice.boardImage(fileDto,req,upload,fileMap);
		System.out.println(fileMap);
		return fileMap;
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth,Model model) {
		model.addAttribute("msg","Access Denied");
	}
	
	@GetMapping("loginPage")
	public void loginPage(String error,String logout,Model model) {
		if(error != null) {
			System.out.println(error);
			model.addAttribute("error","Login Error Check Your Account");
		}
		
		if(logout !=null) {
			System.out.println(logout);
			model.addAttribute("logout","Logout!!");
		}
		
	}
	
	@RequestMapping(value="/logout",method={RequestMethod.GET,RequestMethod.POST})
	public void logout() {
		System.out.println("로그아웃 진입");
	}
	
}
