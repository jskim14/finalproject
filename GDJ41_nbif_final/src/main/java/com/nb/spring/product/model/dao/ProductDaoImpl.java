package com.nb.spring.product.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.product.model.vo.Product;
@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public Product selectOneProductNo(SqlSessionTemplate session, String productNo) {
		
		return session.selectOne("product.selectOneProductNo",productNo);
	}

	@Override
	public int updateBid(SqlSessionTemplate session, Map<String, String> param) {
		
		return session.update("product.updateBid", param);
	}

}
