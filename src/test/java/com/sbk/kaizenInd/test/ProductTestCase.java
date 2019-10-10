package com.sbk.kaizenInd.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sbk.kaizenInd.dao.ProductDAO;
import com.sbk.kaizenInd.dto.Product;

public class ProductTestCase {

	   private static AnnotationConfigApplicationContext context;
	   
	   private static ProductDAO productDAO;
	   
	   private Product product;
	   
	   @BeforeClass
	   public static void init(){
		   context = new AnnotationConfigApplicationContext();
		   context.scan("com.sbk.kaizenInd");
		   context.refresh();
		   productDAO =  (ProductDAO) context.getBean("productDAO");
	   }
	   
	  /* @Test
	   public void testCRUDProduct(){
		   
		   // create operation
		   product = new Product();
		   
		   product.setName("Piston");
		   product.setMaterial("Steel");
		   product.setDescription("This is some description for Piston !");
		   product.setActive(true);
		   product.setCategoryId(2);
		   product.setSupplierId(1);
		   
		   assertEquals("Something went wrong while inserting a new product", true, productDAO.add(product));
		   
		   // reading and updating the category
		   product = productDAO.get(26);
		   product.setName("Test");
		   assertEquals("Something went wrong while updating the existing record!", true, productDAO.update(product));
		   
		   assertEquals("Something went wrong while deleting the existing record!", true, productDAO.detele(product));
		   
		   // list
		   assertEquals("Something went wrong while fetching the list of products!", 5, productDAO.list().size());
		   
	   }*/
	   
	   @Test
	   public void testListActiveProduct(){
		   assertEquals("Something went wrong while fetching the list of products!", 4, productDAO.listActiveProducts().size());
	   }
	   
	   @Test
	   public void testListActiveProductByCategory(){
		   assertEquals("Something went wrong while fetching the list of products!", 2, productDAO.listActiveProductsByCategory(2).size());
		   assertEquals("Something went wrong while fetching the list of products!", 2, productDAO.listActiveProductsByCategory(1).size());
	   }
	   
	   @Test
	   public void testGetLatestActiveProduct(){
		   assertEquals("Something went wrong while fetching the list of products!", 4, productDAO.getLatestActiveProducts(4).size());
	   }
	   
}
