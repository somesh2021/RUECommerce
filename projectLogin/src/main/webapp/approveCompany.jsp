<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve Company</title>
</head>
<body>

<%


			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			int reqid = Integer.parseInt(request.getParameter("reqid"));
			
			String sel = "SELECT * FROM requests WHERE reqid =" + reqid;
			ResultSet result = stmt.executeQuery(sel);
			
			if (result.next()) {
				String name = result.getString("name");
				String email = result.getString("email");
				String phonenum = result.getString("phone_number");
				String username = result.getString("cuser");
				String password = result.getString("password");
				
				String insert = "INSERT INTO companies (username, password, name, email, phone_number)" + "VALUES (?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setString(1, username);
				ps.setString(2, password);
				ps.setString(3, name);
				ps.setString(4, email);
				ps.setString(5, phonenum);
				ps.executeUpdate();
				
				Statement stmt1 = con.createStatement();
				String del = "DELETE FROM requests WHERE reqid =" + reqid;
				PreparedStatement ps1 = con.prepareStatement(del);
				ps1.executeUpdate();
				
				out.print("Company account approved!");
				out.print("<br>");
				out.print("<a href='companyRequest.jsp'>Return</a>");
			}
			
			
			//close the connection.
			con.close();

		
	%>

</body>
</html>