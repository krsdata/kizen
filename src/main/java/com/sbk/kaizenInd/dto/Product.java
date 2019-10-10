package com.sbk.kaizenInd.dto;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;


import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;



@Entity
public class Product {

	// private fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String code;
	
	@NotBlank(message = "Please enter the Product Name!")
	private String name;
	
	@NotBlank(message = "Please enter the Material!")
	private String material;
	
	@JsonIgnore
	@NotBlank(message = "Please enter the description for Product!")
	private String description;
	
	@Column(name = "is_active")
	private boolean active;
	
	@Column(name = "category_id")
	@JsonIgnore
	private int categoryId;
	
	@Column(name = "supplier_id")
	@JsonIgnore
	private int supplierId;
	
	private int views;
	
	
	@Transient
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	// default constructor
	public Product(){
		
		this.code = "PRD"+UUID.randomUUID().toString().substring(26).toUpperCase();
	}

	
	// setter and getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	
	// toString for debugging
	@Override
	public String toString() {
		return "Product [id=" + id + ", code=" + code + ", name=" + name + ", material=" + material + ", description="
				+ description + ", active=" + active + ", categoryId=" + categoryId + ", supplierId=" + supplierId
				+ ", views=" + views + ", file=" + file + "]";
	}
	
	
	
	
}
