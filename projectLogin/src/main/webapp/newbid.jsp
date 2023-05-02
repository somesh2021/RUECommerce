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

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		out.print("Set Manual Bid");
		out.print("<br>");
		out.print("<form method='post' action='manualbid.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Amount:</td><td><input type='text' name='amount' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Set'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("Start Automatic Bidding");
		out.print("<br>");
		out.print("<form method='post' action='autobid.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Initial Amount:</td><td><input type='text' name='initamount' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Upper Limit:</td><td><input type='text' name='upperlim' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("<a href='buyer.jsp'>Return to Buyer Portal</a>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>