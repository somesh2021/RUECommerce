<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Cart</title>
</head>
<body>
	<h1>Cart</h1>
	
	<%
	Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
	if(cart == null || cart.isEmpty()) {
		out.println("<p>Your cart is empty</p>");
	} else {
		out.println("<table>");
		out.println("<tr><th>Product</th><th>Quantity</th></th>");
		for (Map.Entry<String, Integer> entry : cart.entrySet()) {
			String product = entry.getKey();
			int quantity =entry.getValue();
			out.println("<tr><td>" + product + "</td><td>" + quantity + "</td></tr>");
		}
		out.println("</table>");
		
		out.println("<p><a href=\"checkout.jsp\">Proceed to Checkout</a></p>");
	}
	
	%>
	<p><a href="products.jsp">Continue Shopping</a></p>
</body>
</html>