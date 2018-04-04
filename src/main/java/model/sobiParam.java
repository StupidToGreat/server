package model;

import java.util.Date;

public class sobiParam {
	private Date sobiDate;
	private int balance;
	private String cateName; 
	private int cateCount;
	
	public Date getSobiDate() {
		return sobiDate;
	}
	public void setSobiDate(Date sobiDate) {
		this.sobiDate = sobiDate;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public int getCateCount() {
		return cateCount;
	}
	public void setCateCount(int cateCount) {
		this.cateCount = cateCount;
	}
	@Override
	public String toString() {
		return "sobiParam [sobiDate=" + sobiDate + ", balance=" + balance + ", cateName=" + cateName + ", cateCount="
				+ cateCount + "]";
	}
	
	       
	  
	
}
 