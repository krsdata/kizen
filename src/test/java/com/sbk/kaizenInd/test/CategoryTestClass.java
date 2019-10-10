package com.sbk.kaizenInd.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sbk.kaizenInd.dao.CategoryDAO;
import com.sbk.kaizenInd.dto.Category;


public class CategoryTestClass {

	private static AnnotationConfigApplicationContext context;

    private static CategoryDAO categoryDAO;
	
	private Category category;
	
	@BeforeClass
	public static void init(){
		
		context = new AnnotationConfigApplicationContext();
		context.scan("com.sbk.kaizenInd");
		context.refresh();
		
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
		
	}
	
	/*@Test
	public void testAddCategory(){
		
		category = new Category();
		
		category.setName("Television");
		category.setDescription("This is description for television");
		category.setImageURL("CAT_1.png");
		
		assertEquals("successfully added a category inside the table!", true, categoryDAO.add(category));
	}*/
	
	/*@Test
	public void testGetCategory(){
		
		category = categoryDAO.get(1);
		
		assertEquals("successfully fetched a single category from the table!", "Television", category.getName());
	}*/
	
	/*@Test
	public void testUpdateCategory(){
		
		category = categoryDAO.get(1);
		
		category.setName("TV");
		
		assertEquals("successfully update a single category in the table!", true, categoryDAO.update(category));
	}*/
	
	/*@Test
	public void testDeleteCategory(){
		
		category = categoryDAO.get(1);
		
		assertEquals("successfully delete a single category in the table!", true, categoryDAO.delete(category));
	}*/
	
	/*@Test
	public void testListCategory(){
		
		assertEquals("successfully fetched the list categories from the table!", 0, categoryDAO.list().size());
	}*/
	
	@Test
	public void testCURDCategory(){
		
		// add operation
        category = new Category();
		
		category.setName("Laptop");
		category.setDescription("This is some description for laptop");
		category.setImageURL("CAT_1.png");
		
		assertEquals("successfully added a category inside the table!", true, categoryDAO.add(category));
		
		category = new Category();
		
		category.setName("Television");
		category.setDescription("This is some description for television");
		category.setImageURL("CAT_2.png");
		
		assertEquals("successfully added a category inside the table!", true, categoryDAO.add(category));
		
        // fetching and updating the category
		category = categoryDAO.get(2);
		
		category.setName("TV");
		
		assertEquals("successfully update a single category in the table!", true, categoryDAO.update(category));
		
		
		// delete the category
		assertEquals("successfully delete a single category in the table!", true, categoryDAO.delete(category));

        // fetching the list
		assertEquals("successfully fetched the list categories from the table!", 1, categoryDAO.list().size());		
		
	}
}
