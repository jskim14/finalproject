package com.nb.spring.product.model.service;

import java.util.Map;

import com.nb.spring.product.model.vo.Product;

public interface ProductService {

	Product selectOneProductNo(String productNo);

	int updateBid(Map<String, String> param);

}
