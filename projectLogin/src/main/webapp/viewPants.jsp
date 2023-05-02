<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Pants</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
</head>
<style>
table {
  font-family: 'Montserrat', sans-serif;
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

thead {
  background-color: #333;
  color: #fff;
}

th {
  border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}
body {
			font-family: 'Montserrat', sans-serif;
		}
</style>
<body>
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			
			
			
			String inputColor = request.getParameter("color");
			
			
			inputColor = inputColor.toLowerCase();
			
			
			int waist = Integer.parseInt(request.getParameter("waist"));
			int length = Integer.parseInt(request.getParameter("length"));
		
			
			
		
			
	
			
			
			
			
					
			
			//Run the query against the database.
			
			String str =  "SELECT a.apid, a.name, a.color, a.price, a.availability FROM apparel a, Pants s WHERE a.apid = s.apid AND s.waist = " + waist + " AND s.length = "+length+ " AND a.color LIKE " +"'"+ inputColor+"'";
			
			
			
			
			
			
			ResultSet result = stmt.executeQuery(str);
		if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("<table border='solid'>");
			
			out.print("<thead><tr><th>Apparel ID</th><th>Name</th><th>Color</th><th>Price</th><th>Available</th></tr></thead>");
			
			

			//parse out the results
			do{
				
				
				
				
				
			
				
				//universal for all apparels
				int apid = result.getInt("apid");
				
							
				
				//universal for all apparels						
				String name = result.getString("name");
						
				String color = result.getString("color");
				
				String available = result.getString("availability");
				
				
				float price = result.getFloat("price"); 
				
				
				
				
				
				
			
				/* out.println(apid+" "+color+" "+name+ " "+type); */
						
				out.print("<tr>");			
				out.println("<td>"+ apid+ "</td>");
				out.println("<td>"+ name+"</td>");
				out.println("<td>"+ color+ "</td>");
				out.println("<td>"+ price+ "</td>");
				out.println("<td>"+ available+ "</td>");
				out.print("</tr>");
				
				
			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
			
		
			
			
	
			
			
	
		
		
			
			
		}else {
	
			out.println("<script>alert('No pants available for given preference.'); window.location.href = 'buyer.jsp';</script>");
			out.print("<br>");
			out.print("<br>");
	
		}
		
		db.closeConnection(con);
		out.print("<br><br><a href='buyer.jsp'>Return</a>");
		}
		
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>