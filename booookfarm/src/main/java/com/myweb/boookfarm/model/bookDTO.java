package com.myweb.boookfarm.model;

import java.sql.Date;

public class bookDTO {
	private String bookCode;
	private String bookTitle;
	private String bookAutor;
	private String bookInfo;
	private int bookPrice;
	private int bookDiscount;
	private String isnb;
	private String bookCategory;
	private int stock;
	private String publisher;
	private String bookCondition;
	private String bookConditionInfo;
	private String bookImgPath;
	private Date createDate;
	
	
	@Override
	public String toString() {
		return "bookDTO [bookCode=" + bookCode + ", bookTitle=" + bookTitle + ", bookAutor=" + bookAutor + ", bookInfo="
				+ bookInfo + ", bookPrice=" + bookPrice + ", bookDiscount=" + bookDiscount + ", isnb=" + isnb
				+ ", bookCategory=" + bookCategory + ", stock=" + stock + ", publisher=" + publisher
				+ ", bookCondition=" + bookCondition + ", bookConditionInfo=" + bookConditionInfo + ", bookImgPath="
				+ bookImgPath + ", createDate=" + createDate + "]";
	}
	
	public String getBookCode() {
		return bookCode;
	}
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookAutor() {
		return bookAutor;
	}
	public void setBookAutor(String bookAutor) {
		this.bookAutor = bookAutor;
	}
	public String getBookInfo() {
		return bookInfo;
	}
	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}
	public int getBookPrice() {
		return bookPrice;
	}
	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}
	public int getBookDiscount() {
		return bookDiscount;
	}
	public void setBookDiscount(int bookDiscount) {
		this.bookDiscount = bookDiscount;
	}
	public String getIsnb() {
		return isnb;
	}
	public void setIsnb(String isnb) {
		this.isnb = isnb;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getBookCondition() {
		return bookCondition;
	}
	public void setBookCondition(String bookCondition) {
		this.bookCondition = bookCondition;
	}
	public String getBookConditionInfo() {
		return bookConditionInfo;
	}
	public void setBookConditionInfo(String bookConditionInfo) {
		this.bookConditionInfo = bookConditionInfo;
	}
	public String getBookImgPath() {
		return bookImgPath;
	}
	public void setBookImgPath(String bookImgPath) {
		this.bookImgPath = bookImgPath;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
