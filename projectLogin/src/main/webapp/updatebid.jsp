<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Bid</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String username = (String)session.getAttribute("user");
		//Get parameters from the HTML form at the HelloWorld.jsp
		String aucid = request.getParameter("aucid");
		String newamount = request.getParameter("newamount");
		float newamount1 = Float.parseFloat(newamount);
		
		Statement stmt1 = con.createStatement();
		String str1 = "select increment from auctions where aucid = " + aucid;
		ResultSet result1 = stmt1.executeQuery(str1);
		result1.next();
		float increment = result1.getFloat(1);
		
		Statement stmt3 = con.createStatement();
		String str3 = "select max(amount) from bids where aucid = " + aucid;
		ResultSet result3 = stmt3.executeQuery(str3);
		result3.next();
		float maxamount = result3.getFloat(1);
		
		float temp = maxamount + increment;
		if (newamount1 < maxamount)
		{
			out.print("Your bid is not valid, as it is lower than the current highest bid for this auction.");
			out.print("<br>");
			out.print("<a href='auction1.jsp'>Try Again</a>");
		}
		else if (newamount1 >= maxamount && newamount1 < temp)
		{
			out.print("Your bid is not valid, as it is not equal to the specified increment value above the current highest bid for this auction.");
			out.print("<br>");
			out.print("<a href='auction1.jsp'>Try Again</a>");
		}
		else
		{
		//Make an insert statement for the Sells table:
		String update = "UPDATE bids SET amount = ? WHERE aucid = ? AND username = ?";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(update);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newamount);
		ps.setString(2, aucid);
		ps.setString(3, username);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Bid Updated Successfully");
		out.print("<br>");
		out.print("<a href='auction1.jsp'>Return to Auctions/Bidding Portal</a>");
		}
		
	} catch (Exception ex) {
		out.print("Error: " + ex);
		out.print("<br>");
		out.print("Bid not updated");
		out.print("<br>");
		out.print("<a href='auction1.jsp'>Try Again</a>");
	}
%>
</body>
</html>