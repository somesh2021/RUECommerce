<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>Add to Cart</title>
</head>
<body>
	<%

	try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String username = (String)session.getAttribute("user");
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			int itemid = Integer.parseInt(request.getParameter("itemid"));
			
			String sel = "SELECT * FROM items where itemid =" + itemid;
			
			ResultSet result = stmt.executeQuery(sel);
			
			if (result.next()) {
				float price = result.getFloat("price");
				
				String insert = "INSERT INTO cart VALUES (?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setInt(1, itemid);
				ps.setInt(2, 1);
				ps.setFloat(3, price);
				ps.setString(4, username);
				ps.executeUpdate();
				
				
				out.println("<script>alert('Item added to cart.'); window.location.href = 'loggedInHome.jsp';</script>");
			}
			
			
			//close the connection.
			con.close();
	}
	catch (Exception ex) {
		out.println("<script>alert('Item already in cart.'); window.location.href = 'loggedInHome.jsp';</script>");
	}
		
	%>
</body>
</html>