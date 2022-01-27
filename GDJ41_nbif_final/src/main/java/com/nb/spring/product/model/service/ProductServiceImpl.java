package com.nb.spring.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.product.model.dao.ProductDao;
import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private ProductDao dao;
	
	@Override
	public Product selectOneProductNo(String productNo) {
		
		Product product = dao.selectOneProductNo(session, productNo);
		return product;
	}
	
	@Override
	public int insertProduct(Product p) {
		int result = dao.insertProduct(session, p);
		if(result>0 && !p.getImages().isEmpty()) {
			try {
				for(ProductImage pi : p.getImages()) {
					pi.setProductNo(p.getProductNo());
					result = dao.insertProductImg(session, pi);
				}				
			} catch(RuntimeException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

}
