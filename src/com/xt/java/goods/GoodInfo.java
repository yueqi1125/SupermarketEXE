package com.xt.java.goods;

public class GoodInfo {

	private String good_ID;
	
	private String good_Name;
	
	private String good_Kind;
	
	private int good_Pricein;
	
	private int good_Priceout;
	
	private int good_No = 0;

	public int getGood_No() {
		return good_No;
	}

	public void setGood_No(int good_No) {
		this.good_No = good_No;
	}

	public int getGood_Pricein() {
		return good_Pricein;
	}
	
	public void setGood_Pricein(int good_Pricein) {
		this.good_Pricein = good_Pricein;
	}
	
	public String getGood_Kind() {
		return good_Kind;
	}

	public void setGood_Kind(String good_Kind) {
		this.good_Kind = good_Kind;
	}

	public String getGood_ID() {
		return good_ID;
	}

	public void setGood_ID(String good_ID) {
		this.good_ID = good_ID;
	}

	public String getGood_Name() {
		return good_Name;
	}

	public void setGood_Name(String good_Name) {
		this.good_Name = good_Name;
	}

	public int getGood_Priceout() {
		return good_Priceout;
	}

	public void setGood_Priceout(int good_Priceout) {
		this.good_Priceout = good_Priceout;
	}
}
