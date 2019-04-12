package com.pknu.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.blog.dao.AdminDao;
import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public int total(Criteria cri) {
		return adminDao.total(cri);
	}

	@Override
	public List<BoardDto> getList(Criteria cri) {
		return adminDao.getList(cri);
	}

	@Override
	public void boardDelete(int boardNum) {
		adminDao.boardDelete(boardNum);
		
	}
	
	
	
	
}
