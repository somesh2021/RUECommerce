<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Company Portal</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
</head>
<style>
body {
			font-family: 'Montserrat', sans-serif;
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

		form input[type="text"], form select, form input[type="number"], form input[type="url"] {
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
.product-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin-top: 100px; /* added margin for search bar */
}

.product {
  width: 300px;
  margin: 20px;
  background-color: #ffffff;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  padding: 20px;
  text-align: center;
  font-family: 'Montserrat', sans-serif;
}

.product img {
  width: 100%;
  height: 300px;
  object-fit: cover;
  margin-bottom: 10px;
}

.product h3 {
  font-size: 20px;
  margin-bottom: 10px;
}

.product p {
  font-size: 16px;
  margin-bottom: 5px;
}

.product button {
  background-color: #990000;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  margin-top: 10px;
  font-size: 16px;
  font-family: 'Montserrat', sans-serif;
  cursor: pointer;
}
</style>
<body>
<%String username = (String)session.getAttribute("user"); %>
<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Company Portal</h4>

      </div>

      <ul class="nav-links">

        <li><a href="companyPortal.jsp">Home</a></li>
        
        <li><a href="logout.jsp">Log Out</a></li>
        
        <button class="dropbtn">User: <%= username %></button>
		
		
      </ul>

    </nav>
    
    <br>
    <br>
    
    <h2>Add Product</h2>
    <form action='addProduct.jsp'>
      <label for="name">Name:</label>
      <input type='text' name='name' id='name' required><br><br>

      <label for="price">Price:</label>
      <input type="number" step="0.01" name="price" id="price" required><br><br>
      
      <label for="image_url">Image URL:</label>
      <input type='url' name="image_url" id="image_url" required><br><br>
      
      <label for="color">Color:</label>
      <input type='text' name="color" id="color" required><br><br>
      
      <label for="size">Size:</label>
      <input type='text' name="size" id="size" required><br><br>

      <input type='submit' value='Submit'>
    </form>
    <br>
    <h2>Current Products</h2>
	<div class="product-container">
<div class="product-header">
  </div>
		<% 
			try {
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				Statement stmt1 = con.createStatement();

				String query = "SELECT cid FROM companies where username = '" + username + "'";
				ResultSet rs1 = stmt1.executeQuery(query);
				rs1.next();
				int cid = rs1.getInt(1);
				
				String str = "SELECT * from items where companyid=" + cid;
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(str);
			if(rs.next()) {
				do {
					%>
						<div class="product">
							<img src="<%= rs.getString("image_url") %>" width="500" height="500">
							<h3><%= rs.getString("name") %></h3>
							<p>Price: $<%= rs.getDouble("price") %></p>
							<p>Color: <%= rs.getString("color") %></p>
							<p>Size: <%= rs.getString("size") %></p>
						</div>
					<%
							}while(rs.next());
			}
			else {
				 out.println("<h2>No products found</h2>");
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</div>

</body>
</html>