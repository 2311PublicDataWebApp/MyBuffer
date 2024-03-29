package com.kh.buffer.product.store.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.buffer.product.domain.IngredientVO;
import com.kh.buffer.product.domain.PageInfo;
import com.kh.buffer.product.domain.ProductVO;
import com.kh.buffer.product.store.ProductStore;

@Repository
public class ProductStoreImpl implements ProductStore{

	/**
	 * 제품 리스트 Service
	 */
	@Override
	public List<ProductVO> selectProductList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowbound = new RowBounds(offset, limit);
		List<ProductVO> pList = session.selectList("ProductMapper.selectProductList", null, rowbound);
		return pList;
	}

	/**
	 * 성분 리스트 Service
	 */
	@Override
	public List<IngredientVO> selectIngredientByNo(SqlSession session, int productNo) {
		List<IngredientVO> iList = session.selectList("IngredientMapper.selectIngredientByNo", productNo);
		return iList;
	}
	
	/**
	 * 제품 코드 연동 Service
	 */
	@Override
	public ProductVO selectProductByNo(SqlSession session, int productNo) {
		ProductVO product = session.selectOne("ProductMapper.selectProductByNo", productNo);
		return product;
	}

	/**
	 * 제품 검색 Service
	 * @param pInfo
	 * @param paramMap
	 * @return productList
	 */
	@Override
	public List<ProductVO> selectProductsByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowbound = new RowBounds(offset, limit);
		List<ProductVO> pList = session.selectList("ProductMapper.selectProductsByKeyword", paramMap, rowbound);
		return pList;
	}

	/**
	 * 제품 입력 Service
	 */
	@Override
	public int insertProduct(SqlSession session, ProductVO product) {
		int result = session.insert("ProductMapper.insertProduct", product);
		result += session.insert("ProductMapper.insertProductImg", product);
		return result;
	}

	/**
	 * 제품 수정 Service
	 */
	@Override
	public int modifyProduct(SqlSession session, ProductVO product) {
		int result = session.update("ProductMapper.modifyProduct", product);
		result += session.update("ProductMapper.modifyProductImg", product);
		return result;
	}

	/**
	 * 제품 삭제 Service
	 */
	@Override
	public int deleteProduct(SqlSession session, int productNo) {
		int result = session.delete("ProductMapper.deleteProductImg", productNo);
		result += session.update("ProductMapper.deleteProduct", productNo);
		return result;
	}

	/**
	 * 전체 제품 갯수 Service
	 */
	@Override
	public int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("ProductMapper.selectTotalCount");
		return totalCount;
	}

	/**
	 * 검색 제품 갯수 Service
	 */
	@Override
	public int getTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("ProductMapper.selectSearchTotalCount", paramMap);
		return totalCount;
	}


}