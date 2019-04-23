package com.pknu.blog.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.pknu.blog.dao.MainDao;
import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.BoardFileDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

@Service
public class MainServiceImpl implements MainService {
	public static final Logger log=LoggerFactory.getLogger(MainServiceImpl.class);
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
	public int emailCheck(String userId) {
		return mainDao.emailCheck(userId);
	}

	

	@Override
	public int userNameCheck(String userName) {
		return mainDao.userNameCheck(userName);
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
			fileDto.setUrl(urlPath);;
			fileDto.setFilePath(savePath);
			fileDto.setOriginal_File_Name(originFileName);
			fileDto.setStored_File_Name(storedFileName);
			fileDto.setFile_Size(fileSize);
		}
		
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

	@Override
	public void insertWrite(BoardDto boardDto,Principal principal) {
		String userId=principal.getName();
		
		boardDto.setUserId(userId);
		boardDto.setUserName(mainDao.selectName(userId));
		
		mainDao.insertSelectKey(boardDto);	
		
		if(boardDto.getAttachList()==null||boardDto.getAttachList().size()<=0) {
			return;
		}
		boardDto.getAttachList().forEach(attach ->{
			attach.setBoardNum(boardDto.getBoardNum());
			mainDao.insertAttach(attach);
		});
	}
	
	@Override
	public void boardModify(BoardDto boardDto,Principal principal) {
		String userId=principal.getName();
		
		boardDto.setUserId(userId);
		boardDto.setUserName(mainDao.selectName(userId));
		
		mainDao.boardModify(boardDto);
		
		if(boardDto.getAttachList()==null||boardDto.getAttachList().size()<=0) {
			return;
		}
		boardDto.getAttachList().forEach(attach->{
			attach.setBoardNum(boardDto.getBoardNum());
			System.out.println("attach:"+attach);
			mainDao.insertAttach(attach);
		});
	}

	
	@Override
	public Map<String, Object> getBoardEdit(BoardDto boardDto,BoardFileDto boardFileDto) {	
		Map<String ,Object>BoardMap=new HashMap<>();
		
		boardDto=mainDao.getBoardEdit(boardDto);
		BoardMap.put("boardDto",boardDto);
		
//		boardFileDto.setBoardNum(boardDto.getBoardNum());
		
//		List<BoardFileDto>fileList=mainDao.getAttachEdit(boardFileDto);
		
//		boardDto.setAttachList(mainDao.getAttachEdit(boardFileDto));
		
//		System.out.println("fileList:"+boardDto.getAttachList());
		

//		BoardMap.put("attachFile", boardDto.getAttachList());		
	
		
		return BoardMap;
	}
	

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mainDao.getTotla();
	}

	@Override
	public List<BoardDto> getList(Criteria cri) {
		List<BoardDto>listBoard=mainDao.getBoard(cri);
		System.out.println("listBoard:"+listBoard);
		return listBoard;
	}
	
	@Override
	public void viewUp(int boardNum) {
		mainDao.viewUp(boardNum);
	}
	
	@Override
	public BoardDto getContent(int boardNum) {
		BoardDto boardDto;
		boardDto=mainDao.getContent(boardNum);
		return boardDto;
	}

	@Override
	public void boardDelete(int boardNum) {
		mainDao.boardDelete(boardNum);
		
	}

	@Override
	public int serchCount(Criteria cri) {
		return mainDao.serchCount(cri);
	}

	@Override
	public List<BoardDto> serchList(Criteria cri) {
		return mainDao.serchList(cri);
	}

	@Override
	public int IdFind(String username) {
		return mainDao.IdFind(username);
	}

	@Override
	public void uuidInsert(String username, UUID uuid) {
		Map<String ,Object>map=new HashMap<>();
		map.put("uuid",String.valueOf(uuid));
		map.put("username",username);
		mainDao.uuidInsert(map);
	}

	@Override
	public boolean checkUsername(String uuid, String username) {
		Map<String ,Object>map=new HashMap<>();
		map.put("uuid",uuid);
		map.put("username",username);
		int checkCount=mainDao.checkUsername(map);
			
		if(checkCount>0) {
			return true;
		}
		
		return false;
	}

	@Override
	public void passReset(String userPw,String username) {
		Map<String,Object>map=new HashMap<>();
		String Encoder=passwordEncoder.encode(userPw);
		map.put("Encoder", Encoder);
		map.put("username", username);
		mainDao.passReset(map);
		mainDao.deleteUUID(map);
	}

	@Override
	public int tagTotal(Criteria cri) {
		return mainDao.tagTotal(cri);
	}

	@Override
	public List<BoardDto> tagList(Criteria cri) {
		return mainDao.tagList(cri);
	}



	@Override
	public MemberDto getUserInfo(String userId) {
		return mainDao.getUserInfo(userId);
	}



	@Override
	public int changePass(String nowPass, String newPass,String userId) {
		Map<String,String>map=new HashMap<>();
		
		String newEncode=passwordEncoder.encode(newPass);
		map.put("userId", userId);
		map.put("newPass",newEncode);
		
		MemberDto checkPass=mainDao.checkPass(map);
		
		log.info("checkPass"+checkPass);
		
		if(passwordEncoder.matches(nowPass, checkPass.getUserPw())) {
			log.info("비밀번호 일치함 비밀번호 변경 실행");
			mainDao.changePass(map);
			return 1;//1은 참
		}else {
			return 0;//0은 거짓
		}
	}
	
	
	
	
	
	

}
