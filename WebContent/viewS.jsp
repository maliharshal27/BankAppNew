<%@page import="com.harshalwork.bankappnew.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
font-family: Arial, sans-serif;
background-image:url(https://images.unsplash.com/photo-1626266061368-46a8f578ddd6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWNjb3VudHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60);
background-position:center;
background-size:cover;
background-repeat: no-repeat;

}
.container {
width: 400px;
margin: 0 auto;
padding: 20px;
background-color: #fff;
border: 1px solid #ccc;
border-radius: 5px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
h1 {
text-align: center;
color: #333;
margin-top: 0;
}
p {
text-align: center;
color: #777;
margin-bottom: 20px;
}
label {
display: block;
margin-bottom: 10px;
color: #333;
}
input[type="text"],
input[type="password"] {
width: 100%;
padding: 10px;
margin-bottom: 10px;
border: 1px solid #ccc;
border-radius: 4px;
}
hr {
margin-top: 20px;
margin-bottom: 20px;
border: 0;
border-top: 1px solid #ccc;
}
a {
color: #337ab7;
text-decoration: none;
}
button[type="submit"] {
display: block;
width: 100%;
padding: 10px;
margin-top: 20px;
background-color: #4CAF50;
color: #fff;
border: none;
border-radius: 4px;
cursor: pointer;
font-weight: bold;
}
button[type="submit"]:hover {
background-color: #45a049;
}
.container.signin {
text-align: center;
color: #777;
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




</style>
</head>
<body>

<form action="viewS.jsp">
<div class="container">
<h1>Search Tab</h1>
<hr>


<label for="mob"><b>Account Number</b></label>
<input type="text" placeholder="Account Number" name="mob">


<hr>
<p>Note: Dear User,Mobile number is your Account Number </p>

<button type="submit" class="searchbtn"><strong>Search</strong></button>

</div>

<%  
    
    String mob = request.getParameter("mob");
    if(mob!=null)
    { 	
    	
     %>   
     
			    <table>
                <thead>
			  <tr>
			  <th>CUSTID</th>
			  <th>Account Holder Name</th>    
			    <th>E-mail</th>           
			   <th>Contact Number</th>          
			     <th>Password</th>         
			    <th>Balance</th>
			    <th>Action</th>                        
			                            
			         </tr>
			  </thead>
              <tbody>
			    
			  
			     
           <% 
			   try
			   {       
				   Connection con = ConnectionDB.connect();
			 
				   PreparedStatement psm = con.prepareStatement("select * from register1_db where mob=?");
					psm.setString(1, mob);
				    ResultSet rs =	psm.executeQuery();
				    while(rs.next())
				    {
				  %>	
				              <tr>
			                   <td><%=rs.getString(1) %></td>
			                    <td><%=rs.getString(2) %></td>
			                     <td><%=rs.getString(3) %></td>
			                    <td><%=rs.getString(4) %></td>
			                 <td><%=rs.getString(5) %></td>
			                 <td><%=rs.getString(6) %></td>
			           <td><a href="deleteR.jsp?id=<%=rs.getString("id")%>" >Delete</a></td>
			                 
			                   </tr>
				           
				   
				   <% 
				    }
				   
				   
			   }
			   catch(Exception e)
			   {
				   e.printStackTrace();
			   }

    }


%>
            </tbody>
		            </table>

                
        
    
     

</form>
</body>
</html>