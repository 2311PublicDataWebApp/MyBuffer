package com.kh.buffer.product.domain;

public class ProductVO {
	private int productNo;
	private String productName;
	private String brandName;
	private int price;
	private int servingSize;
	private String expiredDate;
	private String ageCode;
	private String productFileName;
	private String productFileRename;
	private String productFilePath;
	private long productFileSize;

	public ProductVO() {

	}
	
	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getServingSize() {
		return servingSize;
	}

	public void setServingSize(int servingSize) {
		this.servingSize = servingSize;
	}

	public String getExpiredDate() {
		return expiredDate;
	}

	public void setExpiredDate(String expiredDate) {
		this.expiredDate = expiredDate;
	}

	public String getAgeCode() {
		return ageCode;
	}

	public void setAgeCode(String ageCode) {
		this.ageCode = ageCode;
	}

	public String getProductFileName() {
		return productFileName;
	}

	public void setProductFileName(String productFileName) {
		this.productFileName = productFileName;
	}

	public String getProductFileRename() {
		return productFileRename;
	}

	public void setProductFileRename(String productFileRename) {
		this.productFileRename = productFileRename;
	}

	public String getProductFilePath() {
		return productFilePath;
	}

	public void setProductFilePath(String productFilePath) {
		this.productFilePath = productFilePath;
	}

	public long getProductFileSize() {
		return productFileSize;
	}

	public void setProductFileSize(long productFileSize) {
		this.productFileSize = productFileSize;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", brandName=" + brandName
				+ ", price=" + price + ", servingSize=" + servingSize + ", expiredDate=" + expiredDate + ", ageCode="
				+ ageCode + ", productFileName=" + productFileName + ", productFileRename=" + productFileRename
				+ ", productFilePath=" + productFilePath + ", productFileSize=" + productFileSize + "]";
	}

}