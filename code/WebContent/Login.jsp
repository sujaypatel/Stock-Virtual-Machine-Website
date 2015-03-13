<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css'>
<title>Login Page</title>
</head>
<body id="login">
	<div class="navbar">
		<span class="welcome">Stock Virtual Machine</span>
		<ul>

			<li><a id="homenav" href="Home.jsp"> <span>HOME </span></a></li>
			<li><a id="registernav" href="Register.jsp"> <span>
						SIGN UP </span></a></li>
			<li><a id="loginnav" href="Login.jsp"> <span> LOGIN </span></a></li>
			<li><a id="helpnav" href="Help.jsp"><span> HELP </span></a></li>
			<li><a id="helpnav" href="AboutUs.jsp"><span> ABOUT US </span></a></li>


		</ul>
	</div>
	<form action="LoginServlet" class=FormDesign>
		<div>
			<h1>
				<b>Login To Stock Virtual Machine</b>
			</h1>
		</div>
		<fieldset>
			<div>
				<h4>LOGIN</h4>
				<p>The Stock Virtual Machine is a web application that is
					designed to simulate buying and selling stocks in the stock market
					in a very realistic way.</p>
				<p>To use the program users must register with a Username, Email
					and Password.</p>
			</div>
			<br>
			<div id="move_right">
				<div>
					<label for="username">USERNAME: </label> <input type="text"
						name="un" required="required">
				</div>
				<br>
				<div>
					<label for="password">PASSWORD: </label> <input type="password"
						name="pw" required="required">
				</div>
				<br>
				<div>
					<input type="submit" class='button' value="SIGNIN" /> <br>
					<br> <a class="fp" href="ForgotPassword.jsp">Forgot
						Password</a>

				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>
