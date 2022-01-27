package com.nb.spring.product.model.dao;

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
	public int insertProduct(SqlSessionTemplate session, Product p) {
		System.out.println("service : "+ p);
		return session.insert("product.insertProduct",p);
	}

}
