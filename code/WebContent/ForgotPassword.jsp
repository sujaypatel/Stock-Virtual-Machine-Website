<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<div class="navbar navbar-default">
		<a class="home" href="Home.jsp">Stock Virtual Machine</a> <a
			class="logout" href="Login.jsp"> Back To Login </a>>
	</div>
	<center>
		<form action="SecretServlet" method="post" id="ForgetPassword-form">
			<h2>Recovery Password</h2>
			<br>
			<div>
				USERNAME: <input type="text" id="userName" name="userName"
					placeholder="Username" required="required">
			</div>
			<br>
			<div>
				EMAIL ADDRESS: <input type="text" id="email" name="email"
					placeholder="Someone@gmail.com" required="required">
			</div>
			<br>
			<div>
				<input type="submit" class="btn btn-info" value="SUBMIT">
			</div>
			<br> <img src="images/Password-Recovery.jpg" height="200"
				width="300" HSPACE=10> <br> <br>
		</form>
	</center>
	<div id="footer" class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>
