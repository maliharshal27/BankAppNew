package com.harshalwork.bankappnew;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Deposite
 */
public class Deposite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposite() {
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
		
		String mob = request.getParameter("mob");
		String amt = request.getParameter("amt"); 
		
		Connection con = ConnectionDB.connect();
		try
		{       
			PreparedStatement psm = con.prepareStatement("select * from register1_db where mob=?");
			psm.setString(1, mob);
		    ResultSet rs =	psm.executeQuery();
		    if(rs.next())
		    {      
		    	
		    	  int bal= rs.getInt("bal");
		    	int r =  Integer.parseInt(amt);
		    	  if(r>0)
		    	  {
					        
						           bal = bal + r;
						          PreparedStatement psm1 = con.prepareStatement("update register1_db set bal=? where mob=?");
						          psm1.setInt(1, bal);
						          psm1.setString(2, mob);
						          int i = psm1.executeUpdate();
						          System.out.println(i);
						          if(i>0){
						        	  
						        	  response.sendRedirect("successD.html");
						          }
						          else{
						        	  response.sendRedirect("Failed.html");
						          }
						          
					        
				
					        
		    	  }else{
		    		  
		        	  response.sendRedirect("Failed.html");

		    	  }        
					        
					        
					        
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
