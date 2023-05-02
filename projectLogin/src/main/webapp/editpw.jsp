<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Password</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get parameters from the HTML form at the HelloWorld.jsp
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String newpw = request.getParameter("newpw");
		//Make an insert statement for the Sells table:
		String update = "UPDATE Accounts SET password = ? WHERE email = ? AND username = ?";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(update);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newpw);
		ps.setString(2, email);
		ps.setString(3, username);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Password Changed Successfully");
		out.print("<br>");
		out.print("<a href='cruser.jsp'>Return</a>");
		
	} catch (Exception ex) {
		out.print("Error: " + ex);
		out.print("<br>");
		out.print("Password not changed");
		out.print("<br>");
		out.print("<a href='cruser.jsp'>Try Again</a>");
	}
%>
</body>
</html>