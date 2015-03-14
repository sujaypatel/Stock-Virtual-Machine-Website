<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<title>Invalid Login</title>
</head>
<body>
	<%
		String userPassword = "";
		String username = session.getAttribute("userName").toString();
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
					.executeQuery("select password from public.\"Login\" where username='"
							+ username + "';");
			if (rs1.next()) {
				userPassword = rs1.getString(1);

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
		<h2>
			<%=username%></h2>
		<h3>
			<b>your password is: </b>
		</h3>
		<h4><%=userPassword%></h4>
		<br> <a href="Login.jsp" class='buyButton'> Login </a>
	</center>
</body>
</html>