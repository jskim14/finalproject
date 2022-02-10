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
	
	List<Product> selectListDeadLine(int startNum, int finishNum);

	List<Product> selectListLatest(int startNum, int finishNum);

	List<Map<String, String>> selectBidderList(String productNo);

	int updateProductBuyNow(Map<String, Object> param);

	List<Product> selectWaitingPermission(Map<String, Integer> param);

	int selectWaitingCount();

	int updateProductReject(Map<String, Object> param);

	int updateProductPermission(String productNo);
	
	int imgDelete(String productNo);
	
	int waitingDelete(String productNo);
	
	int shippingSelect(String productNo);
	
	int endSellRealTimeAction(Map<String,Object> param);

	int updateStatusFailure();

	Product selectOneSpecialProduct();
}
