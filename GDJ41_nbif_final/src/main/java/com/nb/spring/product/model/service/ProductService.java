package com.nb.spring.product.model.service;

import java.util.List;
import java.util.Map;

import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.Review;

public interface ProductService {

	Product selectOneProductNo(String productNo);
	
	int insertProduct(Product p);

	int updateBid(Map<String, String> param);

	List<Review> selectReview(String sellerNo);

	int insertWishList(Map<String, String> param);

	int selectWishList(Map<String, String> param);
	
	Product updateProduct(String productNo);
	
	int updateProductEnd(Product p);

	List<Product> selectListLatest(int startNum, int finishNum);
}
