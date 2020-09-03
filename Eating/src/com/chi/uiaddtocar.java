package com.chi;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class uiaddtocar
 */
@WebServlet("/uiaddtocar")
public class uiaddtocar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uiaddtocar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String strSql=" select * from gouwuche ";
		List<Map<String, Object>> listall = null;
		List<Object> params = new ArrayList<Object>();
		DBHelper Dal=new DBHelper();
		try {
			listall=Dal.executeQuery(strSql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("lists", listall);
		request.getRequestDispatcher("/shoppingcar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		DBHelper db=new DBHelper();
		String sessionid=request.getSession().getId();
		
		Boolean flag=false;
		
		
    	String StrSqlexist="select * from gouwuche where sessionid=? and proid=? ";
    	List<Map<String, Object>> carrecordlist = null;
    	List<Object> paramsexist = new ArrayList<Object>();
    	paramsexist.add(sessionid);
    	paramsexist.add(id);
    	
    	try {
			carrecordlist=db.executeQuery(StrSqlexist, paramsexist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	if(carrecordlist.size()>0)
    	{
    		flag=true;
    	}
    	
		if(flag)
		{
			//修改个数
			String strSql1="update gouwuche set count=count+1 where sessionid=? and proid=? ";
			List<Object> paramsupdate = new ArrayList<Object>();
			paramsupdate.add(sessionid);
			paramsupdate.add(id);
			db.excuteSql(strSql1, paramsupdate);
		}
		else
		{
			//根据id把商品信息查询出来。
			List<Object> params1 = new ArrayList<Object>();
			params1.add(id);
			String StrSqlpro="select * from food where id=?";
			Map<String, Object> obj=db.getSingleObject(StrSqlpro, params1);
			
			
			//新增
			String strSql2="insert into gouwuche (sessionid,cainame,proid,count,imgurl,price) values(?,?,?,?,?,?) ";
			List<Object> params2 = new ArrayList<Object>();
			params2.add(sessionid);
			params2.add(obj.get("cainame"));
			params2.add(id);
			params2.add(1);			 
			params2.add(obj.get("imgurl"));
			params2.add(obj.get("price"));
			db.excuteSql(strSql2, params2);
			
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write("{\"msg\":\"ok\"}");
		
	}

}
