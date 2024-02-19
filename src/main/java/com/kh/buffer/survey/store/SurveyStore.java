package com.kh.buffer.survey.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.SurveyVO;

public interface SurveyStore {

	/**
	 * 추천 목록 조회
	 * @param session
	 * @param survey
	 * @return pList
	 */
	List<ProductVO> submitSurvey(SqlSession session, SurveyVO survey);

}