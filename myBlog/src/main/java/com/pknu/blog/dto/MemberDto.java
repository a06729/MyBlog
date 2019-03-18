package com.pknu.blog.dto;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("memberDto")
@Data
public class MemberDto {
	private String userId;
	private String userPw;
	private String userName;
	private Boolean enabled;
	
	private Date regdate;
	private Date updateDate;
	private List<MemberAuthDto>authList;
	
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
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public List<MemberAuthDto> getAuthList() {
		return authList;
	}
	public void setAuthList(List<MemberAuthDto> authList) {
		this.authList = authList;
	}
	@Override
	public String toString() {
		return "MemberDto [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", enabled=" + enabled
				+ ", regdate=" + regdate + ", updateDate=" + updateDate + ", authList=" + authList + "]";
	}
	
	
	
	
}
