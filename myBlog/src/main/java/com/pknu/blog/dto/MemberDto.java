package com.pknu.blog.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("memberDto")
public class MemberDto {
	private String userId;
	private String userPw;
	private String userName;
	private Date regdate;
	private Date updateDate;
	private String enabled;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	@Override
	public String toString() {
		return "MemberDto [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", regdate=" + regdate
				+ ", updateDate=" + updateDate + ", enabled=" + enabled + "]";
	}
	
	
}
