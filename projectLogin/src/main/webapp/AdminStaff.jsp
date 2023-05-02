<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Portal</title>
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
.form-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-family: "Montserrat", sans-serif;
  background-color: #f1f1f1;
  padding: 20px;
}

h2 {
  font-size: 24px;
  text-transform: uppercase;
  letter-spacing: 5px;
  margin-bottom: 20px;
}

form {
  width: 50%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

table {
  width: 100%;
  border-collapse: collapse;
}

td {
  padding: 10px;
  text-align: left;
  font-weight: bold;
}

input[type="text"],
input[type="password"],
input[type="email"] {
  width: 100%;
  padding: 10px;
  margin: 5px 0;
  border: none;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type="submit"] {
  background-color: #4caf50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  margin-top: 20px;
}
.radio-group {
  display: flex;
  flex-direction: row;
  align-items: flex-start;
  margin-top: 20px;
}

.radio-group input[type="radio"] {
  display: none;
}

.radio-group label {
  font-size: 18px;
  padding: 10px;
  margin-right: 20px;
  color: #333;
  border-radius: 5px;
  border: 2px solid #4CAF50;
  cursor: pointer;
}

.radio-group label:hover {
  background-color: #4CAF50;
  color: white;
}

.radio-group input[type="radio"]:checked + label {
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Admin Portal</h4>

      </div>

		<%String username = (String)session.getAttribute("user"); %>
      <ul class="nav-links">

        <li><a class="active" href="AdminStaff.jsp">Home</a></li>
        
        <li><a href="logout.jsp">Log Out</a></li>
 
      <button class="dropbtn">User: <%= username %></button>
     
		
		
      </ul>

    </nav>


<div class="form-container">
  <h2>Create Customer Representative Account</h2>
  <form method="post" action="insertCustRep.jsp">
    <table>
      <tr>
        <td>Username:</td>
        <td><input type="text" name="username" required></td>
      </tr>
      <tr>
        <td>Password:</td>
        <td><input type="password" name="password" required></td>
      </tr>
      <tr>
        <td>Name:</td>
        <td><input type="text" name="name" required></td>
      </tr>
      <tr>
        <td>Email:</td>
        <td><input type="email" name="email" required></td>
      <tr>
    </table>
    <input type="submit" value="Submit">
  </form>
</div>


<div class="form-container">
<form method="get" action="checkgenerates.jsp">
	<h2>Generate Sales Report for Auction Items</h2>
	<div class="radio-group">
		<input type="radio" id="total-earnings" name="command" value="totalEarnings" required>
		<label for="total-earnings">Total Earnings</label>
		<br>
		<input type="radio" id="earnings-per-item" name="command" value="earningsPerItem">
		<label for="earnings-per-item">Earning per Item</label>
		<br>
		<input type="radio" id="earning-per-item-type" name="command" value="earningPerItemType">
		<label for="earning-per-item-type">Earning per Item Type</label>
		<br>
		<input type="radio" id="earning-per-end-user" name="command" value="earningPerEndUser">
		<label for="earning-per-end-user">Earning per End-User</label>
		<br>
		<input type="radio" id="best-selling-items" name="command" value="bestSellingItems">
		<label for="best-selling-items">Best Selling Items</label>
		<br>
		<input type="radio" id="best-buyer" name="command" value="bestBuyer">
		<label for="best-buyer">Best Buyer</label>
		<br>
	</div>
	<input type="submit" value="Submit">
</form>
</div>
	

</body>
</html>
