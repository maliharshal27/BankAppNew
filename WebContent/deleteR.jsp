<%@ page import="com.harshalwork.bankappnew.*" %>
<%@ page import="java.sql.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <%
 
      try{  
    	   Connection con=ConnectionDB.connect();
    	  String id=request.getParameter("id");
    	  PreparedStatement ps1= con.prepareStatement("delete from register1_db where id=?");
    	  ps1.setString(1, id);
    	  int i = ps1.executeUpdate();
    	   if(i>0)
    	   { 
    		    response.sendRedirect("viewAll.jsp");

    	   }
    	   else
    	   {
   		    response.sendRedirect("menu.jsp");

    	   }
    	  
    	  
      }
       catch(Exception e)
      {   
    	   e.printStackTrace();
    	   
      }
 
 
 %>
