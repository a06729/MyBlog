package com.pknu.blog.controller;

import java.util.logging.Logger;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.log.LogFactory;

import lombok.extern.log4j.Log4j;
@Log4j
@Controller
public class MainController {
	
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
	
	@GetMapping("/singup")
	public String singupPage() {
		return "singupPage";
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
