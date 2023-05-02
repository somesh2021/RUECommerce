<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			
			String insert = "INSERT INTO orders (username, total_price, order_time) VALUES (?, ?, ?)"; 
			float total = Float.parseFloat(request.getParameter("total"));
			
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setString(1, username);
			ps.setFloat(2, total);
			
			String query = "SELECT CURRENT_TIMESTAMP";
			ResultSet rs = stmt.executeQuery(query);
			rs.next();
			String currtime = rs.getString(1);
			ps.setString(3, currtime);
			
			ps.executeUpdate();
			
			String sel = "SELECT * FROM cart where username='" + username + "'";
			Statement stmt1 = con.createStatement();
			ResultSet rs1 = stmt1.executeQuery(sel);
			
			String sel1 = "SELECT order_id FROM orders WHERE order_time = '" + currtime + "'";
			Statement stmt2 = con.createStatement();
			ResultSet rs2 = stmt2.executeQuery(sel1);
			rs2.next();
			int order_id = rs2.getInt(1);
			
			if(rs1.next())
			{
				
				do {
					int itemid = rs1.getInt("item_id");
					int quantity = rs1.getInt("quantity");
					
					String ins1 = "INSERT INTO orderitems VALUES (?, ?, ?)";
					PreparedStatement ps1 = con.prepareStatement(ins1);
					ps1.setInt(1, order_id);
					ps1.setInt(2, itemid);
					ps1.setInt(3, quantity);
					ps1.executeUpdate();
					
					
				}while (rs1.next());
			}
			
			String del = "DELETE FROM cart WHERE username='" + username + "'";
			Statement stmt3 = con.createStatement();
			stmt3.executeUpdate(del);
			
			out.println("<script>alert('Order placed successfully'); window.location.href = 'loggedInHome.jsp';</script>");
			
			//close the connection.
			con.close();
}
catch (Exception ex) {
	out.print(ex);
}
		
			%>

</body>
</html>