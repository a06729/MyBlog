package com.pknu.blog.dto;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Alias("boardDto")
@Data
public class BoardDto {
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private String sideTitle;
	private Date boardDate;
	private String userId;
	private String category;
	private String url;
	private List<BoardFileDto> attachList;
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<BoardFileDto> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<BoardFileDto> attachList) {
		this.attachList = attachList;
	}
	public String getSideTitle() {
		return sideTitle;
	}
	public void setSideTitle(String sideTitle) {
		this.sideTitle = sideTitle;
	}
	@Override
	public String toString() {
		return "BoardDto [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", sideTitle=" + sideTitle + ", boardDate=" + boardDate + ", userId=" + userId + ", category="
				+ category + ", url=" + url + ", attachList=" + attachList + "]";
	}
	
}
