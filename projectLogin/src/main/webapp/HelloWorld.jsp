<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>RU E-Commerce Application</title>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
    
    <style>
   /* Styling for the search container */
.search-container {
  display: flex;
  align-items: center;
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  margin-bottom: 20px;
}

.search-container input[type="text"] {
  flex: 1;
  padding: 10px;
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
  border: none;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0,0,0,0.2);
  outline: none;
}

.search-container button {
  padding: 10px 20px;
  background-color: #0d6efd;
  color: white;
  border: none;
  border-radius: 5px;
  margin-left: 10px;
  cursor: pointer;
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
}

.sort-container {
  display: inline-block;
  width: 200px; /* adjust the width as needed */
  vertical-align: top;
  font-family: 'Montserrat', sans-serif;
}

.sort-container select {
  width: 180px;
  padding: 10px;
  margin-left: 20px;
  font-family: 'Montserrat', sans-serif;
  border: none;
  border-radius: 0;
  background-color: #f1f1f1;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
}

.sort-container select:focus {
  outline: none;
}

.sort-container select option {
  font-family: 'Montserrat', sans-serif;
  color: #333;
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
.popup-content {
    background-color: maroon;
    margin: 10% auto;
    padding: 20px;
    border-radius: 10px;
    width: 40%;
    position: relative;
    font-family: Montserrat, sans-serif;
    color: white;
    width: 400px;
    height: 300px;
}
.popup-content label {
  display: block;
  margin-bottom: 10px;
  font-family: Montserrat;
  font-size: 18px;
  color: white;
}
.search-btn {
  background-color: #6c757d;
  color: #fff;
  border: none;
  padding: 6px 16px;
  font-size: 16px;
  font-family: 'Montserrat', sans-serif;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.search-btn:hover {
  background-color: #343a40;
}

    </style>
	</head>
	
	<body>
	
		<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce</h4>

      </div>

      <ul class="nav-links">

        <li><a class="active" href="HelloWorld.jsp">Home</a></li>

        <li><a href="company.jsp">Register Company</a></li>
        
        <li><a href="#" id="login-btn">Login</a></li>

      </ul>

    </nav>
    
   
   <div class="popup" id="login-popup">
    <div class="popup-content">
    <button class="close" id="close-btn">&times;</button>
      <form method="POST" action="singleLogin.jsp">
        <h2>Login</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="Login">
      </form>
      <button class="register-btn" id="register-btn" onclick="location.href='registerStyle.jsp'">Register</button>
    </div>
  </div>

	<script>
    var loginBtn = document.getElementById("login-btn");
    var loginPopup = document.getElementById("login-popup");
    var closeBtn = document.getElementById("close-btn");

    loginBtn.onclick = function() {
      loginPopup.style.display = "block";
    }

    closeBtn.onclick = function() {
      loginPopup.style.display = "none";
    }

    window.onclick = function(event) {
      if (event.target == loginPopup) {
        loginPopup.style.display = "none";
      }
    }
  </script>

  
<br>
<br>
<div class="search-container">
  <form action="" method="POST">
		<input type="text" placeholder="Search..." name="search">
		<input type="submit" value="Search" class="search-btn">
		<select name="sort" class="sort-container">
			<option value="name_asc">Name (A to Z)</option>
			<option value="name_desc">Name (Z to A)</option>
			<option value="price_asc">Price (Low to High)</option>
			<option value="price_desc">Price (High to Low)</option>
		</select>
		<input type="submit" value="Sort" class="search-btn">
	</form>
</div>

<div class="product-container">
<div class="product-header">
  </div>
		<% 
			try {
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				String search = request.getParameter("search");
				String sort = request.getParameter("sort");
				String str = "SELECT * from items";
				if(search != null && !search.isEmpty()) {
					str += " WHERE name LIKE '%" + search + "%'";
				}
				if(sort != null && !sort.isEmpty()) {
					if(sort.equals("name_asc")) {
						str += " ORDER BY name ASC";
					} else if(sort.equals("name_desc")) {
						str += " ORDER BY name DESC";
					} else if(sort.equals("price_asc")) {
						str += " ORDER BY price ASC";
					} else if(sort.equals("price_desc")) {
						str += " ORDER BY price DESC";
					}
				}
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(str);
			if(rs.next()) {
				while (rs.next()) {
					%>
						<div class="product">
							<img src="<%= rs.getString("image_url") %>" width="500" height="500">
							<h3><%= rs.getString("name") %></h3>
							<p>Price: $<%= rs.getDouble("price") %></p>
							<p>Color: <%= rs.getString("color") %></p>
							<p>Size: <%= rs.getString("size") %></p>
						</div>
					<%
							}
			}
			else {
				 out.println("<script>alert('No products found.'); window.location.href = 'HelloWorld.jsp';</script>");
			}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</div>

</body>
</html>