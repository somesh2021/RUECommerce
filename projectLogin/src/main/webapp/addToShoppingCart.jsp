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



quantity++;

quantPrice+=itemPrice;


//Get the database connection
ApplicationDB db = new ApplicationDB();	
Connection con = db.getConnection();	

//Create a SQL statement
Statement stmt = con.createStatement();

//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
String str = "UPDATE cart SET quantity= '"+quantity+"', price = '"+quantPrice+"' WHERE item_id="+itemID;
//Run the query against the database.
try{
	 int result = stmt.executeUpdate(str);
	response.sendRedirect("cart.jsp");
}catch(Exception e){
	out.print("Err.."+e);
}





	
%>


</body>
</html>