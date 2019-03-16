package com.pknu.blog.dto;

import org.apache.ibatis.type.Alias;

@Alias("memberAuthDto")
public class MemberAuthDto {
	private String userId;
	private String auth;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	@Override
	public String toString() {
		return "MemberAuthDto [userId=" + userId + ", auth=" + auth + "]";
	}
	
	
	
}
