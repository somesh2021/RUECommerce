<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%


			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String user = request.getParameter("username");
			String pw = request.getParameter("password");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM CustomerRep WHERE username =" + "'"+ user +"'" + " AND password=" + "'" + pw + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			if(result.next())
			{
				session.setAttribute("user", user);
				response.sendRedirect("CustomerRep.jsp");
			}
			else
			{
				out.print("Incorrect username or password");
				out.print("<br>");
				out.print("<a href='HelloWorld.jsp'>Try Again</a>");
			}

			//close the connection.
			con.close();

		
	%>

</body>
</html>