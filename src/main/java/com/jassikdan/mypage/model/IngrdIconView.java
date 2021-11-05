package com.jassikdan.mypage.model;

public class IngrdIconView {
	
	//ingrdIhave 테이블에서 가져오는 정보
	private int id;
	private int ingrdId;
	private String expirationDate; //null 일 수 있다.
	private String amount;
	
	//ingrd 테이블에서 가져오는 정부
	private String name	;
	private String nameEng;
	private String sort;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIngrdId() {
		return ingrdId;
	}
	public void setIngrdId(int ingrdId) {
		this.ingrdId = ingrdId;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	 
}
