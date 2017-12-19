package com.xt.java.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.xt.java.DBUtil.DBUtil;

public class AdminService {

	//管理员登录
	public boolean checkLogin(String admin_ID, String admin_PW){
		Connection conn = null;
		PreparedStatement  ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getDBConn();
			
			ps = conn.prepareStatement("select * from admin where admin_ID = ? and admin_Password = password(?)");
			ps.setString(1, admin_ID);
			ps.setString(2, admin_PW);
			rs = ps.executeQuery();
			
			if(rs.next()){
				return true;
			}
		} catch (Exception e) {
			System.out.println("管理员登录出现异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//获得管理员信息
	public AdminInfo getAdminInfo(String admin_ID,String admin_PW){
		AdminInfo ui = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getDBConn();
			
			ps = conn.prepareStatement("select * from admin where admin_ID = ? and admin_Password = password(?)");
			ps.setString(1, admin_ID);
			ps.setString(2, admin_PW);
			rs = ps.executeQuery();
			if(rs.next()){
				ui = new AdminInfo();
				ui.setAdmin_ID(admin_ID);
				ui.setAdmin_Name(rs.getString("admin_Name"));
				ui.setAdmin_Level(rs.getString("admin_Level"));
			}
		} catch (Exception e) {
			System.out.println("用户登录出现异常" + e);
		}finally{
			DBUtil.close(conn);
		}
		return ui;
	}
	
	//修改管理员密码
	public boolean updatePW(String admin_ID,String admin_PW) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("update admin set admin_Password = password(?) where admin_ID = ?");
			ps.setString(1, admin_PW);
			ps.setString(2, admin_ID);
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("密码修改出现异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//获得末位管理员ID
	public String getLastID() throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			String sql = "select admin_ID from admin order by admin_ID desc limit 0,1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			while(rs.next()){
				
				return rs.getString("admin_ID");
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
	
	//添加管理员信息
	public boolean addAdmins(String admin_ID,String admin_Name,String admin_Gender,String admin_Age,String admin_Level,String admin_Password) throws Exception{
		
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("insert into admin values(?,?,?,?,?,password(?))");
			ps.setString(1, admin_ID);
			ps.setString(2, admin_Name);
			ps.setString(3, admin_Gender);
			ps.setInt(4, Integer.parseInt(admin_Age));
			ps.setString(5, admin_Level);
			ps.setString(6, admin_Password);
			
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
	
	//修改管理员信息
	public boolean updateAdmin(String admin_ID,String admin_Name,String admin_Gender,String admin_Age,String admin_Level) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("update admin set admin_Name = ?, admin_Gender = ?, admin_Age = ?, admin_Level = ? where admin_ID = ?");
			ps.setString(1, admin_Name);
			ps.setString(2, admin_Gender);
			ps.setInt(3, Integer.parseInt(admin_Age));
			ps.setString(4, admin_Level);
			ps.setString(5, admin_ID);
			
			if(ps.executeUpdate() > 0){
				return true;
			}
		} catch (SQLException e) {
			System.out.println("管理员数据修改异常" + e);
		}finally{
			DBUtil.close(conn);
			DBUtil.close(ps);
			DBUtil.close(rs);
		}
		return false;
	}
	
	//删除管理员信息
	public boolean delAdmin(String Admin_ID) throws Exception{
		Connection conn = DBUtil.getDBConn();
		PreparedStatement  ps = null;
		ResultSet rs = null;
		
		try {
			ps = conn.prepareStatement("delete from admin where Admin_ID = ?");
			ps.setString(1, Admin_ID);
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
