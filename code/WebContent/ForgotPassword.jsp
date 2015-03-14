<!DOCTYPE html PUBLIC>
<html>
<head>
<title>Forgot Password</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div class=FormDesign>
		<a class="fp1" href="Login.jsp"> Back To Login</a>
		<form action="SecretServlet" method="post" id="ForgetPassword-form">
			<h4>
				<label>SECRET QUESTION</label>
			</h4>
			<div>
				Username: <input type="text" id="userName" name="userName"
					placeholder="">
			</div>
			<br>
			<div>
				Secret question: <select name="secret">
					<option value="What is your pet name">What is your pet's
						name</option>
					<option value="What is the color of your first car">What
						is the color of your first car</option>
					<option value="What is your mother maiden name">What is
						your mother's maiden name</option>
					<option value="What is your favorite grad subject">What is
						your favorite grad subject</option>
					<option value="What is your crush name">What is your
						crush's name</option>
				</select>
			</div>
			<br>
			<div>
				Answer: <input type="text" id="answer" name="answer" placeholder=""
					value="">
			</div>
			<br>
			<div>
				<input type="submit" class="button" value="SUBMIT">
			</div>
			<br>
		</form>
	</div>
</body>
</html>
