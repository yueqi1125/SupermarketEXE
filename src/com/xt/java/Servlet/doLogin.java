package com.xt.java.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xt.java.admin.AdminService;

/**
 * Servlet implementation class doLogin
 */
@WebServlet("/doLogin")
public class doLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String admin_ID = request.getParameter("admin_ID");
		String admin_PW = request.getParameter("admin_PW");
		
		Cookie IDCookie = new Cookie("ID",admin_ID);
    	IDCookie.setMaxAge(3*60);
    	response.addCookie(IDCookie);
    	Cookie pwdCookie = new Cookie("pwd",admin_PW);
    	pwdCookie.setMaxAge(3*60);
    	response.addCookie(pwdCookie);
		
		AdminService as = new AdminService();
		if(as.checkLogin(admin_ID, admin_PW)){
			
			session.setAttribute("USER_LOGIN_INFO", as.getAdminInfo(admin_ID,admin_PW));
			response.sendRedirect("views/admin/admin_main.jsp");
		}else{
			request.setAttribute("msg", "用户名或者密码错误,请重新输入！");
			request.getRequestDispatcher("views/login/admin_login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
