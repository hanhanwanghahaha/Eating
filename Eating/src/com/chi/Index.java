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
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

    public List<Map<String, Object>> GetList()
   	{
   		List<Map<String, Object>> newslistall = null;
   		List<Object> params = new ArrayList<Object>();
   		DBHelper Dal=new DBHelper();
   		String strSqlpager=" select  * from food where 1=1 order by id desc limit 0,6 "; 
   		try {
   			newslistall=Dal.executeQuery(strSqlpager, params);
   		} catch (SQLException e) {
   			e.printStackTrace();
   		}
   		return newslistall;
   	}
       
       public List<Map<String, Object>> GetStarList()
   	{
   		List<Map<String, Object>> newslistall = null;
   		List<Object> params = new ArrayList<Object>();
   		DBHelper Dal=new DBHelper();
   		String strSqlpager=" select  * from food where 1=1 order by id desc limit 0,8 "; 
   		try {
   			newslistall=Dal.executeQuery(strSqlpager, params);
   		} catch (SQLException e) {
   			e.printStackTrace();
   		}
   		return newslistall;
   	}
       
    
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Map<String, Object>> item1=GetList();
		List<Map<String, Object>> item2=GetStarList();
		request.setAttribute("item1", item1);
		request.setAttribute("item2", item2);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
