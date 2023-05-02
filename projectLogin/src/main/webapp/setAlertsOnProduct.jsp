<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>View All Apparels Sorted by Type</title>
</head>
<body>

	
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			Statement checkAvab = con.createStatement();
			
			
			
			String username = (String)session.getAttribute("user");
			
			
			String name = request.getParameter("name");
			
			
			//Run the query against the database.
			String str = "SELECT * FROM alerts WHERE name LIKE '" + name + "' AND username LIKE "+"'"+username+"'";
			
			//checking if it is available
			String avab = "SELECT availability FROM apparel WHERE name LIKE '" + name + "'";
			
		
			
			ResultSet result = stmt.executeQuery(str);
			
			ResultSet checkAvable = checkAvab.executeQuery(avab);
			
		
		if (checkAvable.next()){ // product exists in apparel table
			
			
			String av = checkAvable.getString("availability");
			
			
			if(av.equalsIgnoreCase("yes")){  // it is available
				
				out.println("<h1>It is Available so you cannot make an alert for it!</h2>");
				out.println("<a href='viewAllApparels.jsp'>Return</a>");
				
			}else{ // not available 
				
				if(result.next())
				{
					out.println("<h1>It is Already on your alerts so cannot add again!</h2>");
					
					out.println("<a href='viewAllApparels.jsp'>Return</a>");
				
						
						
				}else {
			
					
					Statement updateStatement = con.createStatement();

			
					

					
					//Make an insert statement for the Sells table:
						
					String updateQuery = "INSERT INTO alerts(username, name)"
							+ "VALUES (?, ?)";
						
					//Create a Prepared SQL statement allowing you to introduce the parameters of the query
					PreparedStatement update = con.prepareStatement(updateQuery);

					//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
					update.setString(1, username);
					update.setString(2, name);
					
					//Run the query against the DB
					update.executeUpdate();
					
							
					
					out.println("<h1>Successfully added the alert</h1>");
					
					out.println("<a href='viewAllApparels.jsp'>Return</a>");
					

						
			
				}
				
				
				
				
				
			}
			
			
					
			
			
			
			
					
			
		 }else{ // product does not exist and user is fooling DB
			 	out.println("<h1>You entered Apparel ID that does not exist in our Data Base</h2>");
				
				out.println("<a href='viewAllApparels.jsp'>Return</a>");
		 }
		
	
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>




