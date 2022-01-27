package com.nb.spring.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;
@Repository
public class ProductDaoImpl implements ProductDao {


	@Override
	public Product selectOneProductNo(SqlSessionTemplate session, String productNo) {
		
		return session.selectOne("product.selectOneProductNo",productNo);
	}
	
	@Override
	public int insertProduct(SqlSessionTemplate session, Product p) {
		return session.insert("product.insertProduct",p);
	}

	@Override
	public int insertProductImg(SqlSessionTemplate session, ProductImage pi) {
		System.out.println(pi);
		return session.insert("product.insertProductImg",pi);
	}
}
