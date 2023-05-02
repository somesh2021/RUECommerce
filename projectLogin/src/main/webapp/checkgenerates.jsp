<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Report</title>
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

        <li><a href="AdminStaff.jsp">Return to Admin Portal</a></li>
		
		
      </ul>

    </nav>



<%
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement state = con.createStatement();
		String str = "";
		String result = request.getParameter("command");
		
		if(result.equals("totalEarnings")){
			str="select sum(amount) as amount from winners";
			ResultSet a = state.executeQuery(str);
			if(a.next()){
				float sum = a.getFloat("amount");
  				out.print("Total Earnings: $" + sum);
  				out.print("<br>");
				out.print("<br>");
				out.println("<a href='AdminStaff.jsp'>Return</a>");
			}
			else
			{
				out.print("No total earnings available");
				out.print("<br>");
				out.print("<br>");
				out.println("<a href='AdminStaff.jsp'>Return</a>");
			}
			
		}
		else if(result.equals("earningsPerItem")){
			str = "select a.name as name, sum(w.amount) as amount from apparel a, winners w where w.apid=a.apid group by a.name";
			ResultSet c = state.executeQuery(str);
			if(c.next()){
				out.print("Earnings per Item");
				out.print("<br>");
				out.print("<table>");
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print("Apparel Name ");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print(" Earnings ");
				out.print("</td>");
				out.print("</tr>");
				do{
					float earnings = c.getFloat("amount");
					String name = c.getString("name");
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar or beer name:
					out.print(name);
					out.print("</td>");
					out.print("<td>");
					out.print("$" + earnings);
					out.print("</td>");
				}while(c.next());
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				out.println("<a href='AdminStaff.jsp'>Return</a>");
				
			}
			else
			{
				out.print("No earnings per item available");
				out.print("<br>");
				out.print("<br>");
				out.println("<a href='AdminStaff.jsp'>Return</a>");
			}
			
		}
		else if(result.equals("earningPerItemType")){
			str = "select a.type as type, sum(w.amount) as amount from winners w, apparel a where w.apid = a.apid group by a.type";
			ResultSet c = state.executeQuery(str);
			if(c.next()){
				out.print("Earnings per Item Type");
				out.print("<br>");
				out.print("<table>");
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print("Apparel Type ");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print(" Total Earnings ");
				out.print("</td>");
				out.print("</tr>");
				do{
					float earnings = c.getFloat("amount");
					String type = c.getString("type");
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar or beer name:
					out.print(type);
					out.print("</td>");
					out.print("<td>");
					out.print("$" + earnings);
					out.print("</td>");
				}while(c.next());
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				
			}
			else
			{
				out.print("No earnings per item type available");
				out.print("<br>");
				out.print("<br>");
			}
			
		}
		else if(result.equals("earningPerEndUser")) {

			str = "select seller, sum(amount) as amount from winners group by seller";
			ResultSet b = state.executeQuery(str);
			if (b.next())
			{
				out.print("Earnings per End User");
				out.print("<br>");
				out.print("<table>");
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print("Seller Username ");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print(" Total Earnings ");
				out.print("</td>");
				out.print("</tr>");
			do{
				
				String seller = b.getString("seller");
				float totalProfit = b.getFloat("amount");
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar or beer name:
				out.print(seller);
				out.print("</td>");
				out.print("<td>");
				out.print("$" + totalProfit);
				out.print("</td>");
				
			}while(b.next());
			out.print("</table>");
			out.print("<br>");
			out.print("<br>");
			
			}
			else{
				out.print("No earnings per end user available");
				out.print("<br>");
				out.print("<br>");
				
			}
		}
		else if(result.equals("bestSellingItems")){
			
			str = "select a.name, sum(w.amount) as amount from apparel a, winners w where w.apid=a.apid group by a.name order by amount desc limit 3"; 
			ResultSet d = state.executeQuery(str); 
			if(d.next()){
				out.print("Top 3 Best Selling Items");
				out.print("<br>");
				out.print("<table>");
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print("Apparel Name ");
				out.print("</td>");
				//make a column
				out.print("<td>");
				out.print(" Earnings ");
				out.print("</td>");
				out.print("</tr>");
				do{
					String name = d.getString("name"); 
					float earnings = d.getInt("amount");  
					out.print("<tr>");
					//make a column
					out.print("<td>");
					//Print out current bar or beer name:
					out.print(name);
					out.print("</td>");
					out.print("<td>");
					out.print("$" + earnings);
					out.print("</td>");
				}while(d.next());
				out.print("</table>");
				out.print("<br>");
				out.print("<br>");
				
			}
			else{
				out.print("No best selling items available");
				out.print("<br>");
				out.print("<br>");
				
			}
		}
		else {
				str = "select buyer, count(buyer) as count from winners group by buyer order by count desc limit 3";
				ResultSet b = state.executeQuery(str);
				if(b.next())
				{
					out.print("Top 3 Best Buyers");
					out.print("<br>");
					out.print("<table>");
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print("Buyer Username ");
					out.print("</td>");
					//make a column
					out.print("<td>");
					out.print(" Number of Auctions Won ");
					out.print("</td>");
					out.print("</tr>");
					do{
						String buyer = b.getString("buyer");
						int count = b.getInt("count");
						out.print("<tr>");
						//make a column
						out.print("<td>");
						//Print out current bar or beer name:
						out.print(buyer);
						out.print("</td>");
						out.print("<td>");
						out.print(count);
						out.print("</td>");
					}while(b.next());
					out.print("</table>");
					out.print("<br>");
					out.print("<br>");
					
				}
				else
				{
					out.print("No best buyers available");
					out.print("<br>");
					out.print("<br>");
					
				}
		}
		con.close();
		//winners(aucid int, username, apid int, amount float)
				//winners.apid = apparel.apid, 

				//select sum(winner.price) from winners where winner.apid = apparel.apid
				
				//best selling item
				//select winner.suser, sum(winnner.amount) from winner as winner group by winner.suser
				
				//Someshwar Ramesh Babu to Everyone (6:42 PM)
				//questions(qid int, question varchar(200), username varchar(20))
				
				//Someshwar Ramesh Babu to Everyone (6:45 PM)
				//replies(qid int, reply varchar(200), cruser varchar(20))
				
			//	Me to Everyone (6:45 PM)
				//Earnings per Item Type
				//sum(winner.amount) from winners where winner.type = apparel.type group by apparel.type
%>
		
		
		