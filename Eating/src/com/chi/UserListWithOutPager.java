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

/**
 * Servlet implementation class UserListWithOutPager
 */
@WebServlet("/UserListWithOutPager")
public class UserListWithOutPager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListWithOutPager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String strsql="select * from guestbook";
		DBHelper Dal1=new DBHelper();
	
		List<Map<String, Object>> listall = null;
		
		List<Object> params = new ArrayList<Object>();
		try {
			listall=Dal1.executeQuery(strsql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("lists", listall);
		request.getRequestDispatcher("/admin/userlistwithoutpager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
