<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body id="register">
	<div class="navbar">
		<ul>
			<li><img src="images/logo.png" alt="logo" HSPACE=10></li>
			<li><a id="homenav" href="Home.jsp"> HOME</a></li>
			<li><a id="registernav" href="Register.jsp"> SIGN UP</a></li>
			<li><a id="loginnav" href="Login.jsp"> LOGIN</a></li>
			<li><a id="helpnav" href="Help.jsp"> HELP</a></li>
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
		<form action="RegisterServlet" method="post" class=FormDesign>
			<h1>
				<b>Create an Account</b>
			</h1>
			<fieldset>
				<div>
					<h4>REGISTER NOW</h4>
					<p>The user will get the full experience of buying and selling
						stock on the web without having to invest actual currency.</p>
					<div id="move_right">
						<div>
							<label>FIRST NAME: </label> <input type="text" name="firstname"
								required="required">
						</div>
						<br>
						<div>
							<label>LAST NAME: </label> <input type="text" name="lastname"
								required="required">
						</div>
						<br>
						<div>
							<label>USERNAME: </label> <input type="text" name="username"
								required="required">
						</div>
						<br>
						<div>
							<label>PASSWORD: </label> <input type="password" name="password"
								required="required">
						</div>
						<br>
						<div>
							<label>CONFIRM PASSWORD: </label> <input type="password"
								name="confirmPassword" required="required">
						</div>
						<br>
						<div>
							<label>EMAIL ADDRESS: </label> <input type="email" name="email"
								required="required">
						</div>
						<br>
						<div>
							<label>SECRET QUESTION</label> <select name="secret">
								<option value="What is your pet name">What is your
									pet's name</option>
								<option value="What is the color of your first car">What
									is the color of your first car</option>
								<option value="What is your mother maiden name">What is
									your mother's maiden name</option>
								<option value="What is your favorite grad subject">What
									is your favorite grad subject</option>
								<option value="What is your crush name">What is your
									crush's name</option>
							</select>
						</div>
						<br>
						<div>
							<label for="answer">ANSWER</label> <input type="text"
								name="answer">
						</div>
						<br>
						<div>
							<input type="submit" class='button' value="REGISTER">
						</div>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>