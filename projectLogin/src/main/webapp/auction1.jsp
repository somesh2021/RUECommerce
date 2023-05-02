<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Active Auctions and Bidding</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
</head>

<style>
/* table styles */
table {
  border-collapse: collapse;
  margin-left: 0;
      margin-right: auto;
}

th, td {
  text-align: left;
  padding: 8px;
}

th {
  background-color: #333;
  color: white;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

/* button styles */
.button {
  background-color: #333;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
h1, h2, h3, h4, h5, h6 {
  font-family: 'Montserrat', sans-serif;
  font-weight: bold;
}

/* form styles */
form {
  display: inline-block;
}

form input[type=text], input[type=number], input[type=submit] {
  padding: 6px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin: 6px;
}

form input[type=submit] {
  background-color: #333;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
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

        <h4>RU E-Commerce</h4>

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
			String str = "SELECT a.aucid, ap.name, a.username, a.initial_price, a.increment, a.closing FROM auctions a, apparel ap WHERE closing >= current_timestamp() and a.apid=ap.apid";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			Statement stmt1 = con.createStatement();
			String str1 = "select b.bid_id, b.aucid, b.username, b.amount from bids b, auctions a where b.aucid=a.aucid and a.closing >= current_timestamp()";
			ResultSet result1 = stmt1.executeQuery(str1);
	if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("<h2>Active Auctions</h2>");
			out.print("<br>");
			out.print("<table>");

			//make a row
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

			//parse out the results
			do{
				//make a row
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
		if(result1.next())
		{
			out.print("<h2>Current Bids on Active Auctions</h2>");
			out.print("<br>");
			out.print("<table>");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Bid ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Auction ID ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bidder ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Bid Amount ");
			out.print("</td>");
			out.print("</tr>");
			do
			{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result1.getInt(1));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getInt(2));
				out.print("</td>");
				out.print("<td>");
				out.print(result1.getString(3));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result1.getFloat(4));
				out.print("</td>");
			}while(result1.next());
			out.print("</table>");
		}
		else
		{
			out.print("No bids on active auctions");
			out.print("<br>");
			out.print("<br>");
		}
			out.print("<br>");
			out.print("Set Manual Bid");
			out.print("<br>");
			out.print("<form method='post' action='manualbid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Amount (Must be greater than or equal to starting price of auction):</td><td><input type='text' name='amount' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Set'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.println("Update Manual Bid");
			out.print("<br>");
			out.print("<form method='post' action='updatebid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>New Amount:</td><td><input type='text' name='newamount' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Update'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			out.print("Start Automatic Bidding");
			out.print("<br>");
			out.print("<form method='post' action='autobid.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Initial Amount (Must be greater than or equal to starting price of auction):</td><td><input type='text' name='initamount' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Upper Limit:</td><td><input type='text' name='upperlim' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Start'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			//close the connection.
		}
		else {
			Statement stmt2 = con.createStatement();
			String str2 = "SELECT current_timestamp";
			ResultSet result2 = stmt2.executeQuery(str2);
			result2.next();
			String currtime = result2.getString(1);
			out.print("No active auctions as of ");
			out.print(result2.getString(1));
			out.println("<script>alert('No active auctions as of " + currtime + "; window.location.href = 'buyer.jsp';</script>");
			out.print("<br>");
			out.print("<br>");
		}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	%>
		
</body>
</html>