package com.kh.buffer.survey.domain;

import java.sql.Timestamp;

public class OrderVO {
	private int orderNo;
	private String memberId;
	private int productNo;
	private String howtoPay;
	private String depoName;
	private String acctNum;
	private String bankName;
	private Timestamp orderDate;
	private int price;

	public OrderVO() {
		super();
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getHowtoPay() {
		return howtoPay;
	}

	public void setHowtoPay(String howtoPay) {
		this.howtoPay = howtoPay;
	}

	public String getDepoName() {
		return depoName;
	}

	public void setDepoName(String depoName) {
		this.depoName = depoName;
	}

	public String getAcctNum() {
		return acctNum;
	}

	public void setAcctNum(String acctNum) {
		this.acctNum = acctNum;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", memberId=" + memberId + ", productNo=" + productNo + ", price="
				+ price + ", howtoPay=" + howtoPay + ", depoName=" + depoName + ", acctNum=" + acctNum + ", bankName="
				+ bankName + ", orderDate=" + orderDate + "]";
	}

}