<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buyer Portal</title>

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
body {
			font-family: 'Montserrat', sans-serif;
		}

		.container {
			display: flex;
			justify-content: space-between;
			align-items: center;
			margin: 0 auto;
			max-width: 1200px;
			padding: 20px;
		}

		form {
			background-color: #f2f2f2;
			border-radius: 10px;
			flex-basis: 30%;
			padding: 20px;
			box-sizing: border-box;
		}

		form input[type="submit"], form input[type="reset"] {
			background-color: #4CAF50;
			border: none;
			border-radius: 5px;
			color: white;
			cursor: pointer;
			padding: 10px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			transition-duration: 0.4s;
		}

		form input[type="submit"]:hover, form input[type="reset"]:hover {
			background-color: #3e8e41;
		}

		form input[type="text"], form select, form input[type="number"] {
			padding: 10px;
			border: none;
			border-radius: 5px;
			box-sizing: border-box;
			width: 100%;
			margin-bottom: 10px;
			font-size: 16px;
		}

		form label {
			display: block;
			font-weight: bold;
			margin-bottom: 5px;
		}
</style>
</head>
<body>
<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Buyer Portal</h4>

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

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		out.print(username + "'s Buyer Portal");
		out.print("<br>");
		out.print("<br>");
		
		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the HelloWorld.jsp
		out.println("<a href='viewAllApparels.jsp'>View All Apparel</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='auction1.jsp'>See Active Auctions and Bids</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='pastauction.jsp'>See Past Auctions</a>");
		out.print("<br>");
		out.print("<br>");
		out.println("<a href='similaritems.jsp'>See Auction History for Similar Items in the Past Month</a>");
		out.print("<br>");
		out.print("<br>");
		%>
		    <div class="navbar">
    <h2>Search for Shirts</h2>
  </div>

  <div class="form-container">
    <form action='viewShirts.jsp'>
      <label for="color">Color:</label>
      <input type='text' name='color' id='color' placeholder='Enter color' required><br><br>

      <label for="size">Size:</label>
      <select name='size' id='size'>
        <option value='XS'>XS</option>
        <option value='S'>S</option>
        <option value='M'>M</option>
        <option value='L'>L</option>
        <option value='XL'>XL</option>
        <option value='XXL'>XXL</option>
      </select><br><br>

      <input type='submit' value='View'>
    </form>
<h2>Search for Shoes</h2>
    <form action='viewShoes.jsp'>
      <label for="color">Color:</label>
      <input type='text' name='color' id='color' placeholder='Enter color' required><br><br>

      <label for="size">Size:</label>
      <input type="number" name="size" id="size" min="1" max="50" required><br><br>

      <input type='submit' value='View'>
    </form>
<h2>Search for Pants</h2>
<form action='viewPants.jsp'>
        Color: <input type='text' name='color' id='color' placeholder='Enter Color' required>
        <br><br>
        <label for="waist">Waist:</label>
        
        <select name="waist" required>

            <option value="28" >28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
            <option value="32">32</option>
            <option value="33">33</option>
            <option value="34">34</option>
            <option value="35">35</option>
            <option value="36">36</option>
            <option value="37">37</option>
            <option value="38">38</option>
            <option value="39">39</option>
            <option value="40">40</option>
            <option value="41">41</option>
            <option value="42">42</option>
            <option value="43">43</option>
            <option value="44">44</option>
            <option value="45">45</option>
            <option value="46">46</option>
            <option value="47">47</option>
            <option value="48">48</option>
            <option value="49">49</option>
            <option value="50">50</option>


        



        </select> 

        <label for="length">Length:</label>
        
        <select name="length" required>

            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
            <option value="32">32</option>
            <option value="33">33</option>
            <option value="34">34</option>
            <option value="35">35</option>
            <option value="36">36</option>
            <option value="37">37</option>
            <option value="38">38</option>
            <option value="39">39</option>
            <option value="40">40</option>
            <option value="41">41</option>
            <option value="42">42</option>
            <option value="43">43</option>
            <option value="44">44</option>
            <option value="45">45</option>
            <option value="46">46</option>
            <option value="47">47</option>
            <option value="48">48</option>
            <option value="49">49</option>
            <option value="50">50</option>

        </select>


        <br><br>

        <input type="submit" value="View">
</form>
  </div>
		<%
		out.println("<h2>See History of Bids for any Auction</h2>");
		out.print("<br>");
		out.print("<form method='post' action='bidhistory.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		out.println("<h2>See Auction History for any User</h2>");
		out.print("<br>");
		out.print("<form method='post' action='userhistory.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Username:</td><td><input type='text' name='username' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>


</body>
</html>