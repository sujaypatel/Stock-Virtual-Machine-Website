<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<title>Portfolio Page</title>
</head>
<body>
	<div class="navbar navbar-default">
		<a class="home" href="Home.jsp">Stock Virtual Machine</a> <a
			class="logout" href="Logout.jsp"> Logout </a>>
	</div>
	<%
		String userVirtualBal = "";
		String username = session.getAttribute("theName").toString();
		;
		Connection c1 = null;
		Statement stmt1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName("org.postgresql.Driver");
			c1 = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/SVM", "postgres",
					"cs422");
			System.out
					.println("Database successfully - User Login  Redirecting to Portfolio");
			stmt1 = c1.createStatement();
			rs1 = stmt1
					.executeQuery("select virtualbalance from public.\"Login\" where username='"
							+ username + "';");
			if (rs1.next()) {
				userVirtualBal = rs1.getString(1);
				System.out.println("Virtual Balance: $" + rs1.getString(1));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (c1 != null) {
				try {
					rs1.close();
					stmt1.close();
					c1.close();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	%>
	<center>
		<h1>Portfolio</h1>
		<div id="move_right">
			<h3>
				Welcome,
				<%=session.getAttribute("theName")%></h3>
			<h4>
				Virtual Balance: $
				<%=userVirtualBal%>
			</h4>
		</div>
		<br> <br>
		<div id="move_right">
			<TABLE class="table table-bordered table-striped">
				<TR>
					<TH COLSPAN="5" style="text-shadow: black;">List
						of Owned Stocks</TH>
				</TR>
				<TR style="background-color: black; color: white;">
					<TH align="center">Symbol</TH>
					<TH align="center">High</TH>
					<TH align="center">Low
					<TH align="center">Close</TH>
					<TH align="center">Quantity</TH>
				</TR>
				<TR ALIGN="CENTER">
					<TD><h6>AAP</h6></TD>
					<TD><h6>Advance Auto Parts Inc</h6></TD>
					<TD><h6>119.60</h6></TD>
					<TD><h6>117.80</h6></TD>
					<TD><h6>119.40</h6></TD>
				</TR>
				<TR ALIGN="CENTER">
					<TD><h6>AAT</h6></TD>
					<TD><h6>American Assets Trust</h6></TD>
					<TD><h6>119.60</h6></TD>
					<TD><h6>117.80</h6></TD>
					<TD><h6>119.40</h6></TD>
				</TR>
				<TR ALIGN="CENTER">
					<TD><h6>YHOO</h6></TD>
					<TD><h6>Yahoo</h6></TD>
					<TD><h6>43.40</h6></TD>
					<TD><h6>42.94</h6></TD>
					<TD><h6>45.50</h6></TD>
				</TR>
			</TABLE>
			<br>
			<div>
				<a href="BuyStock.jsp" class="btn btn-info"> Buy Stocks </a> <a
					href="SellStock.jsp" class="btn btn-danger"> Sell Stocks </a> <a
					href="Search.jsp" class="btn btn-primary"> Search </a>
			</div>
		</div>
	</center>
	<br>
	<div class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>