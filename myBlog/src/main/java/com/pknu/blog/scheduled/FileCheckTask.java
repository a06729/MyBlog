package com.pknu.blog.scheduled;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pknu.blog.dao.MainDao;
import com.pknu.blog.dto.BoardFileDto;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	public static final Logger log=LoggerFactory.getLogger(FileCheckTask.class);
	
	@Autowired
	MainDao mainDao;
	
	@Scheduled(cron="0 0 2 * * *")
	public void checkFiles() throws Exception{

		log.warn("File Check Task run ................");
		log.warn("=====================================");

		String path="C:\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\myBlog\\resources\\boardImages\\";
		
//		String savePath=path+File.separator+"resources"+File.separator+"boardImages"+File.separator;
		
		
		List<BoardFileDto>fileList=mainDao.getOldFiles();
		
		List<Path>fileListPaths=fileList.stream().map(
				vo -> Paths.get(vo.getFilePath())
				).collect(Collectors.toList());
		
		fileListPaths.forEach(p -> log.warn("p:"+p));
		
		File targetDir=Paths.get(path).toFile();//path경로의 모든 파일을 가져온다
		
		//removeFiles는 targetDir의 파일경로들중 fileListPaths(db에저장된 이미지 경로)와 비교하여 db에 없는 경로를 추출한다.
		File[] removeFiles=targetDir.listFiles(file -> fileListPaths.contains(file.toPath())==false);
		
		for(File file:removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
}
