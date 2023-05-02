<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shirt Inputs</title>
</head>
<body>
	<h1>Select preferences for Shirts</h1>
	
	<form action='viewShirts.jsp'>Color: <input type='text' name='color' id='' placeholder='Enter color' required><br><br>Size: <select name='size' id=''><option value='XS'>XS</option><option value='S'>S</option><option value='M'>M</option><option value='L'>L</option><option value='XL'>XL</option><option value='XXL'>XXL</option></select><br><br> <input type='submit' value='View'></form>
	<br>
	<br>
	<a href="buyer.jsp">Return</a>
	
	    
		
	
	

</body>