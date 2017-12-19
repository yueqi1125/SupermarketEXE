package com.xt.java.goods;

import java.math.BigDecimal;
import java.sql.*;

public class MoneyInfo {

	private Date date = new Date(0);
	
	private BigDecimal money_Spend = new BigDecimal("0.0");
	
	private BigDecimal money_Income = new BigDecimal("0.0");
	
	private BigDecimal money_Profit = new BigDecimal("0.0");
	
	private BigDecimal money_Change = new BigDecimal("0.0");
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public Date getDate(){
		return date;
	}

	public BigDecimal getMoney_Spend() {
		return money_Spend;
	}

	public void setMoney_Spend(BigDecimal money_Spend) {
		this.money_Spend = money_Spend;
	}

	public BigDecimal getMoney_Income() {
		return money_Income;
	}

	public void setMoney_Income(BigDecimal money_Income) {
		this.money_Income = money_Income;
	}

	public BigDecimal getMoney_Profit() {
		return money_Profit;
	}

	public void setMoney_Profit(BigDecimal money_Profit) {
		this.money_Profit = money_Profit;
	}
	
	public BigDecimal getMoney_Change(){
		money_Change = money_Profit.subtract(money_Spend);
		return money_Change;
	}
}
