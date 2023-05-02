<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		String email = request.getParameter("email");
		String user = request.getParameter("username");
		String name = request.getParameter("name");
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT password FROM Accounts WHERE email =" + "'"+ email +"'" + " AND username =" + "'" + user + "'" + " AND name =" + "'" + name + "'";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		if(result.next())
		{
			out.print("Your password is " + result.getString("password"));
			out.print("<br>");
			out.print("<a href='HelloWorld.jsp'>Return</a>");
		}
		else
		{
			out.print("Incorrect email or username or name");
			out.print("<br>");
			out.print("<a href='HelloWorld.jsp'>Try Again</a>");
		}

		//close the connection.
		con.close();
		

%>
</body>
</html>