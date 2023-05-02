<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<%
  

	Integer itemID = Integer.parseInt(request.getParameter("item_id"));

Integer quantity = Integer.parseInt(request.getParameter("quantity"));

Double quantPrice = Double.parseDouble(request.getParameter("quantxprice"));

Double itemPrice = quantPrice/quantity;



quantity--;

quantPrice-=itemPrice;


//Get the database connection
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();	

//Create a SQL statement
Statement stmt = con.createStatement();

String str;


if(quantity==0){
	str = "DELETE FROM cart WHERE item_id="+itemID;
	int result = stmt.executeUpdate(str);
}else{
	
	str = "UPDATE cart SET quantity= '"+quantity+"', price = '"+quantPrice+"' WHERE item_id="+itemID;
	int result = stmt.executeUpdate(str);
}


	 
	response.sendRedirect("cart.jsp");






	
%>


</body>
</html>