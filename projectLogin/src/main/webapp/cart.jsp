<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Shopping Cart</title>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
		<script>
			
				function increment(id, quantity, price, accumulatedPrice){
					
						alert("Id: "+id);
						alert("Quant: "+quantity);
						alert("Price: "+price);
						alert("Accumulated Price: "+accumulatedPrice);
						
						/* Conntect to DB, update DB, and  refresh */
				}
			
		</script>
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
.cart-item {
  display: flex;
  align-items: center;
  padding: 16px;
  border-bottom: 1px solid #ddd;
}

.cart-item img {
  width: 100px;
  margin-right: 16px;
}

.cart-item-details {
  flex: 1;
}

.cart-item-name {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 8px;
  font-family: Montserrat, sans-serif;
}

.cart-item-size,
.cart-item-color,
.cart-item-price {
  font-size: 16px;
  margin-bottom: 8px;
  font-family: Montserrat, sans-serif;
}

.cart-item-quantity {
  display: flex;
  align-items: center;
}

.cart-item-quantity-value {
  font-size: 16px;
  margin-right: 8px;
  font-family: Montserrat, sans-serif;
}

.cart-item-quantity-button {
  font-size: 16px;
  font-weight: bold;
  padding: 8px 16px;
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  border-radius: 4px;
  cursor: pointer;
  font-family: Montserrat, sans-serif;
}

.cart-item-quantity-button:hover {
  background-color: #ddd;
}
.order-total {
  margin-top: 20px;
  border-top: 1px solid #ddd;
  padding-top: 10px;
  font-size: 18px;
  font-weight: bold;
  text-align: center;
  align-items: center;
}
body {
			font-family: Montserrat, sans-serif;
			margin: 0;
			padding: 0;
		}
	.place-order-btn {
  display: block;
  margin: 0 auto;
  padding: 12px 24px;
  font-size: 16px;
  font-weight: 600;
  line-height: 1.5;
  text-align: center;
  text-decoration: none;
  white-space: nowrap;
  background-color: #007bff;
  border-radius: 4px;
  color: #fff;
  transition: background-color 0.2s ease-in-out;
}

.place-order-btn:hover {
  background-color: #0069d9;
}

.place-order-btn:active {
  background-color: #0053ba;
}

.place-order-btn:focus {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
  outline: none;
}
	</style>
	<body>

<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Shopping Cart</h4>

      </div>

		<%String username = (String)session.getAttribute("user"); %>
      <ul class="nav-links">

        <li><a href="loggedInHome.jsp">Home</a></li>
        
        <li><a class="active" href="cart.jsp"><img src="https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/78045/shopping-cart-clipart-md.png" alt="Shopping Cart" style="width:42px;height:42px;"></a></li>
        
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
    
  
<br>
<br>

		<%
		
	
		

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM cart where username='" + username + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			double orderTotal = 0;
			
			
			if(result.next()){
			
			do{
				
				
					
					int id = result.getInt("item_id");
					int quantity = result.getInt("quantity");
					float price =  result.getFloat("price");
					
					
					//Create a SQL statement
					Statement stmt2 = con.createStatement();
					
					//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
					String str2 = "SELECT * FROM items WHERE itemid="+id;
					//Run the query against the database.
					ResultSet result2 = stmt2.executeQuery(str2);
					
							
					
					if (result2.next()){
						
						do{
							String color = result2.getString("color");
							String name = result2.getString("name");
							String imgURL = result2.getString("image_url");
							double productPrice = result2.getFloat("price");
							String size = result2.getString("size");
							String tags = result2.getString("tags");
							orderTotal += price;
							
							out.print("<div class='cart-item'>");
							out.print("<img src='" + imgURL + "'>");
							out.print("<div class='cart-item-details'>");
							out.print("<div class='cart-item-name'>" + name + "</div>");
							out.print("<div class='cart-item-size'>" + size + "</div>");
							out.print("<div class='cart-item-color'>" + color + "</div>");
							out.print("<div class='cart-item-price'>$" + price + "</div>");
							out.print("<div class='cart-item-quantity'>");
							out.print("<span class='cart-item-quantity-value'>" + quantity + "</span>");
							out.print("<form method='post' action='addToShoppingCart.jsp'>");
							out.print("<input type='hidden' name='item_id' value='" + id + "'>");
							out.print("<input type='hidden' name='quantity' value='" + quantity + "'>");
							out.print("<input type='hidden' name='quantxprice' value='" + price + "'>");
							out.print("<button class='cart-item-quantity-button' type='submit'>+</button>");
							out.print("</form>");
							out.print("<form method='post' action='removeFromShoppingCart.jsp'>");
							out.print("<input type='hidden' name='item_id' value='" + id + "'>");
							out.print("<input type='hidden' name='quantity' value='" + quantity + "'>");
							out.print("<input type='hidden' name='quantxprice' value='" + price + "'>");
							out.print("<button class='cart-item-quantity-button' type='submit'>-</button>");
							out.print("</form>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							
					}while(result2.next());
				
				}
					
			}while(result.next());
			out.print("<div class='order-total'>");
			out.print("<div class='order-total-label'>Order Total:</div>");
			out.print("<div class='order-total-amount'>$" + orderTotal + "</div>");
			out.print("</div>");
			%>
			<form method="post" action="placeOrder.jsp">
  <input type="hidden" name="total" value="<%=orderTotal%>">
  <button class="place-order-btn" type="submit">Place Order</button>
</form>
			<%
			
		
			}else{
				out.println("<script>alert('No items in cart.'); window.location.href = 'loggedInHome.jsp';</script>");
			}
			
			

			//close the connection.
			con.close();

		
	%>
		
	
	
	

</body>
</html>