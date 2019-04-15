package com.pknu.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pknu.blog.dao.AdminDao;
import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

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

	@Override
	public int idTotal(Criteria cri) {
		return adminDao.idTotal(cri);
	}

	@Override
	public List<MemberDto> idList(Criteria cri) {
		return adminDao.idList(cri);
	}

	@Override
	public void IdDelete(String userId) {
		adminDao.IdDelete(userId);
		
	}

	@Override
	public void AuthChange(MemberAuthDto authDto) {
		adminDao.AuthChange(authDto);
		
	}
	
	
	
	
	
}
