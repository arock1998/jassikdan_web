package com.jassikdan.recipeIngrd.model;

import java.util.Date;

public class RecipeIngrd {

	private int id;
	private int recipeId;
	private int ingrdId;
	private String ingrdName;
	private double amount;
	private String unit;
	private Date createdAt;
	private Date updatedAt;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRecipeId() {
		return recipeId;
	}
	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}
	public int getIngrdId() {
		return ingrdId;
	}
	public void setIngrdId(int ingrdId) {
		this.ingrdId = ingrdId;
	}
	public String getIngrdName() {
		return ingrdName;
	}
	public void setIngrdName(String ingrdName) {
		this.ingrdName = ingrdName;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
