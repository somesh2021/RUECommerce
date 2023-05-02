<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Products Page </title>
</head>
<body>
	<h1>PRODUCTS</h1>
	
	<!-- Product 1 -->
	<div>
		<img src="https://m.media-amazon.com/images/I/51C0Nbg5QNL._SL1500_.jpg" alt="ps5"  width="200" height="200">
		<h2>PS5</h2>
		<p>Gaming Console</p>		
		<p>Price: $500</p>
		<form action = "addtocart.jsp" method = "POST">
			<input type="hidden" name="PS5" value= "ps5">
			<input type="submit" value="Add to Cart">
		</form>	
		
	</div>
	
	<!-- Product 2 -->
	<div>
		<img src="https://m.media-amazon.com/images/I/61IVQMSGLoL._SL1500_.jpg" alt="hair dryer" width="200" height="200">
		<h2>HairDryer</h2>
		<p>Hair Care</p>
		<p>Price: $300</p>
		<form action="addtocart.jsp" method = "POST">
			<input type="hidden" name="HairDryer" value="hairDryer">
			<input type="submit" value="Add to Cart">
		</form>
	
	</div>
	
	<!--  Product 3 -->
	<div>
		<img src="https://m.media-amazon.com/images/I/71PoHntYciL._SL1500_.jpg" alt="wii" width="200" height="200">
		<h2>Wii</h2>
		<p>Gaming Console</p>
		<p>Price: $200</p>
		
		<form action="addtocart.jsp" method = "POST">
			<input type="hidden" name="Wii" value="wii">
			<input type="submit" value="Add to Cart">
		</form>
	</div>
	
	<!--  Product 4 -->
	<div>
		<img src="https://m.media-amazon.com/images/I/51DYKrZGltL.jpg" alt="nintendoDS" width="200" height="200">
		<h2>Nintendo DS</h2>
		<p>Gaming Console</p>
		<p>Price: $200</p>
		
		<form action="addtocart.jsp" method = "POST">
			<input type="hidden" name="NintendoDS" value="nintendoDS">
			<input type="submit" value="Add to Cart">
		</form>
	
	</div>
	
	<!--  Product 5 -->
	<div>
		<img src="https://m.media-amazon.com/images/I/71JHImkRXsL._AC_SX522_.jpg" alt="appleairpodsmax" width="200" height="200">
		<h2>Apple AirPods MAX</h2>
		<p>HeadPhones</p>
		<p>Price: $500</p>
		
		<form action="addtocart.jsp" method = "POST">
			<input type="hidden" name="AppleAirPodsProMax" value="appleairpodsmax">
			<input type="submit" value="Add to Cart">
		</form>
	</div>
</body>
</html>