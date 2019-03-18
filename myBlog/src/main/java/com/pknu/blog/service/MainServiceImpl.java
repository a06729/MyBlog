package com.pknu.blog.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.google.gson.JsonObject;
import com.pknu.blog.dao.MainDao;
import com.pknu.blog.dto.BoardFileDto;
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
	
	@Override
	public Map<String, Object> boardImage(BoardFileDto fileDto, HttpServletRequest req,MultipartFile upload,Map<String, Object> fileMap) {
		UUID uuid=UUID.randomUUID();
		String path=req.getSession().getServletContext().getRealPath(File.separator);
		
		String originFileName =upload.getOriginalFilename();
		String storedFileName=uuid+upload.getOriginalFilename();
		long fileSize=upload.getSize();
		
		String savePath=path+File.separator+"resources"+File.separator+"boardImages"+File.separator+storedFileName;
		String url=File.separator+"boardImages"+File.separator+storedFileName;
		
		System.out.println(savePath);
		
		File dir=new File(savePath);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		try {
		// mtFile.transferTo(new File(savePath); 이렇게도 가능
			upload.transferTo(dir);
			fileMap.put("uploaded", 1);
			fileMap.put("fileName", storedFileName);
			fileMap.put("url",url);
			
		}catch (IllegalStateException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		return fileMap;
	}

}
