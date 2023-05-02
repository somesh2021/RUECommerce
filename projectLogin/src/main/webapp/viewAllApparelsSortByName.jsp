<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Apparels Sorted by Name</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
		
			
			
			
			
			
			//Run the query against the database.
			String str = "SELECT * FROM apparel order by name";
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
				
				String type = result.getString("type"); 
				
				
				if(type.equalsIgnoreCase("shirt")){
					String sizeInclusion = "SELECT size FROM  Shirts WHERE apid= "+apid;
					Statement includeSize = con.createStatement();
					ResultSet sizeInclude = includeSize.executeQuery(sizeInclusion);
					if(sizeInclude.next()){
						String siz = sizeInclude.getString("size");
						name = name + "( "+siz +" )";
					}
				}else if (type.equalsIgnoreCase("pant")){
					String sizeInclusion = "SELECT waist, length FROM  Pants WHERE apid= "+apid;
					Statement includeSize = con.createStatement();
					ResultSet sizeInclude = includeSize.executeQuery(sizeInclusion);
					if(sizeInclude.next()){
						int waist = sizeInclude.getInt("waist");
						int length = sizeInclude.getInt("length");
					
						name = name + "( "+waist+" x "+length +" )";
					}
				}else{
					
					String sizeInclusion = "SELECT size FROM  Shoes WHERE apid= "+apid;
					Statement includeSize = con.createStatement();
					ResultSet sizeInclude = includeSize.executeQuery(sizeInclusion);
					if(sizeInclude.next()){
						int siz = sizeInclude.getInt("size");
						name = name + "( "+siz + "'"+ " )";
					}
					
				}
				
				
				
				
				
				
			
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
			
			out.print("<br>");
			out.print("<br>");
			
			out.print("<a href='viewAllApparelsSortByType.jsp'>Sort by type</a>");
			out.print("<br>");
			out.print("<br>");
			
			out.print("<a href='viewAllApparelsSortByPriceLowToHigh.jsp'>Sort by Price Low to High</a>");
			out.print("<br>");
			out.print("<br>");
			out.print("<a href='viewAllApparelsSortByPriceHighToLow.jsp'>Sort by Price High to Low</a>");
			out.print("<br>");
			out.print("<br>");
			
			
			out.print("<a href='viewAllApparelsSortByName.jsp'>Sort by Name</a>");
			out.print("<br>");
			out.print("<br>");
			out.print("<br>");
			
		
			
			
			out.println("<h2>Set Alerts on Apparel</h2>");
			out.println("<form action='setAlertsOnProduct.jsp' method='post'><input type='text' name='name' id='name' placeholder='Enter name' required min='0'><br><br><input type='submit' value='Set'></form>");
			
			out.print("<br><br>");
			out.println("<br><br>");
			out.print("<a href='viewAllApparels.jsp'>Return</a>");
	
			
			
	
		
		
			
			
		}else {
	
			out.print("No Apparels Available");
	
		}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>