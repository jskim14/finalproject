package com.nb.spring.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Map<String, String>> selectBidderList(SqlSessionTemplate session, String productNo) {
	
		return session.selectList("product.selectBidderList",productNo);
		
	}

	@Override
	public int updateProductBuyNow(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.update("product.updateProductBuyNow", param);
	}

	@Override
	public List<Product> selectWaitingPermission(SqlSessionTemplate session,Map<String, Integer> param) {
		
		int cPage = param.get("cPage");
		int numPerPage = param.get("numPerPage");
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		
		return session.selectList("product.selectWaitingPermission",null,rb);
	}

	@Override
	public int selectWaitingCount(SqlSessionTemplate session) {
		
		return session.selectOne("product.selectWaitingCount");
	}
	
	@Override
	public List<Product> selectListDeadLine(SqlSessionTemplate session) {
		return session.selectList("product.selectListDeadLine");
	}
	
	@Override
	public List<Product> selectListLatest(SqlSessionTemplate session) {
		return session.selectList("product.selectListLatest");
	}

	@Override
	public int updateProductReject(SqlSessionTemplate session, Map<String, Object> param) {
		
		return session.update("product.updateProductReject", param);
	}

	@Override
	public int updateProductPermission(SqlSessionTemplate session, String productNo) {
		
		return session.update("product.updateProductPermission", productNo);
	}
	
}
