<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Active Auctions and Bidding</title>
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
			String str = "SELECT * from bids";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
	if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("All Bids");
			out.print("<br>");
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Bid ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Auction ID ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bidder Username ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bid Amount ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bid Type ");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			do{
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("bid_id"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result.getFloat("amount"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("bidtype"));
				out.print("</td>");
				out.print("<td>");

			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
			out.println("Delete Bid");
			out.print("<br>");
			out.print("<form method='post' action='deletebid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Bid ID:</td><td><input type='text' name='bid_id' required></td>");
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
			
			out.print("No bids");
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