package com.pknu.blog.dto;

import java.sql.Date;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.type.Alias;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Alias("memberDto")
@Data
public class MemberDto implements UserDetails{
	private String userId;
	private String userPw;
	private String userName;
	private Boolean ban;
	//https://sojw.tistory.com/1169742028 mybatis Illegal overloaded getter method
	//boolean 메소드에 동일한 getter 가 있을 경우(setter도 동일함 ,enabled이 지금 그럼) usersDetails를 구현할려면  db 테이블 이름 변경이 필요함
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
	public Boolean getBan() {
		return ban;
	}
	public void setBan(Boolean ban) {
		this.ban = ban;
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
	public List<MemberAuthDto> getAuthList() {
		return authList;
	}
	public void setAuthList(List<MemberAuthDto> authList) {
		this.authList = authList;
	}
	@Override
	public String toString() {
		return "MemberDto [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", ban=" + ban
				+ ", regdate=" + regdate + ", updateDate=" + updateDate + ", authList=" + authList + "]";
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authList.stream().map(
					auth -> new SimpleGrantedAuthority(auth.getAuth())
				).collect(Collectors.toList());
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return userPw;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userId;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return ban;
	}
	
	
	
	
	
}
