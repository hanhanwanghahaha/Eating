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
import com.chi.Pager;

/**
 * Servlet implementation class uinewslist
 */
@WebServlet("/uinewslist")
public class uinewslist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uinewslist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 String typenname=request.getParameter("typenname"); 
		 String tbtypenname="";
			switch (typenname) {
				case "1":tbtypenname="学校公告";break;
				case "2":tbtypenname="菁菁校园";break;
				 
				 
			}
			
			
		int currentpage=1;//当前页码，默认查询第一页的数据
		try
		{
			String p=request.getParameter("p");//接收页码，参数p来自于分页控件，分页控件里面传递参数用的关键字就是p,所以这里接收也用p来接收
			currentpage = Integer.valueOf(p);//前面接收到的页码是字符串， 把页码转为数字类型
		}
		catch(Exception e){
			currentpage=1;//如果能接收到页码，那么查询到的时候就用接收到的页码，如果没有接收到页码，就默认查询第一页。
		}
		
		
		
		DBHelper Dal=new DBHelper();
		//查询全部数据，只有知道了总共多少条记录之后，才能够生成分页信息
		String strSql=" select id from tbnews order by id desc "; 
		
		if(!(typenname==null||typenname==""))
		{
			strSql=" select id from tbnews where tbtypenname='"+tbtypenname+"'order by id desc "; 
		}
		
		
		List<Map<String, Object>> listall = null;
		List<Object> params = new ArrayList<Object>();
		try {
			listall=Dal.executeQuery(strSql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		//要生成分页信息，就需要先new一个分页控件类的对象
		Pager pageobj=new Pager();
		pageobj.allrecordcount=listall.size();//通过listall.size()就获取到数据库表里面的记录的总数，给分页控件指定总的记录条数
		pageobj.pagesize=10;//给分页控件指定每页显示条数
		pageobj.currentpage=currentpage;//给分页控件指定当前的页码
		pageobj.urlname="";
		pageobj.w="typenname="+typenname;
		
		//分页查询
		int startindex=pageobj.pagesize*(pageobj.currentpage-1);//计算总共要跳过多少条记录 
		String strSqlpager=" select * from tbnews order by id desc limit "+startindex+","+pageobj.pagesize+""; //构造分页查询sql语句
		
		if(!(typenname==null||typenname==""))
		{
			strSqlpager=" select * from tbnews where tbtypenname='"+tbtypenname+"' order by id desc limit "+startindex+","+pageobj.pagesize+""; 
		}
		
		List<Map<String, Object>> listpage = null;
		try {
			listpage=Dal.executeQuery(strSqlpager, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		
		String pagestr=pageobj.GetPageInfo();//通过分页控件对象调用里面的GetPageInfo()获取到分页信息。
		
		request.setAttribute("pagestr", pagestr);//把分页信息附加到request对象上
		request.setAttribute("lists", listpage);//把分页的数据信息附加到request对象上
		request.getRequestDispatcher("newslist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
