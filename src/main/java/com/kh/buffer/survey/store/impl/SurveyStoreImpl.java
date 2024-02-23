package com.kh.buffer.survey.store.impl;

import java.util.ArrayList;
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
		List<String> iList = new ArrayList<String>();
		iList.add(survey.getSurveyDrink());
		iList.add(survey.getSurveyMonitor());
		iList.add(survey.getSurveySleep());
		iList.add(survey.getSurveyEye());
		iList.add(survey.getSurveyJang());
		iList.add(survey.getSurveySkin());
		iList.add(survey.getSurveyNail());
		iList.add(survey.getSurveyImmunity());
		List<ProductVO> pList = session.selectList("SurveyMapper.selectRecommendation", survey);
		for(String ingredient : iList) {
			survey.setSurveyDrink(ingredient);
			List<ProductVO> pList2 = session.selectList("SurveyMapper.selectRecommendation2", survey);
			for(ProductVO product : pList2) {
				int i = 0;
				if (!(pList.get(i).getProductNo() == product.getProductNo())) {
					pList.add(product);					
				}
				i++;
			}
		}
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
