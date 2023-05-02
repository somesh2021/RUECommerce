<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
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
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String user = request.getParameter("username");
		String pw = request.getParameter("password");
		String phone = request.getParameter("phone");

		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO companies(username, password, name, email, phone_number)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, user);
		ps.setString(2, pw);
		ps.setString(3, name);
		ps.setString(4, email);
		ps.setString(5, phone);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.println("<script>alert('Registration succeeded.'); window.location.href = 'HelloWorld.jsp';</script>");
		
	} catch (Exception ex) {
		out.println("<script>alert('Registration Failed. There is already a company associated with this username.'); window.location.href = 'HelloWorld.jsp';</script>");
	}
%>
</body>
</html>