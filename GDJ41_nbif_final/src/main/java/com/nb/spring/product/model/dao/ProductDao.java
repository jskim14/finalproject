package com.nb.spring.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.product.model.vo.Product;

public interface ProductDao {

	Product selectOneProductNo(SqlSessionTemplate session, String productNo);
	
	int insertProduct(SqlSessionTemplate session, Product p);

}
