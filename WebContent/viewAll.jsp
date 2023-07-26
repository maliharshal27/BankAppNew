<%@page import="com.harshalwork.bankappnew.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account Successful</title>
    <style>
        body {
        
        font-family: Arial, sans-serif;
background-image:url(https://images.unsplash.com/photo-1626266061368-46a8f578ddd6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWNjb3VudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60);
background-position:center;
background-size:cover;
background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 40px;
        }

        h1 {
            color: Black;
        }

        p {
            color: white
            margin-bottom: 20px;
        }

        .success-icon {
            width: 100px;
            margin: 0 auto 20px;
        }

        .success-message {
            font-size: 18px;
            color: #333;
        }
        container.signin {
text-align: center;
color: #777;
}body {
  font-family: Arial, sans-serif;
  background-color: #f7f7f7;
  margin: 0;
  padding: 0;
}

table {
  border-collapse: collapse;
  width: 80%;
  margin: 20px auto;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
  padding: 10px;
  text-align: center;
  border-bottom: 1px solid #ccc;
}

thead {
  background-color: #f2f2f2;
}

th {
  background-color: #333;
  color: #fff;
}

tbody tr:hover {
  background-color: #f2f2f2;
}

.total-label {
  font-weight: bold;
}

/* Responsive styles */
@media (max-width: 600px) {
  table {
    width: 100%;
  }
}

        
    </style>
</head>
<body>

  <form action="viewAll.jsp" method="post"></form>
    <h1>All Accounts</h1>
    
  
   
   <table>
    <thead>
      <tr>
        <th>CustID</th>
        <th>Name</th>
        <th>E-mail</th>
        <th>Mobile</th>
          <th>Password</th>
          <th>Balance</th>
          <th>Action</th>
          
          
        
      </tr>
    </thead>
    <tbody>
    
    <%   
	   Connection con = ConnectionDB.connect();

    
	   try
	   {       
	 
		   PreparedStatement psm = con.prepareStatement("select * from register1_db");
		    ResultSet rs =	psm.executeQuery();
		    while(rs.next())
		    {
		  %>	      
		            		  
		              <tr>
	                   <td><%=rs.getString("id") %></td>
	                    <td><%=rs.getString("name") %></td>
	                     <td><%=rs.getString("email") %></td>
	                    <td><%=rs.getString("mob") %></td>
	                 <td><%=rs.getString("pwd") %></td>
	                 <td><%=rs.getString("bal") %></td>
	               <td><a href="deleteR.jsp?id=<%=rs.getString("id")%>" >Delete</a></td>
	                 
	                   </tr>
	               
		   
		   <% 
		    }
		   
		   
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();
	   }
  %>   
            
		            </tbody>
		            </table>
		            
    
    <div class="container signin">
  <p><a href="bankMenu.html">HOME</a>.</p>
</div>
    </form>  
</body>
</html>
