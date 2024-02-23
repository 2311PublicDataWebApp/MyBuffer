package com.kh.buffer.product.service;

import java.util.List;
import java.util.Map;

import com.kh.buffer.product.domain.IngredientVO;
import com.kh.buffer.product.domain.PageInfo;
import com.kh.buffer.product.domain.ProductVO;

public interface ProductService {

	/**
	 * 제품 리스트 Service
	 * @param pInfo
	 * @return pList
	 */
	List<ProductVO> selectProductList(PageInfo pInfo);

	/**
	 * 성분 리스트 Service
	 * @return iList
	 */
	List<IngredientVO> selectIngredientByNo(int productNo);
	
	/**
	 * 제품 코드 연동 Service
	 * @param productNo
	 * @return product
	 */
	ProductVO selectProductByNo(int productNo);
	
	/**
	 * 제품 검색 Service
	 * @param pInfo
	 * @param paramMap
	 * @return productList
	 */
	List<ProductVO> selectProductsByKeyword(PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 제품 입력 Service
	 * @param product
	 * @return result
	 */
	int insertProduct(ProductVO product);

	/**
	 * 제품 수정 Service
	 * @param productNo
	 * @return result
	 */
	int modifyProduct(ProductVO product);

	/**
	 * 제품 삭제 Service
	 * @param productNo
	 * @return result
	 */
	int deleteProduct(int productNo);

	/**
	 * 전체 제품 갯수 Service
	 * @return totalCount
	 */
	int getTotalCount();

	/**
	 * 검색 제품 갯수 Service
	 * @param paramMap
	 * @return totalCount
	 */
	int getTotalCount(Map<String, String> paramMap);


}