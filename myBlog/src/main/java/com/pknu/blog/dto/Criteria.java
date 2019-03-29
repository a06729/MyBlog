package com.pknu.blog.dto;

import org.apache.ibatis.type.Alias;

@Alias("criteria")
public class Criteria {
	private int pageNum;//시작 페이지 번호 (1)
 	private int amount;//한페이지에 보여줄 양(10)
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
	
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
	
	
	
}
