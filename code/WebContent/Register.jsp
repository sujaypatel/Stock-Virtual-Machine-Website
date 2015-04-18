<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<!-- jQuery Form Validation code -->
<script>
	$(function() {

		// Setup for validation
		$("#register-form")
				.validate(
						{
							// Specify the validation rules
							rules : {
								firstname : "required",
								lastname : "required",
								email : {
									required : true,
								},
								password : {
									required : true,
									minlength : 5
								},
								confirmPassword : {
									required : true,
									minlength : 5
								},
								username : {
									required : true,
								},
								answer : {
									required : true,
								}
							},

							// Specify the validation error messages
							messages : {
								firstname : "Please enter your First name",
								lastname : "Please enter your Last name",
								password : {
									required : "Please provide a password",
									minlength : "Your password must be at least 5 characters long"
								},
								confirmPassword : {
									required : "Please provide a Confirm password",
									minlength : "Your password must be at least 5 characters long"
								},
								username : {
									required : "Please enter a UserName",
								},
								email : "Please enter a valid email address"
							},

							submitHandler : function(form) {
								form.submit();
							}
						});
	});
</script>
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
	<center>
		<h3 style="color: red;"><%=errorString%></h3>
	</center>
	<div>
		<form action="RegisterServlet" method="post" id="register-form">
			<center>
				<h1>Create an Account</h1>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-pencil-square"></i> <input type="text"
							name="firstname" placeholder="First Name">
					</h4>
				</div>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-pencil-square"></i> <input type="text"
							name="lastname" placeholder="Last Name">
					</h4>
				</div>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-user"></i> <input type="text" name="username"
							placeholder="Username">
					</h4>
				</div>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-lock"></i> <input type="password" name="password"
							placeholder="Password">
					</h4>
				</div>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-lock"></i> <input type="password"
							name="confirmPassword" placeholder="Confirm Password">
					</h4>
				</div>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-envelope-o"></i> <input name="email"
							placeholder="Email Address">
					</h4>
				</div>
				<div class="Input_Icons">
					<h4>
						<select name="secret">
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
				</div>
				<div class="Input_Icons">
					<h4>
						<i class="fa fa-question"></i> <input type="text" name="answer"
							placeholder="Answer">
					</h4>
				</div>
				<input type="submit" class="btn btn-success" value="REGISTER">
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