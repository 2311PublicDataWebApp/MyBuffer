package com.kh.buffer.survey.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.OrderVO;
import com.kh.buffer.survey.domain.SurveyVO;
import com.kh.buffer.survey.store.SurveyStore;

@Repository
public class SurveyStoreImpl implements SurveyStore {

	@Override
	public List<ProductVO> submitSurvey(SqlSession session, SurveyVO survey) {
		List<ProductVO> pList = session.selectList("SurveyMapper.selectRecommendation", survey);
		return pList;
	}

	@Override
	public int insertOrder(SqlSession session, OrderVO order) {
		int result = session.insert("SurveyMapper.insertOrder", order);
		return result;
	}

	@Override
	public OrderVO selectOneByNo(SqlSession session, int orderNo) {
		OrderVO orderOne = session.selectOne("SurveyMapper.selectOneByNo", orderNo);
		return orderOne;
	}

	@Override
	public int getCurrVal(SqlSession session) {
		int orderNum = session.selectOne("SurveyMapper.getCurrVal");
		return orderNum;
	}

}
