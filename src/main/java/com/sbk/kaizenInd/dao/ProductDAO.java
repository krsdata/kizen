package com.sbk.kaizenInd.dao;

import java.util.List;

import com.sbk.kaizenInd.dto.Product;

public interface ProductDAO {

	Product get(int productId);
	List<Product> list();
	boolean add(Product product);
	boolean update(Product product);
    boolean detele(Product product);
	
	// business methods
	List<Product> listActiveProducts();
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> getLatestActiveProducts(int count);
}
