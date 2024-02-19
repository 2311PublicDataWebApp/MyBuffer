package com.kh.buffer.survey.domain;

public class SurveyVO {

	private String surveyGender;
	private String surveyAge;
	private String surveyDrink;
	private String surveyMonitor;
	private String surveySleep;
	private String surveyEye;
	private String surveyJang;
	private String surveySkin;
	private String surveyNail;
	private String surveyImmunity;

	public SurveyVO() {
		super();
	}

	public String getSurveyGender() {
		return surveyGender;
	}

	public void setSurveyGender(String surveyGender) {
		this.surveyGender = surveyGender;
	}

	public String getSurveyAge() {
		return surveyAge;
	}

	public void setSurveyAge(String surveyAge) {
		this.surveyAge = surveyAge;
	}

	public String getSurveyDrink() {
		return surveyDrink;
	}

	public void setSurveyDrink(String surveyDrink) {
		this.surveyDrink = surveyDrink;
	}

	public String getSurveyMonitor() {
		return surveyMonitor;
	}

	public void setSurveyMonitor(String surveyMonitor) {
		this.surveyMonitor = surveyMonitor;
	}

	public String getSurveySleep() {
		return surveySleep;
	}

	public void setSurveySleep(String surveySleep) {
		this.surveySleep = surveySleep;
	}

	public String getSurveyEye() {
		return surveyEye;
	}

	public void setSurveyEye(String surveyEye) {
		this.surveyEye = surveyEye;
	}

	public String getSurveyJang() {
		return surveyJang;
	}

	public void setSurveyJang(String surveyJang) {
		this.surveyJang = surveyJang;
	}

	public String getSurveySkin() {
		return surveySkin;
	}

	public void setSurveySkin(String surveySkin) {
		this.surveySkin = surveySkin;
	}

	public String getSurveyNail() {
		return surveyNail;
	}

	public void setSurveyNail(String surveyNail) {
		this.surveyNail = surveyNail;
	}

	public String getSurveyImmunity() {
		return surveyImmunity;
	}

	public void setSurveyImmunity(String surveyImmunity) {
		this.surveyImmunity = surveyImmunity;
	}

	@Override
	public String toString() {
		return "SurveyVO [surveyGender=" + surveyGender + ", surveyAge=" + surveyAge + ", surveyDrink=" + surveyDrink
				+ ", surveyMonitor=" + surveyMonitor + ", surveySleep=" + surveySleep + ", surveyEye=" + surveyEye
				+ ", surveyJang=" + surveyJang + ", surveySkin=" + surveySkin + ", surveyNail=" + surveyNail
				+ ", surveyImmunity=" + surveyImmunity + "]";
	}

}