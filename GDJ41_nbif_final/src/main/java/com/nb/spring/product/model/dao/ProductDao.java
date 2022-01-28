package com.nb.spring.product.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;

public interface ProductDao {

	Product selectOneProductNo(SqlSessionTemplate session, String productNo);
	
	int insertProduct(SqlSessionTemplate session, Product p);
	
	int insertProductImg(SqlSessionTemplate session, ProductImage pi);

	int updateBid(SqlSessionTemplate session, Map<String, String> param);

}
