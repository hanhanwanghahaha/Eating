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

import org.apache.catalina.Session;

import com.chi.DBHelper;

/**
 * Servlet implementation class GouwucheList
 */
@WebServlet("/GouwucheList")
public class GouwucheList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GouwucheList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查询全部
				String strSql=" select * from gouwuche ";
				List<Map<String, Object>> listall = null;
				List<Object> params = new ArrayList<Object>();
				DBHelper Dal=new DBHelper();
				try {
					listall=Dal.executeQuery(strSql, params);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				String strSq2=" select * from guestbook ";
				List<Map<String, Object>> listal2 = null;
				List<Object> params2 = new ArrayList<Object>();
				DBHelper Da2=new DBHelper();
				try {
					listal2=Da2.executeQuery(strSq2, params2);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("lists", listall);
				request.getSession().setAttribute("userid", listal2.get(0));
				request.getRequestDispatcher("/Eating/uiaddtocar").forward(request, response);
			}

			/**
			 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
			 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
