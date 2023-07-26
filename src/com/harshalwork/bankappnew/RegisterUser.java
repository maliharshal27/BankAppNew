package com.harshalwork.bankappnew;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class RegisterUser
 */
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mob = request.getParameter("mob");
		String pwd = request.getParameter("pwd");
		String bal = request.getParameter("bal");
		
		try
		{   
			Connection con = ConnectionDB.connect();
			PreparedStatement ps = con.prepareStatement("insert into register1_db values(?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, mob);
			ps.setString(5, pwd);
            ps.setString(6, bal);
		    int i =	ps.executeUpdate();
		    if(i==1)
		    {
		    	response.sendRedirect("success.html");
		    }
		    else
		    {
		    	response.sendRedirect("bankMenu.html");
		    }




			
		}catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}

}
