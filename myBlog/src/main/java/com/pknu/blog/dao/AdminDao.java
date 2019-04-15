package com.pknu.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberAuthDto;
import com.pknu.blog.dto.MemberDto;

@Repository
public interface AdminDao {

	int total(Criteria cri);

	List<BoardDto> getList(Criteria cri);

	void boardDelete(int boardNum);

	int idTotal(Criteria cri);

	List<MemberDto> idList(Criteria cri);

	void IdDelete(String userId);

	void AuthChange(MemberAuthDto authDto);

}
