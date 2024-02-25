package com.kh.buffer.survey.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.buffer.member.domain.MemberVO;
import com.kh.buffer.member.service.MemberService;
import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.product.service.ProductService;
import com.kh.buffer.survey.domain.OrderVO;
import com.kh.buffer.survey.domain.RecommendVO;
import com.kh.buffer.survey.domain.SurveyVO;
import com.kh.buffer.survey.service.SurveyService;

@Controller
public class SurveyController {
	
	@Autowired
	private SurveyService sService;
	@Autowired
	private ProductService pService;
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "/survey/insert.do", method = RequestMethod.GET)
	public String showSurveyForm(Model model) {
		return "survey/insert";
	}
	
	@RequestMapping(value = "/survey/insert.do", method = RequestMethod.POST)
	public String submitSurvey(Model model
			, @ModelAttribute SurveyVO survey
			, HttpSession session) {
		try {
			List<ProductVO> pList = sService.submitSurvey(survey);
			if (pList != null) {
				for(ProductVO product : pList) {
					RecommendVO reco = new RecommendVO((String) session.getAttribute("memberId"), product.getProductNo());
					sService.insertRecommend(reco);
				}
				model.addAttribute("pList", pList);
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}			
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "survey/recommendation";
	}
	
	@RequestMapping(value = "/survey/purchase.do", method = RequestMethod.GET)
	public String showPurchase(String memberId, int productNo, Model model) {
		try {
			ProductVO product = pService.selectProductByNo(productNo);
			MemberVO member = mService.getOneById(memberId);
			if (product != null) {
				model.addAttribute("product", product);
				model.addAttribute("member", member);
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "survey/purchase";
	}
	
	@RequestMapping(value = "/survey/complete.do", method = RequestMethod.POST)
	public String showComplete(Model model, @ModelAttribute OrderVO order) {
		try {
			int result = sService.insertOrder(order);
			if (result > 0) {
				int orderNo = sService.getCurrVal();
				OrderVO orderOne = sService.selectOneByNo(orderNo);
				model.addAttribute("order", orderOne);
			} else {
				model.addAttribute("msg", "No Data Found");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "survey/complete";
	}
}
