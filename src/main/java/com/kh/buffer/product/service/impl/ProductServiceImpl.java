package com.kh.buffer.product.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.buffer.product.domain.IngredientVO;
import com.kh.buffer.product.domain.PageInfo;
import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.product.service.ProductService;
import com.kh.buffer.product.store.ProductStore;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductStore pStore;
	@Autowired
	private SqlSession session;

	/**
	 * 제품 입력 Service
	 */
	@Override
	public int insertProduct(ProductVO product) {
		int result = pStore.insertProduct(session, product);
		return result;
	}

	/**
	 * 제품 수정 Service
	 */
	@Override
	public int modifyProduct(ProductVO product) {
		int result = pStore.modifyProduct(session, product);
		return result;
	}

	/**
	 * 제품 삭제 Service
	 */
	@Override
	public int deleteProduct(int productNo) {
		int result = pStore.deleteProduct(session, productNo);
		return result;
	}

	/**
	 * 제품 리스트 Service
	 */
	@Override
	public List<ProductVO> selectProductList(PageInfo pInfo) {
		List<ProductVO> pList = pStore.selectProductList(session, pInfo);
		return pList;
	}

	/**
	 * 성분 리스트 Service
	 */
	@Override
	public List<IngredientVO> selectIngredientByNo(int productNo) {
		List<IngredientVO> iList = pStore.selectIngredientByNo(session, productNo);
		return iList;
	}
	
	/**
	 * 제품코드 연동 Service
	 */
	@Override
	public ProductVO selectProductByNo(int productNo) {
		ProductVO product = pStore.selectProductByNo(session, productNo);
		return product;
	}

	/**
	 * 전체 제품 갯수 Service
	 */
	@Override
	public int getTotalCount() {
		int totalCount = pStore.getTotalCount(session);
		return totalCount;
	}


}