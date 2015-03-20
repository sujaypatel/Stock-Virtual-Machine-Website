<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
</head>
<body id="register">
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
	<%!String errorString = "";%>
	<%
		Object errorCode = session.getAttribute("reg_error");
		if (errorCode != null) {
			String sErrorCode = errorCode.toString();
			int iError = Integer.parseInt(sErrorCode);
			switch (iError) {
			case 1:
				errorString = "Username already exists. Please choose another one";
				break;
			case 2:
				errorString = "Password Mismatch. Check again";
				break;

			}
		}
	%>
	<h3 style="color: red;"><%=errorString%></h3>
	<div>
		<form action="RegisterServlet" method="post">
			<center>
				<h1>Create an Account</h1>
				<br>
				<div>
					<h4>
						FIRST NAME: <input type="text" name="firstname">
					</h4>
					<h4>
						LAST NAME: <input type="text" name="lastname">
					</h4>
					<h4>
						USERNAME: <input type="text" name="username">
					</h4>
					<h4>
						PASSWORD: <input type="password" name="password">
					</h4>
					<h4>
						CONFIRM PASSWORD: <input type="password" name="confirmPassword">
					</h4>
					<h4>
						EMAIL ADDRESS: <input name="email">
					</h4>
					<h4>
						SECRET QUESTION <select name="secret">
							<option value="What is your pet name">What is your pet's
								name</option>
							<option value="What is the color of your first car">What
								is the color of your first car</option>
							<option value="What is your mother maiden name">What is
								your mother's maiden name</option>
							<option value="What is your favorite grad subject">What
								is your favorite grad subject</option>
							<option value="What is your crush name">What is your
								crush's name</option>
						</select>
					</h4>
					<h4>
						ANSWER <input type="text" name="answer">
					</h4>
					<input type="submit" class="btn btn-success btn-lg"
						value="REGISTER">
				</div>
			</center>
		</form>
	</div>
	<br>
	<div class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>