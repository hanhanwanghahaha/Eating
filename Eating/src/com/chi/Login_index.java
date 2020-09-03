package com.chi;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chi.DBHelper;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login_index")
public class Login_index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String loginname=request.getParameter("loginname");
		String password=request.getParameter("password");
		DBHelper Dal=new DBHelper();
		String strSql="select * from guestbook where loginname='"+loginname+"' and password='"+password+"' ";
		List<Object> params = new ArrayList<Object>();	
		List<Map<String, Object>> datalist = null;
		try {
			datalist=Dal.executeQuery(strSql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(datalist.size()>0)
		{
			request.getSession().setAttribute("userid", datalist.get(0));
			response.sendRedirect("Index");
		}
		else {
			request.setAttribute("msg", "用户名或密码错误！");
			request.getRequestDispatcher("/index_login.jsp").forward(request, response);
		}		
	}
}