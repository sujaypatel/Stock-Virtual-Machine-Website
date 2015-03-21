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
<title>Retrieve Password</title>
</head>
<body>
	<%
		String userPassword = "";
		String username = session.getAttribute("userName").toString();
		String email = session.getAttribute("email").toString();

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
							+ username + "' and email ='" + email + "';");
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
	<div class="navbar navbar-default">
		<span class="welcome"><a class="title" href="Home.jsp">Stock
				Virtual Machine</a></span>
		<ul class="nav navbar-nav">
			<li><a id="registernav" href="Register.jsp"> SIGN UP</a></li>
			<li><a id="loginnav" href="Login.jsp"> LOGIN</a></li>
			<li><a id="helpnav" href="Help.jsp"> HELP</a></li>
			<li><a id="aboutnav" href="AboutUs.jsp"><span> ABOUT
						US </span></a></li>
		</ul>
	</div>
	<center>
		<h2>Link to Reset the Password Has been Sent To Your Email!</h2>
		<br>
		<h4>Once you have Reset the Password Click Below to Login</h4>
		<br> <a href="Login.jsp" class="btn btn-success"> LOGIN </a> <br>
		<br> <img src="images/PasswordRetrieve.png" height="200"
			width="200" HSPACE=10>
	</center>
	<div id="footer" class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>