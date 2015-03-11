<!DOCTYPE html PUBLIC>
<html>
<head>
<title>Forgot Username and Password</title>
</head>
<body>
	<form role="form" action="SecretServlet" method="post"
		id="ForgetPassword-form">
		<h4>
			<label>SECRET QUESTION</label>
		</h4>
		<div>
			<label for="userName" class="control-label">Username</label> <input
				type="text" class="form-control" id="userName" name="userName"
				placeholder="">
		</div>
		<br>
		<div>
			Secret question <select class="form-control" name="secret">
				<option value="What is your pet name">What is your pet's
					name</option>
				<option value="What is the color of your first car">What is
					the color of your first car</option>
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
			<label for="username">Answer</label> <input type="text"
				class="form-control" id="answer" name="answer" placeholder=""
				value="">
		</div>
		<br>
		<div>
			<input type="submit" value="SUBMIT">
		</div>
	</form>
</body>
</html>
