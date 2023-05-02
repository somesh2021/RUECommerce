<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Keyword Question Search</title>
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
		
		//Get parameters from the HTML form at the HelloWorld.jsp
		String keyword = request.getParameter("keyword");

		
		//Make an insert statement for the Sells table:
		String str = "select * from questions where question like '%" + keyword + "%'";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		ResultSet result = stmt.executeQuery(str);

		if(result.next())
		{
			out.print("Search Results");
			out.print("<br>");
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Question ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Posted By ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Question ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("qid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");
				out.print("<td>");
				
			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
			out.print("<a href='features.jsp'>Return</a>");
		}
		else
		{
			out.print("No results");
			out.print("<br>");
			out.print("<br>");
			out.print("<a href='features.jsp'>Try Again</a>");
		}
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	} catch (Exception ex) {
		out.print("Error: " + ex);
		out.print("<br>");
		out.print("<br>");
		out.print("<a href='features.jsp'>Try Again</a>");
	}
%>
</body>
</html>