package com.kh.buffer.survey.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.SurveyVO;
import com.kh.buffer.survey.store.SurveyStore;

@Repository
public class SurveyStoreImpl implements SurveyStore {

	@Override
	public List<ProductVO> submitSurvey(SqlSession session, SurveyVO survey) {
		List<ProductVO> pList = session.selectList("SurveyMapper.selectRecommendation", survey);
		return pList;
	}

}
