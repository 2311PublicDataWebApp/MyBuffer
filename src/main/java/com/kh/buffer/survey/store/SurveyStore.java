package com.kh.buffer.survey.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.OrderVO;
import com.kh.buffer.survey.domain.SurveyVO;

public interface SurveyStore {

	/**
	 * 추천 목록 조회 Store
	 * @param session
	 * @param survey
	 * @return pList
	 */
	List<ProductVO> submitSurvey(SqlSession session, SurveyVO survey);

	/**
	 * 주문정보 저장 Store
	 * @param session
	 * @param order
	 * @return int
	 */
	int insertOrder(SqlSession session, OrderVO order);

	/**
	 * 주문정보 조회 Store
	 * @param session
	 * @param orderNo
	 * @return order
	 */
	OrderVO selectOneByNo(SqlSession session, int orderNo);

	// 직전에 입력한 데이터 가져오기
	int getCurrVal(SqlSession session);

}