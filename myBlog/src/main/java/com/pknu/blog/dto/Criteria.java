package com.pknu.blog.dto;

import org.apache.ibatis.type.Alias;

@Alias("criteria")
public class Criteria {
	private int pageNum;//시작 페이지 번호 (1)
 	private int amount;//한페이지에 보여줄 양(10)
 	
 	private String type;
 	private String keyword;
 	private String category;
 	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		if(pageNum<=0) {
			this.pageNum=1;
			return;
		}
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		if(amount<=0 || amount>100) {
			this.amount=10;
			return;
		}
		
		this.amount = amount;
	}
	
	public int getPageStart() {
		return (this.pageNum-1)*amount;
	}
	
 	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword
				+ ", category=" + category + "]";
	}

	public String[] getTypeArr() {
		return type==null?new String[] {}:type.split("");
	}
	
	
	
}
