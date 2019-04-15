package com.pknu.blog.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@Autowired(required=false)
	private JavaMailSender mailSender;

	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(Criteria cri,Model model) {
		int total=mainService.getTotal();
		List<BoardDto>boardList=mainService.getList(cri);
		
		log.info("total:"+total);
		
		model.addAttribute("boardDto",boardList);
		model.addAttribute("pageMaker",new PageDto(total, cri));
		
//		int searchCount=mainService.serchCount(cri);
//		List<BoardDto>boardList=mainService.serchList(cri);
//		
//		model.addAttribute("boarDto",boardList);
//		model.addAttribute("pageMaker",new PageDto(searchCount, cri));
		
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
	public String sing(MemberDto memberDto,MemberAuthDto memberAuthDto){
		mainService.memberSing(memberDto,memberAuthDto);
		return "redirect:/";
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
	
	//글삭제 
	@PostMapping("/boardDelete")
	public String boardDelete(@RequestParam("boardNum")int boardNum,
							  @ModelAttribute("cri")Criteria cri,RedirectAttributes rttr) {
		mainService.boardDelete(boardNum);
		
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("pageNum",cri.getAmount());
		return "redirect:/";
	}
	
	//글수정 페이지
	@GetMapping("/boardEditPage")
	public String boardEditPage(BoardDto boardDto,BoardFileDto BoardFileDto,Model model) {
		Map<String,Object>BoardMap=mainService.getBoardEdit(boardDto,BoardFileDto);
		
		model.addAttribute("boardDto",BoardMap.get("boardDto"));
//		model.addAttribute("attachFile",BoardMap.get("attachFile"));
		
		return "boardEditPage";
	}
	
	//글수정
	@PostMapping("/boardModify")
	public void boardModify(BoardDto boardDto,Principal principal) {
		mainService.boardModify(boardDto,principal);
	}
	
	//검색결과
	@GetMapping("/search")
	public String searchList(Criteria cri,Model model) {
		int searchCount=mainService.serchCount(cri);
		List<BoardDto>boardList=mainService.serchList(cri);
		
		model.addAttribute("boardDto",boardList);
		model.addAttribute("pageMaker",new PageDto(searchCount, cri));
		return "searchPage";
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
	
	//비밀번호 찾기 페이지로 이동
	@GetMapping("/passFindPage")
	public String passwordFindPage() {
		return "passwordFind";
	}
	
	//비밀번호 찾기 기능
	@PostMapping("/passFind")
	@ResponseBody
	public int passFind(@RequestParam("username")String username) {
		int idCount=mainService.IdFind(username);
		if(idCount<0) {
			log.info("아이디가 존재하지 않함");
		}else if (idCount>=1) {
			log.info("아이디가 존재함");
			UUID uuid=UUID.randomUUID();
			mainService.uuidInsert(username,uuid);
			String setFrom="a06729@gmail.com";
			String tomail=username;
			String title="비밀번호 변경 링크";
			String content=new StringBuffer().append("<a href='http://localhost:8080/passResetPage?uuid=").append(uuid).append("&username=").append(username).append("'target='_blenk''>비밀번호 초기화링크</a>").toString();
			//<a href=\"/passResetPage&uuid="+uuid+"\">비밀번호 변경</a>	
			try {
				MimeMessage message=mailSender.createMimeMessage();
				MimeMessageHelper messageHelper=new MimeMessageHelper(message,true,"UTF-8");
				messageHelper.setFrom(setFrom);//보내는사람 이메일
				messageHelper.setTo(tomail);//받는사람 이메일
				messageHelper.setSubject(title);//이메일 제목
				messageHelper.setText("<html><body>"+content+"</body></html>",true);//이메일 내용
				
				mailSender.send(message);
			}catch(Exception e){
				log.info("e:"+e);
			}
		}
		return idCount;
	}
	
	//비밀번호 초기화 페이지로 이동
	@RequestMapping(value="/passResetPage",method={RequestMethod.GET,RequestMethod.POST})
	public String resetPage(HttpServletRequest req,Model model) {
		String uuid=req.getParameter("uuid");
		String username=req.getParameter("username");
		boolean check=mainService.checkUsername(uuid,username);
		
		if(check==true) {
			log.info("비밀번호 초기화 페이지 이동");
			model.addAttribute("username",username);
			return "passResetPage";
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/passReset")
	public String passReset(@RequestParam("userPw")String userPw,
							@RequestParam("username")String username) {
		mainService.passReset(userPw,username);
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout",method={RequestMethod.GET,RequestMethod.POST})
	public void logout() {
		System.out.println("로그아웃 진입");
	}
	
}
