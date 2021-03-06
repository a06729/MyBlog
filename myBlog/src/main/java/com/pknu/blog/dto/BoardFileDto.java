package com.pknu.blog.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("boardFileDto")
@Data
public class BoardFileDto {
	private int fileNum;
	private int boardNum;
	private String original_File_Name;
	private String stored_File_Name;
	private long file_Size;
	private String filePath;
	private String url;
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getOriginal_File_Name() {
		return original_File_Name;
	}
	public void setOriginal_File_Name(String original_File_Name) {
		this.original_File_Name = original_File_Name;
	}
	public String getStored_File_Name() {
		return stored_File_Name;
	}
	public void setStored_File_Name(String stored_File_Name) {
		this.stored_File_Name = stored_File_Name;
	}
	public long getFile_Size() {
		return file_Size;
	}
	public void setFile_Size(long file_Size) {
		this.file_Size = file_Size;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "BoardFileDto [fileNum=" + fileNum + ", boardNum=" + boardNum + ", original_File_Name="
				+ original_File_Name + ", stored_File_Name=" + stored_File_Name + ", file_Size=" + file_Size
				+ ", filePath=" + filePath + ", url=" + url + "]";
	}
	
	
}
