package com.pknu.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.BoardFileDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;
import com.pknu.blog.dto.PageDto;
import com.pknu.blog.service.MainService;


@Controller
public class MainController {
	public static final Logger log=LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(Criteria cri,Model model) {
		int total=mainService.getTotal();
		List<BoardDto>boardList=mainService.getList(cri);
		
		System.out.println("total:"+total);
		
		model.addAttribute("boarDto",boardList);
		model.addAttribute("pageMaker",new PageDto(total, cri));
		
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
		mainService.memberSing(memberDto,memberAuthDto);
	}
	
	//게시판 글쓰기 페이지로 이동
	@GetMapping("/boardPage")
	public void boardPage() {
		
	}
	//게시판 글쓰기
	@PostMapping("/boardWrite")
	public String boardWrite(BoardDto boardDto,Principal principal){
		mainService.insertWrite(boardDto,principal);
//		System.out.println(boardDto.getBoardTitle());
//		System.out.println(boardDto.getSideTitle());
		return "redirect:/";
	}
	//이미지 업로드
	@RequestMapping(value="/imageFile",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public BoardFileDto boardImage(BoardDto boardDto,BoardFileDto fileDto,MultipartHttpServletRequest mtfRequest,
			HttpServletResponse res) {
		System.out.println("이미지 업로드");
		fileDto=mainService.boardImage(fileDto,mtfRequest);
		
		return fileDto;
	}
	
	//에디터 이미지 삭제버튼 누르면 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public BoardFileDto deleteFile(@RequestParam("src") String delsrc,HttpServletRequest req,BoardFileDto boardFileDto) {
		String date[]=delsrc.split("/");//split으로 '/'를 기준으로 나눈다.
		String stored_File_Name=date[4];//배열[4]번째에 stored_File_Name이 된다.
		int idx= stored_File_Name.indexOf("_");//stored_File_Name에서 '_'이글자 뒤에는 original_File_Name이 나온다.
		String original_File_Name=stored_File_Name.substring(idx+1);//'_'의 한칸뒤에는 original_File_Name이다
//		for(int i=0; i<date.length; i++) {
//			System.out.println("date["+i+"]:"+date[i]);
//		}

		return mainService.deletFile(date,original_File_Name,stored_File_Name,boardFileDto,req);
	}
	
	//게시판 글 보기
	@GetMapping("/contentPage")
	public String contentPage(HttpServletRequest req,HttpServletResponse res,
			                  @RequestParam("boardNum")int boardNum,Criteria cri,
			                  Model model,Principal principal) {
		BoardDto boardDto;
		boardDto=mainService.getContent(boardNum);
		
		Cookie[] cookies=req.getCookies();
		Cookie viewCookie=null;

		
		if(cookies!=null && cookies.length>0) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cookie"+boardNum)) {
					log.info("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie=cookies[i];
				}
				
			}
		}
		
		if(boardDto !=null) {
			
			if(viewCookie==null) {
				log.info("cookie 없음");
				
				Cookie newCookie=new Cookie("cookie"+boardNum,"|"+boardNum+"|");
				
				res.addCookie(newCookie);
				mainService.viewUp(boardNum);
			}else {
				log.info("cookie 있음");
				
				String value=viewCookie.getValue();
				
				log.info("cookie 값:"+value);
			}
			try {
				String pUserId=principal.getName();
				if(pUserId!=null && pUserId!="") {
					log.info("pUserId:"+pUserId);
					model.addAttribute("boardDto",boardDto);
					model.addAttribute("userId",principal.getName());
					model.addAttribute("cri",cri);
				}
			}catch (NullPointerException e) {
					log.info(e.getClass()+e.getMessage());
					model.addAttribute("boardDto",boardDto);
					model.addAttribute("cri",cri);
			}

		}
		
		return "contentPage";
	}
	@PostMapping("/boardDelete")
	public String boardDelete(@RequestParam("boardNum")int boardNum,
							  @ModelAttribute("cri")Criteria cri,RedirectAttributes rttr) {
		mainService.boardDelete(boardNum);
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("pageNum",cri.getAmount());
		return "redirect:/";
	}
	
	@GetMapping("/boardEditPage")
	public String boardEditPage(BoardDto boardDto,BoardFileDto BoardFileDto,Model model) {
		Map<String,Object>BoardMap=mainService.getBoardEdit(boardDto,BoardFileDto);
		
		model.addAttribute("boardDto",BoardMap.get("boardDto"));
//		model.addAttribute("attachFile",BoardMap.get("attachFile"));
		
		return "boardEditPage";
	}
	
	@PostMapping("/boardModify")
	public void boardModify(BoardDto boardDto,Principal principal) {
		mainService.boardModify(boardDto,principal);
	}
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth,Model model) {
		model.addAttribute("msg","Access Denied");
	}
	//로그인페이지로 이동
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
