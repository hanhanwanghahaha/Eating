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
 * Servlet implementation class uinewsview
 */
@WebServlet("/uinewsview")
public class uinewsview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uinewsview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//接收参数id
		String id=request.getParameter("id");
		String strSql="select * from tbnews where id=?";
		
		//定义参数对象并且把接收到的id附加到对象上。
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		//定义一个数据库操作类对象。
		DBHelper dal=new DBHelper();
		//使用数据库操作对象查询数据库，并且把查询的结果保存到objbyid对象中。
		Map<String, Object> objbyid =dal.getSingleObject(strSql, params);
		//把objbyid这个对象附加到request对象上
		request.setAttribute("objbyid", objbyid);
		//重定向到前端的jsp页面，并且把查询结果也传递过去。
		request.getRequestDispatcher("newsview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

}
