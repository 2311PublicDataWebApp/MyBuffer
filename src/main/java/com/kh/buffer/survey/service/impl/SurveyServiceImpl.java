package com.kh.buffer.survey.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.OrderVO;
import com.kh.buffer.survey.domain.SurveyVO;
import com.kh.buffer.survey.service.SurveyService;
import com.kh.buffer.survey.store.SurveyStore;

@Service
public class SurveyServiceImpl implements SurveyService {
	
	@Autowired
	private SurveyStore pStore;
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductVO> submitSurvey(SurveyVO survey) {
		List<ProductVO> pList = pStore.submitSurvey(session, survey);
		return pList;
	}

	@Override
	public int insertOrder(OrderVO order) {
		int result = pStore.insertOrder(session, order);
		return result;
	}

	@Override
	public OrderVO selectOneByNo(int orderNo) {
		OrderVO orderOne = pStore.selectOneByNo(session, orderNo);
		return orderOne;
	}

	@Override
	public int getCurrVal() {
		int orderNum = pStore.getCurrVal(session);
		return orderNum;
	}

}
