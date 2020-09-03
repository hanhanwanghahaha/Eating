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
 * Servlet implementation class ZhuCe
 */
@WebServlet("/ZhuCe")
public class ZhuCe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZhuCe() {
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
		
		 String j_loginname=request.getParameter("loginname"); 
		 String j_password=request.getParameter("password"); 
		 String j_tel=request.getParameter("tel");
		 
		 String username=request.getParameter("loginname");
		 
		 List<Object> params = new ArrayList<Object>();
		 params.add(username);
		 
		 String strSql="select * from guestbook where loginname=?";
		 
		 DBHelper Dal=new DBHelper();
		
		 List<Map<String, Object>> datalist = null;
		 try {
			 datalist=Dal.executeQuery(strSql, params);
		 } catch (SQLException e) {
			 // TODO Auto-generated catch block
			 e.printStackTrace();
		 }
		 if(datalist.size()>0)
		 {
			 request.setAttribute("msg", "用户名已存在，请更换用户名！");
			 request.getRequestDispatcher("zhuce.jsp").forward(request, response);
			
		 }
		 else {
			 List<Object> params1 = new ArrayList<Object>();
			 
			 params1.add(j_loginname);
			 params1.add(j_password);
			 params1.add(j_tel);
			 
			 
			 
			 String strSql1="insert into guestbook (loginname,password,tel) values (?,?,?)";
			 
			
			 DBHelper Dal1=new DBHelper();
			 Dal1.excuteSql(strSql1, params1);
			 response.setCharacterEncoding("utf-8");
			 response.setContentType("text/html;charset=utf-8");
			 //response.sendRedirect("/Eating/loading.jsp");
			
			 response.setHeader("Refresh", "0;URL="+request.getContextPath()+"/index_login.jsp");
		}			 
	}

}
