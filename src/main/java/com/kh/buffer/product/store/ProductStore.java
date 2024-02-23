package com.kh.buffer.product.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.buffer.product.domain.IngredientVO;
import com.kh.buffer.product.domain.PageInfo;
import com.kh.buffer.product.domain.ProductVO;

public interface ProductStore {

	/**
	 * 제품 입력 Service
	 * @param product
	 * @return result
	 */
	int insertProduct(SqlSession session, ProductVO product);

	/**
	 * 제품 수정 Service
	 * @param productNo
	 * @return result
	 */
	int modifyProduct(SqlSession session, ProductVO product);

	/**
	 * 제품 삭제 Service
	 * @param productNo
	 * @return result
	 */
	int deleteProduct(SqlSession session, int productNo);

	/**
	 * 제품 리스트 Service
	 * @param pInfo
	 * @return pList
	 */
	List<ProductVO> selectProductList(SqlSession session, PageInfo pInfo);

	/**
	 * 성분 리스트 Service
	 * @return iList
	 */
	List<IngredientVO> selectIngredientByNo(SqlSession session, int productNo);
	
	/**
	 * 제품코드 연동 Service
	 * @param productNo
	 * @return product
	 */
	ProductVO selectProductByNo(SqlSession session, int productNo);

	/**
	 * 전체 제품 갯수 Service
	 * @return totalCount
	 */
	int getTotalCount(SqlSession session);

	/**
	 * 검색 제품 갯수 Service
	 * @param paramMap
	 * @return totalCount
	 */
	int getTotalCount(SqlSession session, Map<String, String> paramMap);

	List<ProductVO> selectProductsByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap);



}