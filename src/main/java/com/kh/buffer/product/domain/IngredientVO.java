package com.kh.buffer.product.domain;

public class IngredientVO {
	private int productNo;
	private String ingredientCode;
	private String ingredientName;
	private String servingAmount;
	private String servingUnit;
	
	public IngredientVO() {
		
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
		return "IngredientVO [productNo=" + productNo + ", ingredientCode=" + ingredientCode + ", ingredientName="
				+ ingredientName + ", servingAmount=" + servingAmount + ", servingUnit=" + servingUnit + "]";
	}
	
	
}
