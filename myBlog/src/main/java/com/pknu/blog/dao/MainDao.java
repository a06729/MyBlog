package com.pknu.blog.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.pknu.blog.dto.BoardDto;
import com.pknu.blog.dto.BoardFileDto;
import com.pknu.blog.dto.Criteria;
import com.pknu.blog.dto.MemberDto;

@Repository
public interface MainDao {

	public void memberSing(Map<String, Object> memberMap);

	public void memberAuth(Map<String, Object> memberMap);

	public MemberDto read(String userId);

	public void insertSelectKey(BoardDto boardDto);

	public void insertAttach(BoardFileDto attach);

	public int getTotla();

	public List<BoardDto> getBoard(Criteria cri);

	public BoardDto getContent(int boardNum);

	public void viewUp(int boardNum);

	public String selectName(String userId);

	public void boardDelete(int boardNum);

	public BoardDto getBoardEdit(BoardDto boardDto);

	public List<BoardFileDto> getAttachEdit(BoardFileDto boardFileDto);

	public void boardModify(BoardDto boardDto);

	public int serchCount(Criteria cri);

	public List<BoardDto> serchList(Criteria cri);


}
