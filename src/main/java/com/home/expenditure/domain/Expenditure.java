package com.home.expenditure.domain;

public class Expenditure {

	private String expenditureId;
	private Item item;
	private double quantity;
	private double amount;
	private Category category;
	private String purchaseDate;
	private Source source;

	public String getExpenditureId() {
		return expenditureId;
	}

	public void setExpenditureId(String expenditureId) {
		this.expenditureId = expenditureId;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public Source getSource() {
		return source;
	}

	public void setSource(Source source) {
		this.source = source;
	}

}
