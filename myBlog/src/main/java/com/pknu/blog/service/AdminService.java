package com.pknu.blog.service;

import java.util.List;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.Criteria;

public interface AdminService {

	int total(Criteria cri);

	List<BoardDto> getList(Criteria cri);

	void boardDelete(int boardNum);

}
