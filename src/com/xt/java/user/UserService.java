package com.xt.java.user;

import java.sql.*;

import java.math.BigDecimal;

import com.xt.java.DBUtil.DBUtil;

public class UserService {
	
	//会员登录
	public boolean checkLogin(String user_ID, String user_PW) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("select * from user where user_ID = ? and user_Password = password(?)");
			ps.setString(1, user_ID);
			ps.setString(2, user_PW);
			rs = ps.executeQuery();
			
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("用户登录异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//获得会员登录信息
	public UserInfo getUserInfo(String user_Name,String user_PW) throws Exception{
		UserInfo ui = null;
		Connection conn = DBUtil.getDBConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement("select * from user where user_Name = ? and user_Password = password(?)");
			ps.setString(1, user_Name);
			ps.setString(2, user_PW);
			rs = ps.executeQuery();
			if(rs.next()){
				ui = new UserInfo();
				ui.setUser_Name(rs.getString("user_Name"));
				ui.setUser_Level(rs.getInt("user_Level"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(conn);
		}
		return ui;
	}
	
	//获得末位会员ID
	public String getLastID() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select user_ID from user order by user_ID desc limit 0,1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while(rs.next()){
				
				return rs.getString("user_ID");
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
	
	//添加会员信息
	public boolean addUser(String user_ID,String user_Name,String user_Gender, String user_Password,BigDecimal user_Money, int user_Integral, String user_Level) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("insert into user values(?,?,?,password(?),?,?,?)");
			ps.setString(1, user_ID);
			ps.setString(2, user_Name);
			ps.setString(3, user_Gender);
			ps.setString(4, user_Password);
			ps.setBigDecimal(5, user_Money);
			ps.setInt(6, user_Integral);
			ps.setString(7, user_Level);
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("会员信息注册异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//修改会员信息
	public boolean A_updateUser(String user_ID,String user_Name,String user_Gender) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("update user set user_Name = ?, user_Gender = ? where user_ID = ?");
			ps.setString(1, user_Name);
			ps.setString(2, user_Gender);
			ps.setString(3, user_ID);
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("用户信息修改异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//删除会员信息
	public boolean delUser(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("delete from user where user_ID = ?");
			ps.setString(1, user_ID);
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("会员信息删除异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//查询用户是否存在
	public boolean queUser(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from user where user_ID = " + user_ID;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("用户查询异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//查询用户余额
	public BigDecimal queMoney(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		BigDecimal user_Money = new BigDecimal("0.0");
		
		try {
			String sql = "select user_Money from user where user_ID = " + user_ID;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			if(rs.next()){
				user_Money = user_Money.add(rs.getBigDecimal(1));
				return user_Money;
			}
		} catch (SQLException e) {
			System.out.println("余额查询异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return new BigDecimal("0.0");
	}
	
	//查询用户积分
	public int queIntegral(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select user_Integral from user where user_ID = " + user_ID;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			if(rs.next()){
				
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("积分查询异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return 0;
	}
	
	//查询用户权限
	public String queLevel(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select user_Level from user where user_ID = " + user_ID;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			if(rs.next()){
				
				return rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("会员等级查询异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return null;
	}
	
	//充值
	public boolean Recharge(String user_ID,String Money) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		UserService us = new UserService();
		BigDecimal Money0 = new BigDecimal(Money);
		
		BigDecimal user_Money = us.queMoney(user_ID);
		user_Money = user_Money.add(Money0);
		
		int Integral = us.queIntegral(user_ID);
		int user_Integral = Integral + Integer.parseInt(Money);
		
		if((Integral < 200 && user_Integral >= 200) || (Integral < 1000 && user_Integral >= 1000) || (Integral < 5000 && user_Integral >= 5000)){
			us.LevelUp(user_ID);
		}
		try {
			ps = conn.prepareStatement("update user set user_Money = ?, user_Integral = ? where user_ID = ?");
			ps.setBigDecimal(1, user_Money);
			ps.setInt(2, user_Integral);
			ps.setString(3, user_ID);
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("充值异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//会员等级升级
	public void LevelUp(String user_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		UserService us = new UserService();
		String level = us.queLevel(user_ID);
		String user_Level = null;
		
		if("普通".equals(level)){
			user_Level = "白银";
		}else if("白银".equals(level)){
			user_Level = "黄金";
		}else{
			user_Level = "钻石";
		}
		
		try {
			ps = conn.prepareStatement("update user set user_Level = ? where user_ID = ?");
			ps.setString(1, user_Level);
			ps.setString(2, user_ID);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("会员等级升级异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
	}
	
	//会员消费余额修改
	public void payMoney(String user_ID, String Money) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		UserService us = new UserService();
		BigDecimal Money0 = new BigDecimal(Money);
		
		BigDecimal user_Money = us.queMoney(user_ID);
		user_Money = user_Money.subtract(Money0);
		
		try {
			ps = conn.prepareStatement("update user set user_Money = ? where user_ID = ?");
			ps.setBigDecimal(1, user_Money);
			ps.setString(2, user_ID);
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("会员消费余额修改异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
	}
}
