<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction of Similar Items</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
</head>
<style>
  /* Montserrat font for table */
  table {
    font-family: 'Montserrat', sans-serif;
    font-size: 14px;
  }
  
  /* Table header styles */
  th {
    background-color: #f2f2f2;
    color: #333;
    font-weight: bold;
    padding: 8px;
    text-align: center;
    text-transform: uppercase;
  }
  
  /* Table row styles */
  td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
  }
  
  /* Alternate row background color */
  tr:nth-child(even) {
    background-color: #f2f2f2;
  }
  
  /* Hover over row */
  tr:hover {
    background-color: #ddd;
  }
  h2 {
  font-family: 'Montserrat', sans-serif;
  margin-top: 50px;
}
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

	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String str = "select a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing from auctions a, apparel ap where a.apid=ap.apid and a.apid in (select apid from Shirts) and year(a.closing) = year(current_date - interval 1 month) and month(a.closing) = month(current_date - interval 1 month)";
		ResultSet result = stmt.executeQuery(str);
		
		Statement stmt1 = con.createStatement();
		String str1 = "select a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing from auctions a, apparel ap where a.apid=ap.apid and a.apid in (select apid from Pants) and year(a.closing) = year(current_date - interval 1 month) and month(a.closing) = month(current_date - interval 1 month)";
		ResultSet result1 = stmt1.executeQuery(str1);
		
		Statement stmt2 = con.createStatement();
		String str2 = "select a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing from auctions a, apparel ap where a.apid=ap.apid and a.apid in (select apid from Shoes) and year(a.closing) = year(current_date - interval 1 month) and month(a.closing) = month(current_date - interval 1 month)";
		ResultSet result2 = stmt2.executeQuery(str2);
		
		if(result.next())
		{
			out.print("<h2>Auctions of Shirts in the preceding month</h2>");
			out.print("<br>");
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Auction ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Apparel Name ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Seller Username ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Initial Price ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Increment ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Closing Date/Time ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result.getFloat("initial_price"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result.getFloat("increment"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getTimestamp("closing"));
				out.print("</td>");
				out.print("<td>");
			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("<h2>No Auctions of Shirts in the preceding month</h2>");
			out.print("<br>");
			out.print("<br>");
		}
		if(result1.next())
		{
			out.print("<h2>Auctions of Pants in the preceding month</h2>");
			out.print("<br>");
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Auction ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Apparel Name ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Seller Username ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Initial Price ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Increment ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Closing Date/Time ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result1.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat("initial_price"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat("increment"));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getTimestamp("closing"));
				out.print("</td>");
				out.print("<td>");
			}while(result1.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("<h2>No Auctions of Pants in the preceding month</h2>");
			out.print("<br>");
			out.print("<br>");
		}
		if(result2.next())
		{
			out.print("<h2>Auctions of Shoes in the preceding month</h2>");
			out.print("<br>");
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Auction ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Apparel Name ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Seller Username ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Initial Price ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Increment ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Closing Date/Time ");
			out.print("</td>");
			out.print("</tr>");
			
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result2.getInt("aucid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result2.getString("name"));
				out.print("</td>");
				out.print("<td>");
				out.print(result2.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result2.getFloat("initial_price"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result2.getFloat("increment"));
				out.print("</td>");
				out.print("<td>");
				out.print(result2.getTimestamp("closing"));
				out.print("</td>");
				out.print("<td>");
			}while(result2.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else
		{
			out.print("<h2>No Auctions of Shoes in the preceding month</h2>");
			out.print("<br>");
			out.print("<br>");
		}
		//Get parameters from the HTML form at the HelloWorld.jsp

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>