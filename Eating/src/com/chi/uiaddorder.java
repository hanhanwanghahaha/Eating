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
 * Servlet implementation class uiaddorder
 */
@WebServlet("/uiaddorder")
public class uiaddorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uiaddorder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		     
	}

	public String getDateFormat(){
	    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    return df.format(new Date()); }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> obj=(Map<String,Object>)request.getSession().getAttribute("currentmember");	
		String memberid=obj.get("id").toString();
		String tbname=request.getParameter("tbname");
		String tbtel=request.getParameter("tbtel");
		String tbaddress=request.getParameter("tbaddress");
	    String sessionid=request.getSession().getId();
	    
	    String strSqlcarpros="select * from gouwuche where sessionid=? ";
	    DBHelper db=new DBHelper();
	    List<Object> params = new ArrayList<Object>();
	    params.add(sessionid);
	    List<Map<String,Object>> carprolist=null;
	    try {
	    	carprolist=db.executeQuery(strSqlcarpros,params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    if(!(carprolist.size()>0))
	    {
	    	return;
	    }
	    	    
	    Date t=new Date();
	    SimpleDateFormat df1 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	    SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String orderid=df1.format(t);
	    String createtime=df2.format(t);

	    int sum=0;
	    for (Map<String, Object> m : carprolist) {
	    	sum=sum+Integer.parseInt(m.get("price").toString())*Integer.parseInt(m.get("count").toString());//鍟嗗搧鍗曚环*鍟嗗搧涓暟
	    	
	    	String strSqlitems="insert into orderedfood (orderid,proid,cainame,price,count) values (?,?,?,?,?)";
	    	List<Object> paramsitems = new ArrayList<Object>();
	    	paramsitems.add(orderid);
	    	paramsitems.add(m.get("proid"));
	    	paramsitems.add(m.get("cainame"));
	    	paramsitems.add(m.get("price"));
	    	paramsitems.add(m.get("count"));
	    	db.excuteSql(strSqlitems, paramsitems);
	    }
	    
	   
	  
	    String StrSql1="insert into order (orderid,sname,stel,saddress,sumprice,memberid,ctime) values (?,?,?,?,?,?,?)";
	    List<Object> params1 = new ArrayList<Object>();
	    params1.add(orderid);
	    params1.add(tbname);
	    params1.add(tbtel);
	    params1.add(tbaddress);
	    params1.add(sum);
	    params1.add(memberid);
	    params1.add(createtime);
	    db.excuteSql(StrSql1, params1);
	    
	  
	    String strSqlClearCar="delete from gouwuche where sessionid=?";
	    db.excuteSql(strSqlClearCar, params);
	    
	    response.setCharacterEncoding("utf-8");
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().write("{\"msg\":\"ok\"}");
	}

}
