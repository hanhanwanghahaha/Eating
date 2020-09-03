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
 * Servlet implementation class Allcai
 */
@WebServlet("/Allcai")
public class Allcai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Allcai() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public List<Map<String, Object>> GetList()
   	{
   		List<Map<String, Object>> newslistall = null;
   		List<Object> params = new ArrayList<Object>();
   		DBHelper Dal=new DBHelper();
   		String strSqlpager=" select  * from food where 1=1 order by id"; 
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
		request.setAttribute("item1", item1);
		request.getRequestDispatcher("allcai.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
