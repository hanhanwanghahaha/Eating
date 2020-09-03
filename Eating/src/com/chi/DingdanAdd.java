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

import com.chi.DBHelper;

/**
 * Servlet implementation class DingdanAdd
 */
@WebServlet("/DingdanAdd")
public class DingdanAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DingdanAdd() {
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
		 //设置接受参数的编码
		 request.setCharacterEncoding("utf-8"); 
		 //接受前端表单提交过来的参数
		 String j_sname=request.getParameter("sname"); 
		 String j_stel=request.getParameter("stel"); 
		 String j_saddress=request.getParameter("saddress"); 
		 String j_saddress2=request.getParameter("saddress2"); 
		 
		 
		 Date t=new Date();
	     SimpleDateFormat df1 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	     SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	     String orderid=df1.format(t);
	     String createtime=df2.format(t);
		    
	   //表2开始操做
		 
			
		 String sessionid=request.getSession().getId();
		    
		 String strSqlcarpros="select * from gouwuche where 1=1 ";
		 DBHelper db=new DBHelper();
		 List<Object> params1 = new ArrayList<Object>();
		 //params1.add(sessionid);
		 List<Map<String,Object>> carprolist=null;
	     try {
	    	carprolist=db.executeQuery(strSqlcarpros,params1);
		 } catch (SQLException e) {
			e.printStackTrace();
		 }
	     if(!(carprolist.size()>0))
	     {
	    	return;
	     }
	    int sum=0;
	    for (Map<String, Object> m : carprolist) {
	    	sum=sum+Integer.parseInt(m.get("price").toString())*Integer.parseInt(m.get("count").toString());//计算总价	    	
	    	String strSqlitems="insert into orderedfood (orderid,proid,cainame,price,count) values (?,?,?,?,?)";
	    	List<Object> paramsitems = new ArrayList<Object>();
	    	paramsitems.add(orderid);
	    	paramsitems.add(m.get("proid"));
	    	paramsitems.add(m.get("cainame"));
	    	paramsitems.add(m.get("price"));
	    	paramsitems.add(m.get("count"));
	    	db.excuteSql(strSqlitems, paramsitems);
	    }
	    sum+=2;
	    int j_sumprice=sum;
	    String j_orderid=orderid;
	    String j_ctime=createtime;
		 
		 
		 //表2操作结束    
		 
		 //构造一个参数对象，把要添加的数据都放到这个对象上。
		 List<Object> params = new ArrayList<Object>();
		 
		 String j_userid=request.getParameter("userid");
		 
		 
		 params.add(j_orderid);
		 params.add(j_sumprice);
		 params.add(j_sname);
		 params.add(j_stel);
		 params.add(j_saddress);
		 params.add(j_ctime);
		 params.add(j_userid);
		 params.add(j_saddress2);
		 
		 
		 //构造sql查询语句  该语句的功能是向数据库插入一条订单信息 用问号占位
		 String strSql="INSERT INTO ordered (orderid,sumprice,sname,stel,saddress,ctime,userid,saddress2) VALUES (?,?,?,?,?,?,?,?)";
		 
		 
		 //DBHelper是一个数据库操作的公共类，类里面封装了执行sql命令的方法。以后凡是要操作数据库的地方都需要new一个这个类的对象，通过这个对象去执行sql命令。
		 DBHelper Dal=new DBHelper();
		 Dal.excuteSql(strSql, params);
		 //告诉前端，后端已经把数据保存到了数据库
		 
		 
		 //表3开始操做
		 List<Object> params3 = new ArrayList<Object>();
		 String strSq3="DELETE  FROM gouwuche";
		 DBHelper Da3=new DBHelper();
		 Da3.excuteSql(strSq3, params3);
		 
		 //表3操作结束
		 response.setCharacterEncoding("utf-8");
		 response.setContentType("text/html;charset=utf-8");
		 response.getWriter().write("<font color='green'>保存成功,5秒之后发生跳转到新增页面继续发布</font>");
		 //5秒之后跳转到添加页面
        response.setHeader("Refresh", "0;URL="+request.getContextPath()+"/result.jsp");


		
		
	}

}
