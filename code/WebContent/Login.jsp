<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<title>Login Page</title>
</head>
<body id="login">
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
	<form action="LoginServlet" class="form-horizontal">
		<center>
			<div>
				<br>
				<h1>Login To Stock Virtual Machine</h1>
			</div>
			<br>
			<div id="move_right">
				<h4>
					USERNAME: <input type="text" name="un" required="required">
				</h4>
				<h4>
					PASSWORD: <input type="password" name="pw" required="required">
				</h4>
				<div>
					<input type="submit" class="btn btn-info btn-lg btn-block"
						value="SIGN IN" /> <a class="fp" href="ForgotPassword.jsp">Forgot
						Password</a>
				</div>
				<br> <img src="images/Login.jpg" height="150" width="175"
					HSPACE=10>
			</div>
		</center>
	</form>
	<br>
	<div id="footer" class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>
