package com.nb.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;
import com.nb.spring.product.model.vo.Review;

public interface ProductDao {

	Product selectOneProductNo(SqlSessionTemplate session, String productNo);
	
	int insertProduct(SqlSessionTemplate session, Product p);
	
	int insertProductImg(SqlSessionTemplate session, ProductImage pi);

	int updateBid(SqlSessionTemplate session, Map<String, String> param);

	List<Review> selectReview(SqlSessionTemplate session, String sellerNo);

	int insertWishList(SqlSessionTemplate session, Map<String, String> param);

	int selectWishList(SqlSessionTemplate session, Map<String, String> param);
	
	Product updateProduct(SqlSessionTemplate session, String productNo);
	
	int updateProductEnd(SqlSessionTemplate session, Product p);
	
	int updateProductImg(SqlSessionTemplate session, ProductImage pi);

	List<Map<String, String>> selectBidderList(SqlSessionTemplate session, String productNo);

	int updateProductBuyNow(SqlSessionTemplate session, Map<String, Object> param);

}
