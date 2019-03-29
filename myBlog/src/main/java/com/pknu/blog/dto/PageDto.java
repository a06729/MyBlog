package com.pknu.blog.dto;

import org.apache.ibatis.type.Alias;

@Alias("pageDto")
public class PageDto {
	private int startPage;
	private int endPage;
	private boolean prev,next;
	
	private int total;
	private Criteria cri;
	
	public PageDto(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;//마지막 페이지 구하는 공식
		this.startPage=this.endPage-9;
		
		int realEnd=(int)(Math.ceil(total*1.0/cri.getAmount()));
		
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		prev=this.startPage==1?false:true;
//		this.next=this.endPage<realEnd;
		this.next=this.endPage*cri.getAmount()>=total?false:true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageDto [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
	
	
	
}
