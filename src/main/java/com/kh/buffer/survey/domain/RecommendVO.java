package com.kh.buffer.survey.domain;

import java.sql.Timestamp;

public class RecommendVO {
	private int surveyNo;
	private String memberId;
	private int productNo;
	private Timestamp surveyTime;

	public RecommendVO() {
		super();
	}

	public int getSurveyNo() {
		return surveyNo;
	}

	public void setSurveyNo(int surveyNo) {
		this.surveyNo = surveyNo;
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

	public Timestamp getSurveyTime() {
		return surveyTime;
	}

	public void setSurveyTime(Timestamp surveyTime) {
		this.surveyTime = surveyTime;
	}

	@Override
	public String toString() {
		return "RecommendVO [surveyNo=" + surveyNo + ", memberId=" + memberId + ", productNo=" + productNo
				+ ", surveyTime=" + surveyTime + "]";
	}

}
