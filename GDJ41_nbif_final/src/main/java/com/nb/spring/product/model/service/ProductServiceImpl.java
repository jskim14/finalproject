package com.nb.spring.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nb.spring.product.model.dao.ProductDao;
import com.nb.spring.product.model.vo.Product;
import com.nb.spring.product.model.vo.ProductImage;
import com.nb.spring.product.model.vo.Review;
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

	@Override
	public int updateBid(Map<String, String> param) {
		int result = dao.updateBid(session,param);
		return result;
	}

	@Override
	public List<Review> selectReview(String sellerNo) {
		List<Review> list = dao.selectReview(session,sellerNo);
		return list;
	}

	@Override
	public int insertWishList(Map<String, String> param) {
		int result = dao.insertWishList(session, param);
		return result;
	}

	@Override
	public int selectWishList(Map<String, String> param) {
		int result = dao.selectWishList(session, param);
		return result;
	}

	@Override
	public Product updateProduct(String productNo) {
		Product p = dao.updateProduct(session, productNo);
		return p;
	}

	@Override
	public int updateProductEnd(Product p) {
		int result = dao.updateProductEnd(session, p);
		if(result>0 && !p.getImages().isEmpty()) {
			try {
				for(ProductImage pi : p.getImages()) {
					pi.setProductNo(p.getProductNo());
					result = dao.updateProductImg(session, pi);
				}				
			} catch(RuntimeException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	@Override
	public List<Product> selectListDeadLine(int startNum, int finishNum) {
		List<Product> result = new ArrayList<Product>();
		List<Product> list = dao.selectListDeadLine(session);
		if(list.size()>finishNum) {
			for(int i=startNum; i<=finishNum; i++) {
				Product p = list.get(i);
				result.add(p);
			}
		}else if(list.size()<=startNum){
			result = null;
		}else {
			for(int i=startNum; i<list.size(); i++) {
				Product p = list.get(i);
				result.add(p);
			}
		}
		return result;
	}

	@Override
	public List<Product> selectListLatest(int startNum, int finishNum) {
		List<Product> result = new ArrayList<Product>();
		List<Product> list = dao.selectListLatest(session);
		if(list.size()>finishNum) {
			for(int i=startNum; i<=finishNum; i++) {
				Product p = list.get(i);
				result.add(p);
			}
		}else if(list.size()<=startNum){
			result = null;
		}else {
			for(int i=startNum; i<list.size(); i++) {
				Product p = list.get(i);
				result.add(p);
			}
		}
		return result;
	}
	
	public List<Map<String, String>> selectBidderList(String productNo) {
		
		return dao.selectBidderList(session,productNo);
	}

	@Override
	public int updateProductBuyNow(Map<String, Object> param) {
		
		return dao.updateProductBuyNow(session,param);
	}

	@Override
	public List<Product> selectWaitingPermission(Map<String, Integer> param) {
		// TODO Auto-generated method stub
		return dao.selectWaitingPermission(session,param);
	}

	@Override
	public int selectWaitingCount() {
	
		return dao.selectWaitingCount(session);
	}

	@Override
	public int updateProductReject(Map<String, Object> param) {
		
		return dao.updateProductReject(session,param);
	}

	@Override
	public int updateProductPermission(String productNo) {
		
		return dao.updateProductPermission(session,productNo);
	}

}
