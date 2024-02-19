package com.kh.buffer.survey.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.survey.domain.SurveyVO;
import com.kh.buffer.survey.service.SurveyService;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyService sService;
	
	@RequestMapping(value = "/survey/insert.do", method = RequestMethod.GET)
	public String showSurveyForm(Model model) {
		return "survey/insert";
	}
	
	@RequestMapping(value = "/survey/insert.do", method = RequestMethod.POST)
	public String submitSurvey(Model model
			, @ModelAttribute SurveyVO survey) {
		List<ProductVO> pList = sService.submitSurvey(survey);
		if (pList != null) {
			model.addAttribute("pList", pList);
		} else {
			
		}
		return "survey/recommendation";
	}
	
	@RequestMapping(value = "/survey/purchase.do", method = RequestMethod.GET)
	public String showPurchase(Model model) {
		return "survey/purchase";
	}
	
	@RequestMapping(value = "/survey/complete.do", method = RequestMethod.POST)
	public String showComplete() {
		return "";
	}
}
