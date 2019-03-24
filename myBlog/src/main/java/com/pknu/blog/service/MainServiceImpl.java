package com.pknu.blog.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public BoardFileDto boardImage(BoardFileDto fileDto,MultipartHttpServletRequest mtfRequest) {
		String path=mtfRequest.getSession().getServletContext().getRealPath(File.separator);
		List<MultipartFile> fileList=mtfRequest.getFiles("file");
		for(MultipartFile mf:fileList) {
			UUID uuid=UUID.randomUUID();
			
			String originFileName =mf.getOriginalFilename();
			String storedFileName=uuid+"_"+mf.getOriginalFilename();
			long fileSize=mf.getSize();
			String savePath=path+File.separator+"resources"+File.separator+"boardImages"+File.separator+storedFileName;
			String urlPath=File.separator+"boardImages"+File.separator+storedFileName;			
			File dir=new File(savePath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			try {
				// mtFile.transferTo(new File(savePath); 이렇게도 가능
					mf.transferTo(dir);
				}catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
			}
			fileDto.setUploaded(1);
			fileDto.setUrl(urlPath);;
			fileDto.setFilePath(savePath);
			fileDto.setOriginal_File_Name(originFileName);
			fileDto.setStored_File_Name(storedFileName);
			fileDto.setFile_Size(fileSize);
		}
		
//		String originFileName =upload.getOriginalFilename();
//		String storedFileName=uuid+upload.getOriginalFilename();
//		long fileSize=upload.getSize();
		
//		String savePath=path+File.separator+"resources"+File.separator+"boardImages"+File.separator+storedFileName;
//		String url=File.separator+"boardImages"+File.separator+storedFileName;
		
//		System.out.println(savePath);
		
//		File dir=new File(savePath);
		
//		if(!dir.exists()) {
//			dir.mkdirs();
//		}
//		try {
//		// mtFile.transferTo(new File(savePath); 이렇게도 가능
//			upload.transferTo(dir);
//			fileDto.setUploaded(1);
//			fileDto.setUrl(url);
//			fileDto.setFilePate(savePath);
//			fileDto.setOriginal_File_Name(originFileName);
//			fileDto.setStored_File_Name(storedFileName);
//			fileDto.setFile_Size(fileSize);
//			
//		}catch (IllegalStateException e) {
//			e.printStackTrace();
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
		
		
		return fileDto;
	}

	@Override
	public BoardFileDto deletFile(String[] date, String original_File_Name, String stored_File_Name,BoardFileDto boardFileDto ,HttpServletRequest req) {
		String path=req.getSession().getServletContext().getRealPath(File.separator)+File.separator+"resources"+File.separator+date[3]+File.separator+date[4];
		String urlPath=File.separator+"boardImages"+File.separator+date[4];
		
		
		File file=new File(path);
		boardFileDto.setOriginal_File_Name(original_File_Name);
		boardFileDto.setStored_File_Name(stored_File_Name);
		boardFileDto.setFilePath(path);
		boardFileDto.setUrl(urlPath);
		boardFileDto.setFile_Size(file.length());
		if(file.exists()) {
			file.delete();
		}
		return boardFileDto;
	}
	
	

}
