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
 * Servlet implementation class DingdanXX
 */
@WebServlet("/DingdanXX")
public class DingdanXX extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DingdanXX() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String orderid=request.getParameter("orderid");
		List<Object> params = new ArrayList<Object>();
		params.add(orderid);

		String strsql="SELECT * FROM orderedfood WHERE orderid=?"; 
		
		DBHelper Dal=new DBHelper();
		List<Map<String, Object>> tbid = null;
		try {
			tbid=Dal.executeQuery(strsql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("tbid", tbid);
		
		//�ܼ�
			String id=request.getParameter("orderid");
			List<Object> params1 = new ArrayList<Object>();
			params1.add(id);
			String strsql1="SELECT sumprice FROM ordered WHERE orderid=?";
			
			DBHelper Dal1=new DBHelper();
			Map<String, Object> tbid1 = Dal1.getSingleObject(strsql1,params1);
			request.setAttribute("tc", tbid1);
		request.getRequestDispatcher("/dingdanXX.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
