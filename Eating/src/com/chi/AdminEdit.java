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
 * Servlet implementation class AdminEdit
 */
@WebServlet("/AdminEdit")
public class AdminEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		
		String strSql="select * from manager where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		DBHelper dal=new DBHelper();
		Map<String, Object> objbyid = null;
		objbyid=dal.getSingleObject(strSql, params);
		request.setAttribute("objbyid",objbyid);
		request.getRequestDispatcher("/admin/adminedit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8"); 
		 
		 String j_username=request.getParameter("username"); 
		 String j_mima=request.getParameter("mima"); 
		 String j_truenamer=request.getParameter("truename"); 
		 String j_id=request.getParameter("id");
		
		 List<Object> params = new ArrayList<Object>();
		 
		 params.add(j_username);
		 params.add(j_mima);
		 params.add(j_truenamer);
		 params.add(j_id);
		 
		
		 String strSql="update manager set username=?,mima=?,truename=? where id=?";
		 
		 
		 DBHelper Dal=new DBHelper();
		 Dal.excuteSql(strSql, params);
		 
		 
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>保存成功,5秒之后发生跳转到新增页面继续发布</font>");

       response.setHeader("Refresh", "0;URL="+request.getContextPath()+"/AdminEdit?id="+j_id);
	}

}
