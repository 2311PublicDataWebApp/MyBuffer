package com.kh.buffer.survey.service;

import java.util.List;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.OrderVO;
import com.kh.buffer.survey.domain.SurveyVO;

public interface SurveyService {

	/**
	 * 추천 목록 조회 Service
	 * @param survey
	 * @return pList
	 */
	List<ProductVO> submitSurvey(SurveyVO survey);

	/**
	 * 주문정보 저장 Service
	 * @param order
	 * @return int
	 */
	int insertOrder(OrderVO order);

	/**
	 * 주문정보 조회 Service
	 * @param orderNo
	 * @return order
	 */
	OrderVO selectOneByNo(int orderNo);

	// 직전에 입력한 데이터 번호 가져오기
	int getCurrVal();

}