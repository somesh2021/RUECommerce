<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Register Company</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css" />
<style>
      body {
        font-family: 'Montserrat', sans-serif;
      }
      form {
        background-color: maroon;
        color: white;
        padding: 20px;
        border-radius: 5px;
      }
      label {
        display: block;
        margin-bottom: 10px;
        color: white
      }
      input[type="text"], input[type="email"], input[type="password"], input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 5px;
        border: none;
      }
      button[type="submit"] {
        background-color: green;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        font-size: 16px;
        font-weight: bold;
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
    height: 400px;
}
.popup-content label {
  display: block;
  margin-bottom: 10px;
  font-family: Montserrat;
  font-size: 18px;
  color: white;
}
.popup-content h2 {
    margin-top: 0;
    text-align: center;
}

.popup-content label {
    display: block;
    margin-bottom: 5px;
}
form {
  background-color: maroon;
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
  display: inline-block;
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

        <li><a href="HelloWorld.jsp">Home</a></li>

        <li><a href="company.jsp">Register Company</a></li>

      </ul>

    </nav>
    
 

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
    
    
<form method="post" id = "register-form" action="registerCompany.jsp">
      <h2>Registration Form</h2>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
       <label for="password">Phone Number (XXX-XXX-XXXX):</label>
      <input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
      <button type="submit" id="register-button">Register</button>
    </form>
    
    <div id="popup" class="popup">
  <div class="popup-content">
    <span class="close-button" onclick="hidePopup()">&times;</span>
    <p id="popup-message"></p>
  </div>
</div>


  
</body>
</html>