<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link

      href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"

      rel="stylesheet"

    />

    <link rel="stylesheet" href="style.css" />
</head>
<body>
<nav>

      <div class="heading">

        <h4>RU E-Commerce</h4>

      </div>

      <ul class="nav-links">

        <li><a href="HelloWorld.jsp">Home</a></li>

        <li><a href="pages/services.html">Services</a></li>

        <li><a href="pages/contact.html">Contact</a></li>
        
        <li><a class="active" href="loginStylePage.jsp">Login/Register</a></li>

      </ul>

    </nav>


<h2>Login Page</h2><br>
    <div class="login">
    <form id="login" method="get" action="singleLogin.jsp">
        <label><b>User Name
        </b>
        </label>
        <input type="text" name="username" id="username" placeholder="Username">
        <br><br>
        <label><b>Password
        </b>
        </label>
        <input type="Password" name="password" id="password" placeholder="Password">
        <br><br>
        <input type="submit" value="Login">
        <br><br>
        <br><br>
        Forgot <a href="#">Password</a>
    </form>
</div>

</body>
</html>