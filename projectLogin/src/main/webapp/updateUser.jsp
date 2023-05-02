<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
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
		String newemail = request.getParameter("new_email");
		String newuser = request.getParameter("new_username");
		String newname = request.getParameter("new_name");
		String newpassword = request.getParameter("new_password");
		//Make an insert statement for the Sells table:
		String update = "UPDATE Accounts SET email = ?, name = ?, username = ?, password = ? WHERE username = ?";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(update);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newemail);
		ps.setString(2, newname);
		ps.setString(3, newuser);
		ps.setString(4, newpassword);
		ps.setString(5, username);
		//Run the query against the DB
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.println("<script>alert('Credentials changed successfully.'); window.location.href = 'userSettings.jsp';</script>");
		
	} catch (Exception ex) {
		out.println("<script>alert('Credentials not changed. Please try again.'); window.location.href = 'userSettings.jsp';</script>");

	}
%>


</body>
</html>