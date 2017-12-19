package com.xt.java.goods;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.math.BigDecimal;

import com.xt.java.DBUtil.DBUtil;

public class GoodService {
	
	GoodInfo gi = new GoodInfo();
	
	//添加商品信息
	public boolean addGood(String good_ID,String good_Name,String good_Kind,String good_Pricein,String good_Priceout,String good_No,String good_Info,String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		GoodService gs = new GoodService();
		if(!good_No.equals("0")){
			String info_Kind = "进货";
			gs.goodInfo(good_ID, good_Name, good_Kind, good_Priceout, good_Pricein, good_No, info_Kind, user_ID);
		}
		try {
			ps = conn.prepareStatement("insert into goods values(?,?,?,?,?,?,?)");
			ps.setString(1, good_ID);
			ps.setString(2, good_Name);
			ps.setString(3, good_Kind);
			ps.setInt(4, Integer.parseInt(good_Pricein));
			ps.setInt(5, Integer.parseInt(good_Priceout));
			ps.setInt(6, Integer.parseInt(good_No));
			ps.setInt(7, Integer.parseInt(good_Info));
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("商品信息添加异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//获得商品列表末位ID
	public String getLastID() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select good_ID from goods order by good_ID desc limit 0,1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while(rs.next()){
				
				return rs.getString("good_ID");
			}
		} catch (SQLException e) {
			System.out.println("末位ID获取异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return null;
	}
	
	//更新商品信息
	public boolean updateGood(String good_ID,String good_Name,String good_Kind,String good_Pricein,String good_Priceout,String good_No,String good_Info) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("update goods set good_Name = ?, good_Kind = ?, good_Priceout = ?, good_Info = ? where good_ID = ?");
			ps.setString(1, good_Name);
			ps.setString(2, good_Kind);
			ps.setInt(3, Integer.parseInt(good_Priceout));
			ps.setInt(4, Integer.parseInt(good_Info));
			ps.setString(5, good_ID);
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("数据修改异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//删除商品信息
	public boolean delGood(String good_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		GoodService gs = new GoodService();
		if(gs.getGoodInfo(good_ID).getGood_No() != 0){
			return false;
		}else{
			try {
				ps = conn.prepareStatement("delete from goods where good_ID = ?");
				ps.setString(1, good_ID);
				if(ps.executeUpdate() > 0){
					return true;
				}
			} catch (SQLException e) {
				System.out.println("数据删除异常" + e);
			}finally{
				DBUtil.close(conn);
				DBUtil.close(ps);
				DBUtil.close(rs);
			}
			return false;
		}
	}
	
	//获得新商品ID
	public String getNewInfoID() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select info_ID from goods_info order by info_ID desc limit 0,1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			String info_ID = "201700001";
			while(rs.next()){
				
				String info_ID_0 = "2017";
				String lastID =  rs.getString("info_ID");
				String info_ID_1 = lastID.substring(5);
				int No = Integer.parseInt(info_ID_1);
				No++;
				info_ID_1 = String.format("%05d", No);
				info_ID = info_ID_0 + info_ID_1; 
			}
			return info_ID;
		} catch (SQLException e) {
			System.out.println("商品进货末位ID获取异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return null;
	}
	
	//获得商品信息
	public GoodInfo getGoodInfo(String good_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		GoodInfo gi = new GoodInfo();
		
		try {
			String sql = "select * from goods where good_ID = " + good_ID;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while(rs.next()){
				gi.setGood_ID(good_ID);
				gi.setGood_Name(rs.getString(2));
				gi.setGood_Kind(rs.getString(3));
				gi.setGood_Pricein(rs.getInt(4));
				gi.setGood_Priceout(rs.getInt(5));
				gi.setGood_No(rs.getInt(6));
			}
		} catch (SQLException e) {
			System.out.println("商品信息获取异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return gi;
		
	}
	
	//添加账单信息
	public boolean goodInfo(String good_ID, String good_Name,String good_Kind,String good_Priceout, String good_Pricein, String good_No,String info_Kind,String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		GoodService gs = new GoodService();
		
		int Pricein = Integer.parseInt(good_Pricein);
		int Priceout = Integer.parseInt(good_Priceout);
		int No = Integer.parseInt(good_No);
		int money = 0;
		int profit = 0;
		BigDecimal Money = new BigDecimal("0.0");
		BigDecimal money_Spend = new BigDecimal("0.0");
		BigDecimal money_Income = new BigDecimal("0.0");
		BigDecimal money_Profit = new BigDecimal("0.0");
		
		if("进货".equals(info_Kind)){
			
			money = Pricein * No;
			Money = new BigDecimal(money);
			money_Spend = money_Spend.add(Money);
		}else{
			
			money = Priceout * No;
			profit = money - (Pricein * No);
			
			Money = new BigDecimal(money);
			BigDecimal Profit = new BigDecimal(profit);
			
			money_Income = money_Income.add(Money);
			money_Profit = money_Profit.add(Profit);
		}
		String info_ID = gs.getNewInfoID();
		
		Date date = new Date(new java.util.Date().getTime());
		
		gs.UpdateProfit(money_Spend, money_Income, money_Profit);
		
		try {
			ps = conn.prepareStatement("insert into goods_info values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, info_ID);
			ps.setString(2, good_ID);
			ps.setString(3, good_Name);
			ps.setString(4, good_Kind);
			ps.setInt(5, Pricein);
			ps.setInt(6, Integer.parseInt(good_Priceout));
			ps.setInt(7, No);
			ps.setString(8, info_Kind);
			ps.setBigDecimal(9, Money);
			ps.setDate(10, date);
			ps.setString(11,user_ID);
			
			if(ps.executeUpdate() > 0){
				if("进货".equals(info_Kind)){
					gs.Purchase_No(good_ID, good_No, good_Pricein);
					return true;
				}else{
					gs.payGoodNo(good_ID, good_No);
					return true;
				}
			}
		} catch (SQLException e) {
			System.out.println("账单信息添加异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//获得商品信息2
	public GoodInfo getInfo(String good_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from goods where good_ID = " + good_ID;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while(rs.next()){
				
				gi.setGood_ID(good_ID);
				gi.setGood_Name(rs.getString(2));
				gi.setGood_Kind(rs.getString(3));
				gi.setGood_Priceout(rs.getInt(5));
			}
		} catch (SQLException e) {
			System.out.println("商品信息获取异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return gi;
	}
	
	//获得收银列表批次
	public String getNewProbat() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select Pro_batches from user_goods order by Pro_batches desc limit 0,1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			String Probat = "001";
			while(rs.next()){
				
				String lastID =  rs.getString("Pro_batches");
				int No = Integer.parseInt(lastID);
				No++;
				Probat = String.format("%03d", No);
			}
			return Probat;
		} catch (SQLException e) {
			System.out.println("收银列表末位ID获取异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return null;
	}
	
	//添加收银列表
	public boolean addUserGood(String good_ID ,String good_No) throws Exception{
		GoodService gs = new GoodService();
		gi = gs.getInfo(good_ID);
		String Pro_bat = gs.getNewProbat();
		
		int Money = gi.getGood_Priceout() * Integer.parseInt(good_No);
		BigDecimal good_Money = new BigDecimal(Money);
		
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("insert into user_goods values(?,?,?,?,?,?,?)");
			ps.setString(1, Pro_bat);
			ps.setString(2, good_ID);
			ps.setString(3, gi.getGood_Name());
			ps.setString(4, gi.getGood_Kind());
			ps.setInt(5, gi.getGood_Priceout());
			ps.setInt(6, Integer.parseInt(good_No));
			ps.setBigDecimal(7, good_Money);
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("收银列表信息添加异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		
		return false;
	}
	
	//更新商品进货库存信息
	public void Purchase_No(String good_ID,String good_No,String good_Pricein) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		GoodService gs = new GoodService();
		int Number = gs.getGoodInfo(good_ID).getGood_No();
		Number = Number + Integer.parseInt(good_No);
		
		try {
			ps = conn.prepareStatement("update goods set good_No = ?, good_Pricein = ? where good_ID = ?");
			ps.setInt(1, Number);
			ps.setInt(2, Integer.parseInt(good_Pricein));
			ps.setString(3, good_ID);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("进货数量添加异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
	}
	
	//更新商品出售库存信息
	public void payGoodNo(String good_ID, String good_No) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		GoodService gs = new GoodService();
		int Number = gs.getGoodInfo(good_ID).getGood_No();
		
		Number = Number - Integer.parseInt(good_No);
		try {
			ps = conn.prepareStatement("update goods set good_No = ? where good_ID = ?");
			ps.setInt(1, Number);
			ps.setString(2, good_ID);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("商品出售库存数量修改异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
	}
	
	//获得收银列表
	public boolean payGood(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		String info_Kind = "出售";
		GoodService gs = new GoodService();
		
		boolean payft = false;
		try {
			String sql1 = "select * from user_goods";
			ps = conn.prepareStatement(sql1);
			rs = ps.executeQuery(sql1);
			
			while(rs.next()){
				
				String good_ID =  rs.getString(2);
				String good_Name = rs.getString(3);
				String good_Kind = rs.getString(4);
				String good_Pricein = Integer.toString(gs.getGoodInfo(good_ID).getGood_Pricein());
				String good_Priceout = rs.getString(5);
				String good_No = rs.getString(6);
				
				if(gs.goodInfo(good_ID, good_Name, good_Kind, good_Priceout, good_Pricein, good_No, info_Kind, user_ID)){
					payft = true;
				}else{
					return false;
				}
			}
			return payft;
		} catch (SQLException e) {
			System.out.println("收银流程异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		
		return payft;
	}
	
	//删除全部收银列表
	public void delUserGoods() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = conn.prepareStatement("delete from user_goods where 1 = 1");
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("收银列表删除异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
	}
	
	//删除收银商品信息
	public void delUserGood(String Pro_batches) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = conn.prepareStatement("delete from user_goods where Pro_batches = ?");
			ps.setString(1, Pro_batches);
			ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("收银商品信息删除异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
	}
	
	//获得末位总账单信息
	public MoneyInfo getLastInfo() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		MoneyInfo mi = new MoneyInfo();
		try {
			String sql = "select * from money order by money_date desc limit 0,1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while(rs.next()){
				
				mi.setDate(rs.getDate(1));
				mi.setMoney_Spend(rs.getBigDecimal(2));
				mi.setMoney_Income(rs.getBigDecimal(3));
				mi.setMoney_Profit(rs.getBigDecimal(4));
			}
			return mi;
		} catch (SQLException e) {
			System.out.println("账单末位信息获取异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return null;
	}
	
	//更新总账单
	public void UpdateProfit(BigDecimal money_Spend,BigDecimal money_Income,BigDecimal money_Profit) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		GoodService gs = new GoodService();
		MoneyInfo mi = new MoneyInfo();
		
		BigDecimal money_Change = new BigDecimal("0.0");
		money_Change = money_Profit.subtract(money_Spend);
		mi = gs.getLastInfo();
		
		Date date = new Date(new java.util.Date().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String Date = sdf.format(date);
		String InfoDate = sdf.format(mi.getDate());
		
		if(Date.equals(InfoDate)){
			money_Spend = money_Spend.add(mi.getMoney_Spend());
			money_Income = money_Income.add(mi.getMoney_Income());
			money_Profit = money_Profit.add(mi.getMoney_Profit());
			money_Change = money_Profit.subtract(money_Spend);
			
			try {
				ps = conn.prepareStatement("update money set money_Spend = ? ,money_Income = ? ,money_Profit = ? ,money_Change = ? where money_date = ?");
				ps.setBigDecimal(1, money_Spend);
				ps.setBigDecimal(2, money_Income);
				ps.setBigDecimal(3, money_Profit);
				ps.setBigDecimal(4, money_Change);
				ps.setDate(5, date);
				ps.executeUpdate();
			} catch (SQLException e) {
				
				System.out.println("总账单修改异常" + e);
			} finally{
				DBUtil.close(conn);
				DBUtil.close(ps);
				DBUtil.close(rs);
			}
		}else{
			money_Change = money_Profit.subtract(money_Spend);
			
			try {
				ps = conn.prepareStatement("insert into money values(?,?,?,?,?)");
				ps.setDate(1, date);
				ps.setBigDecimal(2, money_Spend);
				ps.setBigDecimal(3, money_Income);
				ps.setBigDecimal(4, money_Profit);
				ps.setBigDecimal(5, money_Change);
				ps.executeUpdate();
			} catch (SQLException e) {
				
				System.out.println("总账单创建异常" + e);
			} finally{
				DBUtil.close(conn);
				DBUtil.close(ps);
				DBUtil.close(rs);
			}
		}
	}
}