<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alerts</title>
</head>
<body>
	<%

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		out.print("Alerts");
		out.print("<br>");
		out.print("<br>");
		//Create a SQL statement
		Statement stmt = con.createStatement();
		String username = (String)session.getAttribute("user");
		//Get parameters from the HTML form at the HelloWorld.jsp
		String str = "select a.aucid, b.amount, a.username, b.username, a.apid from bids b, auctions a where b.amount >= (select max(b.amount) from bids b where b.aucid=a.aucid) and b.aucid=a.aucid and (b.amount > a.minprice or a.minprice is null) and a.closing < current_timestamp() and b.aucid not in (select aucid from winners) and b.username=" + "'" + username + "'";
		ResultSet result = stmt.executeQuery(str);
		Statement stmt1 = con.createStatement();
		String str1 = "select * from bids b1 where b1.amount > (select b.amount from bids b, auctions a where b.username=" + "'" + username + "' and b.bidtype='Manual' and b.aucid=b1.aucid and b.aucid=a.aucid and a.closing >= current_timestamp()) and b1.username!='" + username + "'";
		ResultSet result1 = stmt1.executeQuery(str1);
		Statement stmt2 = con.createStatement();
		String str2 = "select b1.aucid, b1.username, b1.amount from bids b1 where b1.amount > (select b.upperlim from bids b, auctions a where b.username=" + "'" + username + "' and b.bidtype='Automatic' and b.aucid=b1.aucid and b.aucid=a.aucid and a.closing >= current_timestamp()) and b1.username!='" + username + "'";
		ResultSet result2 = stmt2.executeQuery(str2);
		Statement stmt3 = con.createStatement();
		String str3 = "select al.name, al.username, a.aucid from alerts al, auctions a, apparel ap where al.name=ap.name and ap.apid=a.apid and a.closing >= current_timestamp() and al.username= '" + username + "'";
		ResultSet result3 = stmt3.executeQuery(str3);
		if(result.next())
		{
			do
			{
				int aucid = result.getInt(1);
				float amount = result.getFloat(2);
				String suser = result.getString(3);
				String buser = result.getString(4);
				int apid = result.getInt(5);
				String insert = "INSERT INTO winners VALUES (?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setInt(1, aucid);
				ps.setString(2, suser);
				ps.setString(3, buser);
				ps.setFloat(4, amount);
				ps.setInt(5, apid);
				ps.executeUpdate();
				out.print("You have won auction #" + aucid + " with a bid amount of $" + amount + ".");
				out.print("<br>");
				out.print("<br>");
			}while(result.next());
			
		}
		if(result1.next())
		{
			do
			{
				int aucid = result1.getInt(2);
				String user2 = result1.getString(3);
				float high = result1.getFloat(4);
				out.print("User " + user2 + " has placed a bid of $" + high + " on auction #" + aucid);
				out.print("<br>");
				out.print("<br>");
			}while(result1.next());
		}
		if(result2.next())
		{
			do
			{
				int aucid = result2.getInt(1);
				String user2 = result2.getString(2);
				float high = result2.getFloat(3);
				out.print("User " + user2 + " has placed a bid on auction #" + aucid + " with a bid of $" + high + " which is higher than your upper limit for that auction.");
				out.print("<br>");
				out.print("<br>");
			}while(result2.next());
		}
		if(result3.next())
		{
			do{
				String name = result3.getString(1);
				int aucid = result3.getInt(3);
				out.print(name + " is now available in auction #" + aucid + ".");
				out.print("<br>");
				out.print("<br>");
			}while(result3.next());
			
		}
		else
		{
			out.print("No new alerts");
			out.print("<br>");
			out.print("<br>");
		}
		out.print("<a href='features.jsp'>Return</a>");
		

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	
%>
</body>
</html>