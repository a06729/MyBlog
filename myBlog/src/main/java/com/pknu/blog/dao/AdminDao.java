package com.pknu.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;

@Repository
public interface AdminDao {

	int total(Criteria cri);

	List<BoardDto> getList(Criteria cri);

	void boardDelete(int boardNum);

}
