<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>View Orders</title>

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
body {
			font-family: 'Montserrat', sans-serif;
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

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		String str = "SELECT * from orders where username = '" + username + "'";
		ResultSet result = stmt.executeQuery(str);
		
		if(result.next()) {
			out.print("<h2>Order History for User " + username + "</h2>");
			out.print("<br>");
			out.print("<table>");
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Order ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Products ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Order Time ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Order Total ");
			out.print("</td>");
			out.print("</tr>");
			do{
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("order_id"));
				out.print("</td>");
				out.print("<td>");
					out.print("<table>");
						out.print("<tr>");
							out.print("<td>");
								//print out column header
								out.print("Item Name ");
								out.print("</td>");
								//make a column
								out.print("<td>");
								out.print(" Price ");
								out.print("</td>");
								out.print("<td>");
								out.print(" Quantity ");
								out.print("</td>");
						out.print("</tr>");
						Statement stmt2 = con.createStatement();
						String query = "select i.name as 'name', i.price as 'price', oi.quantity as 'quantity' from items i, orders o, orderitems oi where i.itemid=oi.item_id and oi.order_id=o.order_id and o.order_id=" + result.getInt("order_id"); 
						ResultSet result2 = stmt2.executeQuery(query);
						if (result2.next())
						{
						do {
							out.print("<tr>");
							//make a column
							out.print("<td>");
							//Print out current bar or beer name:
							out.print(result2.getString("name"));
							out.print("</td>");
							out.print("<td>");
							//Print out current bar or beer name:
							out.print("$" + result2.getFloat("price"));
							out.print("</td>");
							out.print("<td>");
							//Print out current bar or beer name:
							out.print(result2.getInt("quantity"));
							out.print("</td>");
							out.print("<td>");
						}while (result2.next());
						}
					out.print("</table>");
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("order_time"));
				out.print("</td>");
				out.print("<td>");
				out.print("$" + result.getFloat("total_price"));
				out.print("</td>");
				out.print("<td>");
			}while (result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
		}
		else {
			out.println("<script>alert('No order history.'); window.location.href = 'loggedInHome.jsp';</script>");
		}


%>


</body>
</html>