<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Settings</title>
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
  font-family: "Montserrat", sans-serif;
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin: 50px auto;
  max-width: 600px;
  text-align: center;
}

.container h1 {
  font-size: 36px;
  text-transform: uppercase;
  letter-spacing: 5px;
  margin-bottom: 20px;
  color: #4caf50;
}

.container p {
  font-size: 18px;
  color: black;
  margin-bottom: 10px;
}

.container input[type=text], .container input[type=password] {
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 5px;
  border: none;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.container input[type=submit] {
  background-color: #4caf50;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  cursor: pointer;
  font-weight: bold;
  transition: background-color 0.2s ease-in-out;
}

.container input[type=submit]:hover {
  background-color: #3e8e41;
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

		<%String username = (String)session.getAttribute("user"); %>
      <ul class="nav-links">

        <li><a href="loggedInHome.jsp">Home</a></li>
        
        <li><a href="cart.jsp"><img src="https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/78045/shopping-cart-clipart-md.png" alt="Shopping Cart" style="width:42px;height:42px;"></a></li>
        
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
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String str = "SELECT * FROM Accounts WHERE username =" + "'"+ username +"'";
	ResultSet result = stmt.executeQuery(str);
	if (result.next()) {
		String name = result.getString("name");
        String email = result.getString("email");
        String password = result.getString("password").replaceAll(".", "*");
    %>
    
    <div class="container">

  <h2>User Settings</h2>

  <div class="user-info">
    <p><strong>Name:</strong> <%= name %></p>
    <p><strong>Username:</strong> <%= username %></p>
    <p><strong>Email:</strong> <%= email %></p>
    <p><strong>Password:</strong> <%= password %></p>
  </div>
  <% 
	}
  %>

  <h3>Update Information</h3>

  <form action="updateUser.jsp" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="new_name"><br><br>
    <label for="username">Username:</label>
    <input type="text" id="username" name="new_username"><br><br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="new_email"><br><br>
    <label for="password">Password:</label>
    <input type="text" id="password" name="new_password"><br><br>
    <input type="submit" value="Update">
  </form>
  
  <br>
  <br>
  <h3>Ask a Question</h3>

  <form action="questions.jsp" method="post">
    <label for="name">Question:</label>
    <input type="text" id="question" name="question"><br><br>
    <input type="submit" value="Submit">
  </form>

</div>
 </body>
</html>