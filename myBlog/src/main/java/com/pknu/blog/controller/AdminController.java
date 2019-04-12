package com.pknu.blog.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.PageDto;
import com.pknu.blog.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	public static final Logger log=LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	//어드민  글관리 페이지로 이동
	@GetMapping(value="/boardList")
	public String adminPage(Criteria cri,Model model) {
		int total=adminService.total(cri);
		List<BoardDto>boardList=adminService.getList(cri);
		
		log.info("total:"+total);
		
		model.addAttribute("boardDto",boardList);
		model.addAttribute("pageMaker",new PageDto(total, cri));
		
		return "adminPage";
	}
	@PostMapping("/boardDelete")
	@ResponseBody
	public int boardDelete(@RequestParam("boardNum")int boardNum) {
		log.info("boardNum:"+boardNum);
		adminService.boardDelete(boardNum);
		return boardNum;
	}
}
