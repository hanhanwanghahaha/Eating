package com.chi;

import java.io.IOException;

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
 * Servlet implementation class AddXinXi
 */
@WebServlet("/AddXinXi")
public class AddXinXi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddXinXi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String id=request.getParameter("id");  
		 String strSql="select * from food where id=?";
		 List<Object> params = new ArrayList<Object>();
		 params.add(id);
		 
		 DBHelper Dal=new DBHelper();
		 Map<String,Object> objbyid = null;
		  
		 objbyid=Dal.getSingleObject(strSql,params);
		 request.setAttribute("objbyid",objbyid );
		 request.getRequestDispatcher("shoppingcar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		 
		 
		 String j_cainame=request.getParameter("cainame"); 
		 String j_price=request.getParameter("price"); 		  
		 String j_id=request.getParameter("id");		 
		 List<Object> params = new ArrayList<Object>();
		  
		 params.add(j_cainame);
		 params.add(j_price);		  
		 params.add(j_id);
		
		 
		 String strSql="insert gouwuche set cainame=?,price=?,count=1 where id=?"; 
		
		 DBHelper Dal=new DBHelper();
		 Dal.excuteSql(strSql, params);
		 
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>添加成功,0秒之后发生跳转到新增页面继续发布</font>");
		 response.setHeader("Refresh", "0;URL="+request.getContextPath()+"index.jsp");
	}

}
