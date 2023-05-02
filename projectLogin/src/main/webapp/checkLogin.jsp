<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%


			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String user = request.getParameter("username");
			String pw = request.getParameter("password");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM Accounts WHERE username =" + "'"+ user +"'" + " AND password=" + "'" + pw + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			Statement stmt1 = con.createStatement();
			String str1 = "select * from bids b1 where b1.amount > (select b.amount from bids b where b.username='" + user + "' and b.bidtype='Automatic' and b.aucid=b1.aucid) and b1.amount <= (select b.upperlim from bids b where b.username='" + user + "' and b.bidtype='Automatic' and b.aucid=b1.aucid) and b1.username != '" + user + "'";
			ResultSet result1 = stmt1.executeQuery(str1);
			if(result.next())
			{
				session.setAttribute("user", user);
				if(result1.next())
				{
					do
					{
						int aucid = result1.getInt(2);
						float highamount = result1.getFloat(4);
						Statement stmt2 = con.createStatement();
						String str2 = "select * from bids where aucid=" + aucid;
						ResultSet result2 = stmt2.executeQuery(str2);
						result2.next();
						int bid_id = result2.getInt(1);
						Statement stmt3 = con.createStatement();
						String str3 = "select * from auctions where aucid=" + aucid;
						ResultSet result3 = stmt3.executeQuery(str3);
						result3.next();
						float increment = result3.getFloat(6);
						float newbid = highamount + increment;
						String update = "UPDATE bids SET amount = ? WHERE bid_id = ?";
						PreparedStatement ps = con.prepareStatement(update);
						ps.setFloat(1, newbid);
						ps.setInt(2, bid_id);
						ps.executeUpdate();
						
					}while(result1.next());
				}
				response.sendRedirect("loggedInHome.jsp");
			}
			else
			{
				out.print("Incorrect username or password");
				out.print("<br>");
				out.print("<a href='HelloWorld.jsp'>Try Again</a>");
			}

			//close the connection.
			con.close();

		
	%>

</body>
</html>