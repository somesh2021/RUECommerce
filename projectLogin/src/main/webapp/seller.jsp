<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Portal</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
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
 .container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-family: 'Montserrat', sans-serif;
}

form {
  background-color: #f7f7f7;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  width: 45%;
}

label {
  display: block;
  margin-bottom: 10px;
  font-size: 16px;
  font-weight: bold;
}

input[type='text'], input[type='submit'] {
  display: block;
  width: 100%;
  padding: 10px;
  border: none;
  border-radius: 5px;
  margin-bottom: 10px;
  font-size: 16px;
}

input[type='submit'] {
  background-color: #007bff;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

input[type='submit']:hover {
  background-color: #0069d9;
}

table {
  width: 100%;
}

td {
  padding: 10px;
}
 body {
			font-family: 'Montserrat', sans-serif;
		}
 </style>
</head>
<body>
<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Seller Portal</h4>

      </div>

		<%String username = (String)session.getAttribute("user"); %>
      <ul class="nav-links">

        <li><a href="loggedInHome.jsp">Home</a></li>
       
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
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		out.print("Start New Auction for Shirts");
		out.print("<br>");
		out.print("<form method='post' action='shirtauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Shirt Name (Ex: Hollister T-Shirt):</td><td><input type='text' name='name' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shirt Size (S-XL):</td><td><input type='text' name='size' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shirt Color:</td><td><input type='text' name='color' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Starting Price: $</td><td><input type='text' name='initial_price' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Reserve: $</td><td><input type='text' name='minprice' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Increment: $</td><td><input type='text' name='increment' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Closing Date/Time (YYYY-MM-DD HH:MM:SS):</td><td><input type='text' name='closing' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("Start New Auction for Pants");
		out.print("<br>");
		out.print("<form method='post' action='pantauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Pant Name (Ex: Hollister Jeans):</td><td><input type='text' name='name' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Pant Waist Size:</td><td><input type='text' name='waist' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Pant Length:</td><td><input type='text' name='length' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Pant Color:</td><td><input type='text' name='color' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Starting Price: $</td><td><input type='text' name='initial_price' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Reserve: $</td><td><input type='text' name='minprice' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Increment: $</td><td><input type='text' name='increment' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Closing Date/Time (YYYY-MM-DD HH:MM:SS):</td><td><input type='text' name='closing' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.print("Start New Auction for Shoes");
		out.print("<br>");
		out.print("<form method='post' action='shoeauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Shoe Name (Ex: Nike Air Force):</td><td><input type='text' name='name' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shoe Size:</td><td><input type='text' name='size' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Shoe Color:</td><td><input type='text' name='color' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Starting Price: $</td><td><input type='text' name='initial_price' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Reserve: $</td><td><input type='text' name='minprice' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Minimum Increment: $</td><td><input type='text' name='increment' required></td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>Closing Date/Time (YYYY-MM-DD HH:MM:SS):</td><td><input type='text' name='closing' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Start'>");
		out.print("</form>");
		out.print("<br>");
		
	} catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>