package com.nb.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;
import com.nb.spring.product.model.vo.Review;
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

	public int updateBid(SqlSessionTemplate session, Map<String, String> param) {
		
		return session.update("product.updateBid", param);
	}

	@Override
	public int insertProductImg(SqlSessionTemplate session, ProductImage pi) {
		System.out.println(pi);
		return session.insert("product.insertProductImg",pi);
	}

	@Override
	public List<Review> selectReview(SqlSessionTemplate session, String sellerNo) {
		
		return session.selectList("product.selectReview",sellerNo);
	}

	@Override
	public int insertWishList(SqlSessionTemplate session, Map<String, String> param) {
		
		return session.insert("product.insertWishList", param);
	}

	@Override
	public int selectWishList(SqlSessionTemplate session, Map<String, String> param) {
		
		return session.selectOne("product.selectWishList",param);
	}

	@Override
	public Product updateProduct(SqlSessionTemplate session, String productNo) {
		return session.selectOne("product.updateProduct",productNo);
	}

	@Override
	public int updateProductEnd(SqlSessionTemplate session, Product p) {
		return session.update("product.updateProductEnd",p);
	}

	@Override
	public int updateProductImg(SqlSessionTemplate session, ProductImage pi) {
		System.out.println(pi);
		return session.update("product.updateProductImg",pi);
	}
	
	@Override
	public List<Product> selectListLatest(SqlSessionTemplate session) {
		return session.selectList("product.selectListLatest");
	}
	
}
