package com.pknu.blog.service;

import java.util.List;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

public interface AdminService {

	int total(Criteria cri);

	List<BoardDto> getList(Criteria cri);

	void boardDelete(int boardNum);

	int idTotal(Criteria cri);

	List<MemberDto> idList(Criteria cri);

	void IdDelete(String userId);

	void AuthChange(MemberAuthDto authDto);

}
