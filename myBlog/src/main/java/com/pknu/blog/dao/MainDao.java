package com.pknu.blog.dao;

import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
@Repository
public interface MainDao {

	public void memberSing(Map<String, Object> memberMap);

	public void memberAuth(Map<String, Object> memberMap);

}
