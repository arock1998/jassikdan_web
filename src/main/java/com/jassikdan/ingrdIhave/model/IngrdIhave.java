package com.jassikdan.ingrdIhave.model;

import java.util.Date;

public class IngrdIhave {
	
	private int id;
	private int userId;
	private int ingrdId;
	private String refrigeratorNum;
	private String expirationDate; // null 가능
	private String amount;
	private Date createdAt;
	private Date updatedAt;



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getIngrdId() {
		return ingrdId;
	}
	public void setIngrdId(int ingrdId) {
		this.ingrdId = ingrdId;
	}
	public String getRefrigeratorNum() {
		return refrigeratorNum;
	}
	public void setRefrigeratorNum(String refrigeratorNum) {
		this.refrigeratorNum = refrigeratorNum;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
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
