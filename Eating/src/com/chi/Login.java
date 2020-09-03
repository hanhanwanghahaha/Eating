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

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String username=request.getParameter("username");
		String mima=request.getParameter("mima");
		DBHelper Dal=new DBHelper();
		String strSql="select * from manager where username='"+username+"' and mima='"+mima+"' ";
		List<Object> params = new ArrayList<Object>();	
		List<Map<String, Object>> datalist = null;
		try {
			datalist=Dal.executeQuery(strSql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(datalist.size()>0)
		{
			request.getSession().setAttribute("currentuser", datalist.get(0));
			request.getSession().setAttribute("id", datalist.get(0));
			response.sendRedirect("/Eating/admin/default.jsp");
		}
		else {
			request.setAttribute("msg", "用户名或密码错误！");
			request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
			
		}
			
	}

}

