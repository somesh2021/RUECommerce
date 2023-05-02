<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buyer Portal</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		String username = (String)session.getAttribute("user");
		out.print("Welcome " + username);
		out.print("<br>");
		out.print("<br>");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		out.println("<a href='logout.jsp'>Log out</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='buyer.jsp'>Buyer Portal</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='seller.jsp'>Seller Portal</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("Ask a Question");
		out.print("<br>");
		out.print("<form method='post' action='questions.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Question (max 300 chars):</td><td><input type='text' name='question' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='viewquestions.jsp'>View Questions/Replies</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("Search Questions by Keyword");
		out.print("<br>");
		out.print("<form method='post' action='keyword.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Keyword:</td><td><input type='text' name='keyword' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='alerts.jsp'>Alerts</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='products.jsp'>View Third Party Products</a>");
		

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>