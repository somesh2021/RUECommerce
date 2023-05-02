<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Company Account Requests</title>
</head>
<body>

		
<%


			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			
			String str = "SELECT * from requests";
			
			ResultSet result = stmt.executeQuery(str);
			
			if(result.next())
			{
				do {
					
					int reqid = result.getInt("reqid");
					String reqStr = String.valueOf(reqid);
					session.setAttribute("reqid", reqid);
					String name = result.getString("name");
					String email = result.getString("email");
					String phonenum = result.getString("phone_number");
					String username = result.getString("cuser");
					out.println("Request #" + reqid);
					out.print("<br>");
					
					out.println("Company Name: " + name);
					out.print("<br>");
					out.println("Email: " + email);
					out.print("<br>");
					out.println("Phone Number: " + phonenum);
					out.print("<br>");
					out.print("Requested Username: " + username);
					out.print("<br>");
					%>
					<a href="approveCompany.jsp?reqid=<%=result.getInt("reqid") %>" >Approve Company</a>
					<%
					out.print("<br>");
					%>
					<a href="rejectCompany.jsp?reqid=<%=result.getInt("reqid") %>" >Reject Company</a>
					<%
					
					out.print("<br>");
					out.print("<br>");
					
				}while(result.next());
			}
			else {
				out.print("No new requests");
				out.print("<br>");
				out.print("<a href='AdminStaff.jsp'>Return to Admin Page</a>");
			}
			//close the connection.
			con.close();

		
			%>

</body>
</html>