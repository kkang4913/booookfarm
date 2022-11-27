package com.myweb.boookfarm.payment.model;

import oracle.sql.DATE;

public class OrderDTO {
	private String orderCode;
	private String bookCode;
	private String booktitle;
	private String quantity;
	private int useMileage;//사용
	private int saveMileage;//적립
	private int orderPrice;//결제금액
	private String memId;
	private String postalCode;
	private String address;
	private String detailAddress;
	private String phone;
	private int deliveryFee;
	private DATE regunddableDate;
	private DATE cancleDate;
	private DATE orderDate;
	
	public String getOrderCode() {
		return orderCode;
	}
	
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	
	public String getBookCode() {
		return bookCode;
	}
	
	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}
	
	public String getBooktitle() {
		return booktitle;
	}
	
	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}
	
	public String getQuantity() {
		return quantity;
	}
	
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public int getUseMileage() {
		return useMileage;
	}
	
	public void setUseMileage(int useMileage) {
		this.useMileage = useMileage;
	}
	
	public int getSaveMileage() {
		return saveMileage;
	}
	
	public void setSaveMileage(int saveMileage) {
		this.saveMileage = saveMileage;
	}
	
	public int getOrderPrice() {
		return orderPrice;
	}
	
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	
	public String getMemId() {
		return memId;
	}
	
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public String getPostalCode() {
		return postalCode;
	}
	
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDetailAddress() {
		return detailAddress;
	}
	
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getDeliveryFee() {
		return deliveryFee;
	}
	
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	
	public DATE getRegunddableDate() {
		return regunddableDate;
	}
	
	public void setRegunddableDate(DATE regunddableDate) {
		this.regunddableDate = regunddableDate;
	}
	
	public DATE getCancleDate() {
		return cancleDate;
	}
	
	public void setCancleDate(DATE cancleDate) {
		this.cancleDate = cancleDate;
	}
	
	public DATE getOrderDate() {
		return orderDate;
	}
	
	public void setOrderDate(DATE orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [orderCode=" + orderCode + ", bookCode=" + bookCode + ", booktitle=" + booktitle
				+ ", quantity=" + quantity + ", useMileage=" + useMileage + ", saveMileage=" + saveMileage
				+ ", orderPrice=" + orderPrice + ", memId=" + memId + ", postalCode=" + postalCode + ", address="
				+ address + ", detailAddress=" + detailAddress + ", phone=" + phone + ", deliveryFee=" + deliveryFee
				+ ", regunddableDate=" + regunddableDate + ", cancleDate=" + cancleDate + ", orderDate=" + orderDate
				+ "]";
	}
	
	
}
