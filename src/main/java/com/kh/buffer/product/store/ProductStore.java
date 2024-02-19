package com.kh.buffer.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

}