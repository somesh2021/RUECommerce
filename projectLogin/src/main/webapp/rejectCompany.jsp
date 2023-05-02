<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reject Company</title>
</head>
<body>

<%


			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			int reqid = Integer.parseInt(request.getParameter("reqid"));
			
			
			Statement stmt1 = con.createStatement();
			String del = "DELETE FROM requests WHERE reqid =" + reqid;
			PreparedStatement ps1 = con.prepareStatement(del);
			ps1.executeUpdate();
			
			out.print("Company account rejected!");
			out.print("<br>");
			out.print("<a href='companyRequest.jsp'>Return</a>");
			
			//close the connection.
			con.close();

		
	%>

</body>
</html>