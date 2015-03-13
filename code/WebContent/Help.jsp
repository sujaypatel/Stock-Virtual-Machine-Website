<!DOCTYPE html>
<html>
<head>
<title>Help Page</title>
<link rel="stylesheet" href="css/main.css">
<link href='http://fonts.googleapis.com/css?family=Lobster'
	rel='stylesheet' type='text/css'>
</head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<body id="help">
	<div class="navbar">
	    <span class="welcome">Stock Virtual Machine</span>
		<ul>
			<li><a id="homenav" href="Home.jsp"> HOME</a></li>
			<li><a id="registernav" href="Register.jsp"> SIGN UP</a></li>
			<li><a id="loginnav" href="Login.jsp"> LOGIN</a></li>
			<li><a id="helpnav" href="Help.jsp"> HELP</a></li>
			<li><a id="aboutnav" href="AboutUs.jsp"><span> ABOUT US </span></a></li>
		</ul>
	</div>
	<div class=FormDesign>
		<h1>Help Menu</h1>
		<fieldset>
			<script>
				$(document).ready(function() {
					$(".button").click(function() {
						$(".FormDesign p").slideToggle("slow");
					});
				});
			</script>
			<button class='button'>FAQ</button>
			<br> <br>
			<p>1.What is a share?</p>
			<p id="p1">In the US shares are referred to as stocks. A share is
				a single unit of ownership of a company.</p>
			<p>2.Why do people buy shares?</p>
			<p id="p1">To make money.</p>
			<p>3.What is the stock market?</p>
			<p id="p1">The term stock market is used across old and new media
				and often conjures up the image of a type of financial casino. But
				the stock market is much more than that. It is a powerful tool for
				low risk wealth creation.</p>
			<p>4.How do you buy and sell shares?</p>
			<p id="p1">Nowadays, the vast majority of individual investors
				buy and sell their shares online. Years ago you would have needed to
				telephone a broker to buy and sell shares for you. Most brokers are
				now online and you can buy and sell shares anywhere with a computer
				and an Internet connection. Online stock market investing has been
				around for so long that there are now legal safeguards in place to
				protect individual investors from fraud or the bankruptcy of your
				stock broker. Always read the terms and conditions carefully of any
				online stock broker you would like to invest with.</p>
			<p>5.Does the shareholder own the company?</p>
			<p id="p1">Being a shareholder is about having a vested interest
				in a company, its prospects, its financial position and the way it
				is run by management and how they treat shareholders.</p>
			<p>6.Why do companies issue shares?</p>
			<p id="p1">Stock exchanges allow companies issue shares to the
				public in exchange for cash.The amount of cash each company gets
				from issuing shares depends upon how many shares they issue and how
				much each of their shares are worth.</p>
			<p>7.How rich can I get from investing in stock market?</p>
			<p id="p1">Very rich but before investing in actual stock market,
				first you need to learn how stock market works. In order to learn
				you can use our Stock Virtual Machine web application without actual
				investing money.</p>
		</fieldset>
	</div>
	<div id ="contactUs" class=FormDesign>
		<fieldset >
			<script>
				$(document).ready(function() {
					$("button").click(function() {
						$("#contactUs p").slideToggle("slow");
					});
				});
			</script>
			<button class='button'>CONTACT US</button>
			<br> <br>
			<p>Email:stockvm@gmail.com</p>
			<p>Phone no:(630)-567-1234</p>
		</fieldset>
	</div>
</body>
</html>