<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Rep Portal</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet"/>

    <link rel="stylesheet" href="style.css" />
</head>
<style>
table {
  font-family: 'Montserrat', sans-serif;
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

thead {
  background-color: #333;
  color: #fff;
}

th {
  border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}
body {
			font-family: 'Montserrat', sans-serif;
		}
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


</style>
<body>
<nav>

		 <div class="logo">
    	<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Rutgers_Scarlet_Knights_logo.svg/2319px-Rutgers_Scarlet_Knights_logo.svg.png" alt="Logo">
  	  </div>
      <div class="heading">

        <h4>RU E-Commerce Customer Rep Portal</h4>

      </div>

		<%String username = (String)session.getAttribute("user"); %>
      <ul class="nav-links">

        <li><a class="active" href="CustomerRep.jsp">Home</a></li>
        
        <li><a href="logout.jsp">Log out</a></li>
        
        <li> <button class="dropbtn">User: <%= username %></button></li>
		
		
      </ul>

    </nav>


	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		out.print("<br>");
		out.print("<br>");
		
	    
		try {
	
			//Get the database connection	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "select * from questions where qid not in (select qid from replies)";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			Statement stmt1 = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str1 = "SELECT * from bids";
			//Run the query against the database.
			ResultSet result1 = stmt1.executeQuery(str1);
			//Create a SQL statement
			Statement stmt2 = con.createStatement();
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str2 = "SELECT * from auctions";
			//Run the query against the database.
			ResultSet result2 = stmt2.executeQuery(str2);
			
			
	if(result.next())
		{
			//Make an HTML table to show the results in:
			out.print("<h2>Unanswered Questions</h2>");
			out.print("<br>");
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Question ID ");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print(" Posted By ");
			out.print("</td>");
			out.print("<td>");
			out.print(" Question ");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			do{
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(result.getInt("qid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("username"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");
				out.print("<td>");

			}while(result.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
			out.println("<h2>Answer Question</h2>");
			out.print("<br>");
			out.print("<form method='post' action='ansq.jsp'>");
			out.print("<table>");
			out.print("<tr>");
			out.print("<td>Question ID:</td><td><input type='text' name='qid' required></td>");
			out.print("</tr>");
			out.print("<tr>");
			out.print("<td>Reply (max 300 chars):</td><td><input type='text' name='reply' required></td>");
			out.print("</tr>");
			out.print("</table>");
			out.print("<input type='submit' value='Submit'>");
			out.print("</form>");
			out.print("<br>");
			out.print("<br>");
			//close the connection.
		}
		else {
			
			out.print("<h2>No unanswered questions</h2>");
			out.print("<br>");
			out.print("<br>");
		}
	
	if(result1.next())
	{
		//Make an HTML table to show the results in:
		out.print("<h2>All Bids</h2>");
		out.print("<br>");
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Bid ID ");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print(" Auction ID ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Bidder Username ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Bid Amount ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Bid Type ");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		do{
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(result1.getInt("bid_id"));
			out.print("</td>");
			out.print("<td>");
			out.print(result1.getString("aucid"));
			out.print("</td>");
			out.print("<td>");
			out.print(result1.getString("username"));
			out.print("</td>");
			out.print("<td>");
			out.print("$" + result1.getFloat("amount"));
			out.print("</td>");
			out.print("<td>");
			out.print(result1.getString("bidtype"));
			out.print("</td>");
			out.print("<td>");

		}while(result1.next());
		out.print("</table>");
		out.print("<br>");
		out.print("<br>");
		out.println("<h2>Delete Bid</h2>");
		out.print("<br>");
		out.print("<form method='post' action='deletebid.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Bid ID:</td><td><input type='text' name='bid_id' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		//close the connection.
	}
	else {
		
		out.print("<h2>No bids</h2>");
		out.print("<br>");
		out.print("<br>");
	}
	if(result2.next())
	{
		//Make an HTML table to show the results in:
		out.print("<h2>All Auctions</h2>");
		out.print("<br>");
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Auction ID ");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print(" Apparel ID ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Seller Username ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Initial Price ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Increment ");
		out.print("</td>");
		out.print("<td>");
		out.print(" Closing Date/Time ");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results
		do{
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current bar or beer name:
			out.print(result2.getInt("aucid"));
			out.print("</td>");
			out.print("<td>");
			out.print(result2.getString("apid"));
			out.print("</td>");
			out.print("<td>");
			out.print(result2.getString("username"));
			out.print("</td>");
			out.print("<td>");
			out.print("$" + result2.getFloat("initial_price"));
			out.print("</td>");
			out.print("<td>");
			out.print("$" + result2.getFloat("increment"));
			out.print("</td>");
			out.print("<td>");
			out.print(result2.getTimestamp("closing"));
			out.print("</td>");
			out.print("<td>");

		}while(result2.next());
		out.print("</table>");
		out.print("<br>");
		out.print("<br>");
		out.println("<h2>Delete Auction</h2>");
		out.print("<br>");
		out.print("<form method='post' action='dauction.jsp'>");
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>Auction ID:</td><td><input type='text' name='aucid' required></td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<input type='submit' value='Submit'>");
		out.print("</form>");
		out.print("<br>");
		out.print("<br>");
		//close the connection.
	}
	else {
		
		out.print("<h2>No auctions</h2>");
		out.print("<br>");
		out.print("<br>");
	}
		db.closeConnection(con);
		}
		catch (Exception e) {
			out.print(e);
		}
	
		

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>