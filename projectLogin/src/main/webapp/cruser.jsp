<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View/Edit Accounts</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * from Accounts";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
	if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("All Accounts");
			out.print("<br>");
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Email ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Name ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Username ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Password ");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			do{
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getString("email"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("password"));
				out.print("</td>");
				out.print("<td>");

			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
			out.println("Change Username");
			out.print("<br>");
			out.print("<form method='post' action='editusername.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Email:</td><td><input type='email' name='email' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>New Username:</td><td><input type='text' name='newuser' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Submit'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.println("Change Name");
			out.print("<br>");
			out.print("<form method='post' action='editname.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Email:</td><td><input type='email' name='email' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>New Name:</td><td><input type='text' name='newname' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Submit'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.println("Change Password");
			out.print("<br>");
			out.print("<form method='post' action='editpw.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Email:</td><td><input type='email' name='email' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Username:</td><td><input type='text' name='username' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>New Password:</td><td><input type='text' name='newpw' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Submit'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.println("Delete Account Permanently (This action will delete the account and all auctions, alerts, and bids associated with it.)");
			out.print("<br>");
			out.print("<form method='post' action='deleteAccount.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Email:</td><td><input type='email' name='email' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Username:</td><td><input type='text' name='username' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Submit'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			
			out.println("<a href='CustomerRep.jsp'>Return</a>");
			//close the connection.
		}
		else {
			
			out.print("No accounts");
			out.print("<br>");
			out.print("<br>");
			out.println("<a href='CustomerRep.jsp'>Return</a>");
		}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>