package com.chi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chi.DBHelper;
/**
 * Servlet implementation class AdminAdd
 */
@WebServlet("/AdminAdd")
public class AdminAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAdd() {
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
		// TODO Auto-generated method stub
		
		 request.setCharacterEncoding("utf-8"); 
			
		 String j_username=request.getParameter("username"); 
		 String j_mima=request.getParameter("mima"); 
		 String j_truename=request.getParameter("truename");
		
		 
		 
		 List<Object> params = new ArrayList<Object>();
		 
		 params.add(j_username);
		 params.add(j_mima);
		 params.add(j_truename);
		 
		 
		 
		 String strSql="insert into manager (username,mima,truename) values (?,?,?)";
		 
		
		 DBHelper Dal=new DBHelper();
		 Dal.excuteSql(strSql, params);
		 
		 
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>保存成功,0秒之后发生跳转到新增页面继续发布</font>");
		
         response.setHeader("Refresh", "0;URL="+request.getContextPath()+"/admin/adminadd.jsp");

	}

}
