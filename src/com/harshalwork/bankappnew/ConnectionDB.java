package com.harshalwork.bankappnew;
import java.sql.*;

public class ConnectionDB {
	
	static Connection con=null;
	
	public static Connection connect()
	{
		
		if(con==null)
		{	
	         	try 
	         	{
		            	Class.forName("com.mysql.jdbc.Driver");
			            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_db", "root", "");
                        
			
		         } 
	            catch (Exception e1) 
	         	{         
                    System.err.println("Please Try Again...");
  
			              e1.printStackTrace();
		         }
		}
		return con;
				
	}
	
	

}
