package com.kh.buffer.product.domain;

public class ProductVO {
	private int productNo;
	private String productName;
	private String brandName;
	private int price;
	private int servingSize;
	private String expiredDate;
	private String ageCode;
	private String gender;
	private String caution;
	private String description;
	private String description1;
	private String description2;
	private String description3;
	private String productFileName;
	private String productFileRename;
	private String productFilePath;
	private long productFileSize;
	private String ingredientCode;
	private String ingredientName;
	private String servingAmount;
	private String servingUnit;

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCaution() {
		return caution;
	}

	public void setCaution(String caution) {
		this.caution = caution;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDescription1() {
		return description1;
	}

	public void setDescription1(String description1) {
		this.description1 = description1;
	}

	public String getDescription2() {
		return description2;
	}

	public void setDescription2(String description2) {
		this.description2 = description2;
	}

	public String getDescription3() {
		return description3;
	}

	public void setDescription3(String description3) {
		this.description3 = description3;
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

	public String getIngredientCode() {
		return ingredientCode;
	}

	public void setIngredientCode(String ingredientCode) {
		this.ingredientCode = ingredientCode;
	}

	public String getIngredientName() {
		return ingredientName;
	}

	public void setIngredientName(String ingredientName) {
		this.ingredientName = ingredientName;
	}

	public String getServingAmount() {
		return servingAmount;
	}

	public void setServingAmount(String servingAmount) {
		this.servingAmount = servingAmount;
	}

	public String getServingUnit() {
		return servingUnit;
	}

	public void setServingUnit(String servingUnit) {
		this.servingUnit = servingUnit;
	}

	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", brandName=" + brandName
				+ ", price=" + price + ", servingSize=" + servingSize + ", expiredDate=" + expiredDate + ", ageCode="
				+ ageCode + ", gender=" + gender + ", caution=" + caution + ", description=" + description
				+ ", description1=" + description1 + ", description2=" + description2 + ", description3=" + description3
				+ ", productFileName=" + productFileName + ", productFileRename=" + productFileRename
				+ ", productFilePath=" + productFilePath + ", productFileSize=" + productFileSize + ", ingredientCode="
				+ ingredientCode + ", ingredientName=" + ingredientName + ", servingAmount=" + servingAmount
				+ ", servingUnit=" + servingUnit + "]";
	}


}