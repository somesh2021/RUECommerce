<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Adding Product</title>
</head>
<body>
	<%
	try {

		String username = (String)session.getAttribute("user");
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		String imageurl = request.getParameter("image_url");
		String color = request.getParameter("color");
		String size = request.getParameter("size");

		String query = "SELECT cid FROM companies where username = '" + username + "'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		int cid = rs.getInt(1);
		
		
		String tags = "";
		String[] nameSplit = name.split(" ");
		for (String a:nameSplit) {
			tags = tags.concat(a);
			tags = tags.concat(",");
		}
		tags = tags + color + "," + size;
		
		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO items(companyid, name, price, image_url, color, size, tags)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setInt(1, cid);
		ps.setString(2, name);
		ps.setFloat(3, price);
		ps.setString(4, imageurl);
		ps.setString(5, color);
		ps.setString(6, size);
		ps.setString(7, tags);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.println("<script>alert('Product added.'); window.location.href = 'companyPortal.jsp';</script>");
		
	} catch (Exception ex) {
		//out.println("<script>alert('Product not added. Please try again.'); window.location.href = 'companyPortal.jsp';</script>");
		out.println(ex);
	}
%>


</body>
</html>