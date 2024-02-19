package com.kh.buffer.survey.service;

import java.util.List;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.SurveyVO;

public interface SurveyService {

	/**
	 * 추천 목록 조회
	 * @param survey
	 * @return pList
	 */
	List<ProductVO> submitSurvey(SurveyVO survey);

}