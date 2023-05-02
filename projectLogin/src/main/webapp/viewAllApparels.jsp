<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Apparels</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
</head>
<style>
nav {
  display: flex;
  justify-content: space-around;
  align-items: center;
  min-height: 8vh;
  background-color: maroon;
  font-family: "Montserrat", sans-serif;
}

.heading {
  color: white;
  text-transform: uppercase;
  letter-spacing: 5px;
  font-size: 20px;
}

.nav-links {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 30%;
}

.nav-links li {
  list-style: none;
  position: relative;
}

.nav-links a {
  color: white;
  text-decoration: none;
  letter-spacing: 3px;
  font-weight: bold;
  font-size: 14px;
  padding: 14px 16px;
}

.nav-links a:hover:not(.active) {
  background-color: lightseagreen;
}

.nav-links li a.active {
  background-color: #4caf50;
}

.dropdown {
  position: relative;
}

.dropdown-content {
  display: none;
  position: absolute;
  z-index: 1;
  background-color: maroon;
  min-width: 100%;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown-content a {
  color: white;
  text-decoration: none;
  letter-spacing: 3px;
  font-weight: bold;
  font-size: 14px;
  display: block;
  padding: 14px 16px;
}

.dropdown-content a:hover {
  background-color: lightseagreen;
}

.dropdown:hover .nav-links {
  display: none;
}
.dropbtn {
  color: white;
  text-decoration: none;
  letter-spacing: 3px;
  font-weight: bold;
  font-size: 14px;
  background-color: inherit;
  border: none;
  cursor: pointer;
  margin: 0;
  padding: 14px 16px;
  font-family: "Montserrat", sans-serif;
}
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
form {
  font-family: 'Montserrat', sans-serif;
  width: 50%;
  margin: auto;
}

h2 {
  font-family: 'Montserrat', sans-serif;
  text-align: center;
  margin-top: 50px;
}

input[type=text], input[type=submit] {
  padding: 10px;
  border: none;
  border-radius: 3px;
  margin-bottom: 10px;
  width: 100%;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
body {
			font-family: 'Montserrat', sans-serif;
		}
</style>
<body>
<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Portal</h4>

      </div>

		<%String username = (String)session.getAttribute("user"); %>
      <ul class="nav-links">

        <li><a href="loggedInHome.jsp">Home</a></li>
        
        <li><a href="buyer.jsp">Return</a></li>
       
        <li>
    <div class="dropdown">
      <button class="dropbtn">User: <%= username %></button>
      <div class="dropdown-content">
      	<a href="buyer.jsp">Buyer Portal</a>
        <a href="seller.jsp">Seller Portal</a>
        <a href="viewOrders.jsp">View Orders</a>
        <a href="userSettings.jsp">Settings</a>
        <a href="viewquestions.jsp">View Questions/Replies</a>
        <a href="logout.jsp">Log out</a>
      </div>
    </div>
  </li>
		
		
      </ul>

    </nav>
    <br>
    <br>

	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			
			String yes = "update apparel apa set apa.price = (select * from (select max(b.amount) from bids b, auctions a, apparel ap where b.aucid=a.aucid and a.apid=ap.apid and a.apid=apa.apid) temp1) where apa.availability = 'Yes'";
			String no = "update apparel apa set apa.price = (select * from (select max(w.amount) from winners w, apparel ap where w.apid=ap.apid and w.apid=apa.apid)temp) where apa.availability='No'";
			
			
		
			PreparedStatement updateYesStatement = con.prepareStatement(yes);
			
			updateYesStatement.executeUpdate();
			
			
			PreparedStatement updateNoStatement = con.prepareStatement(no);
			updateNoStatement.executeUpdate();
			
			
			
			
			
			
			//Run the query against the database.
			String str = "SELECT * FROM apparel";
 
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
	
		
			out.println("<br><br>");
			out.println("<h2>Set Alerts on Apparel</h2>");
			out.println("<form action='setAlertsOnProduct.jsp' method='post'><input type='text' name='name' id='name' placeholder='Enter name' required min='0'><br><br><input type='submit' value='Set'></form>");
			
			out.print("<br><br>");
			out.println("<br><br>");
			
			
	
		
		
			
			
		}else {
	
			out.println("<script>alert('No apparel found.'); window.location.href = 'buyer.jsp';</script>");
	
		}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>