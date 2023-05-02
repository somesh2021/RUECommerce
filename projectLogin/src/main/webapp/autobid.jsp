<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Start Auto Bid</title>
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
		String amount = request.getParameter("initamount");
		String upperlim = request.getParameter("upperlim");
		float amount1 = Float.parseFloat(amount);
		
		Statement stmt1 = con.createStatement();
		String str1 = "select username, initial_price from auctions where aucid = " + aucid;
		ResultSet result1 = stmt1.executeQuery(str1);
		result1.next();
		String suser = result1.getString(1);
		float initprice = result1.getFloat(2);
		if (suser.equals(username))
		{
			out.print("You cannot create a bid on your own auction. Please return to auctions/bidding portal.");	
			out.print("<br>");
			out.print("<a href='auction1.jsp'>Return to Auctions/Bidding Portal</a>");
		}
		else if (amount1 < initprice)
		{
			out.print("Your bid must be greater than or equal to the starting price of the auction.");
			out.print("<br>");
			out.print("<br>");
			out.print("<a href='auction1.jsp'>Try Again</a>");
		}
		else
		{
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO bids(aucid, username, amount, upperlim, bidtype)"
				+ "VALUES (?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, aucid);
		ps.setString(2, username);
		ps.setString(3, amount);
		ps.setString(4, upperlim);
		ps.setString(5, "Automatic");
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Automatic Bidding Started Successfully");
		out.print("<br>");
		out.print("<a href='auction1.jsp'>Return to Auctions/Bidding Portal</a>");
		}
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("<br>");
		out.print("Auto-bid not created");
		out.print("<br>");
		out.print("<a href='auction1.jsp'>Try Again</a>");
	}
%>
</body>
</html>