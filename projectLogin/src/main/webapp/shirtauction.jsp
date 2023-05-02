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
		String username = (String)session.getAttribute("user");
		//Get parameters from the HTML form at the HelloWorld.jsp
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String name = request.getParameter("name");
		String startprice = request.getParameter("initial_price");
		String minprice = request.getParameter("minprice");
		String increment = request.getParameter("increment");
		String closing = request.getParameter("closing");
		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO apparel(name, availability, color, type)"
				+ "VALUES (?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, name);
		ps.setString(2, "Yes");
		ps.setString(3, color);
		ps.setString(4, "Shirt");
		//Run the query against the DB
		ps.executeUpdate();

		String str = "select apid from apparel where name = '" + name + "' and color = '" + color + "' and availability = 'Yes'";
		ResultSet result = stmt.executeQuery(str);
		result.next();
		int apid = result.getInt(1);
		
		String insert1 = "INSERT INTO Shirts(apid, size) VALUES (?, ?)";
		PreparedStatement ps1 = con.prepareStatement(insert1);
		ps1.setInt(1, apid);
		ps1.setString(2, size);
		ps1.executeUpdate();
		
		String insert2 = "INSERT INTO auctions(apid, username, initial_price, minprice, increment, closing) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement ps2 = con.prepareStatement(insert2);
		ps2.setInt(1, apid);
		ps2.setString(2, username);
		ps2.setString(3, startprice);
		ps2.setString(4, minprice);
		ps2.setString(5, increment);
		ps2.setString(6, closing);
		ps2.executeUpdate();
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.println("<script>alert('Auction created successfully.'); window.location.href = 'seller.jsp';</script>");
		
	} catch (Exception ex) {
		out.println("<script>alert('Auction not created. Please try again.'); window.location.href = 'seller.jsp';</script>");
	}
%>
</body>
</html>