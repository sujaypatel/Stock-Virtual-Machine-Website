<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<title>Help Page</title>
</head>
<body id="help">
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
		<h1>Help Menu</h1>
	</center>
	<div class=FormDesign>
		<fieldset>
			<script>
				$(document).ready(function() {
					$("#faq").click(function() {
						$("#p1,#p2, p").slideToggle("slow");
					});
				});
			</script>
			<button id="faq" class="btn btn-info">FAQ</button>
			<br> <br>
			<p>1.What is a share?</p>
			<p id="p1">In the US shares are referred to as stocks. A share is
				a single unit of ownership of a company.</p>
			<p>2.Why do people buy shares?</p>
			<p id="p1">To make money.</p>
			<p>3.What is the stock market?</p>
			<p id="p1">The term stock market is used across old and new media
				and often conjures up the image of a type of financial casino. But
				the stock market is much more than that. It a powerful tool for low
				risk wealth creation.</p>
			<p>4.How do you buy and sell shares?</p>
			<p id="p1">Nowadays, the vast majority of individual investors
				buy and sell their shares online. Years ago you would have needed to
				telephone a broker to buy and sell shares for you. Most brokers are
				now online and you can buy and sell shares anywhere with a computer
				and an internet connection. Online stock market investing has been
				around for so long that there are now legal safeguards in place to
				protect individual investors from fraud or the bankruptcy of your
				stockbroker. Always read the terms and conditions carefully of any
				online stockbroker you would like to invest with.</p>
			<p>5.Does the shareholder own the company?</p>
			<p id="p1">Being a shareholder is about having a vested interest
				in a company, its prospects, its financial position and the way it
				is run by management and how they treat shareholders.</p>
			<p>6.What are dividends?</p>
			<p id="p1">They are payments made to shareholders out of the
				money a company makes. For example, if you have 100 shares in
				Glaxosmithkline and they pay a yearly dividend of 1.00, you would
				receive 100.00 a year from Glaxosmithkline in dividends (100 shares
				x 1.00 dividend).</p>
			<p>7.Why do companies issue shares?</p>
			<p id="p1">Stock exchanges allow companies issue shares to the
				public in exchange for cash.The amount of cash each company gets
				from issuing shares depends upon how many shares they issue and how
				much each of their shares are worth.</p>

		</fieldset>
		<fieldset>
			<script>
				$(document).ready(function() {
					$("#login").click(function() {
						$("p").slideToggle("slow");
					});
				});
			</script>
			<button class="btn btn-info" id="login">LOGIN</button>
			<br> <br>
			<p>1.What if I forget my login password?</p>
			<p id="p1">If you forget your password, you can click on forgot
				password and enter necessary information and your password will be
				sent to your email.</p>
			<p>2.Can I customize the website according to my preferences
				after I login?</p>
			<p id="p1">No, you will not be able to customize the website.
				Although, you will have a customized page for you called the
				portfolio.</p>
			<p>3. Do I have to logout or does the website log me out when I
				leave the website?</p>
			<p id="p1">You will have to click logout once you are done using
				the website. After you click logout, you will be taken to the page
				that states you have successfully logged out.</p>
		</fieldset>
		<fieldset>
			<script>
				$(document).ready(function() {
					$("#registration").click(function() {
						$("p").slideToggle("slow");
					});
				});
			</script>
			<button class="btn btn-info" id="registration">REGISTRATION</button>
			<br> <br>
			<p>1.Where can we register?</p>
			<p id="p1">On the main page, click on the "register" tab on the
				top right corner.</p>
			<p>2.What are some of the benefits of registering for the stock
				virtual machine?</p>
			<p id="p1">You will be able to use the stock virtual machine to
				see how you could use shares in real life.</p>
			<p>3.Do I get miscellaneous email from Stock virtual machine once
				I register?</p>
			<p id="p1">No, you will only receive emails from us if you forget
				your password. In that case, your password will be forwarded to your
				email.</p>
			<p>4.Does my portfolio already provide me with virtual money when
				I register?</p>
			<p id="p1">Yes! Once you have registered, you will be provided
				with $1,000 virtual dollars.</p>
		</fieldset>
		<fieldset>
			<script>
				$(document).ready(function() {
					$("#portfolio").click(function() {
						$("p").slideToggle("slow");
					});
				});
			</script>
			<button class="btn btn-info" id="portfolio">PORTFOLIO</button>
			<br><br>
			<p>1.Where do I view my portfolio?</p>
			<p id="p1">After you login, you will be taken to your portfolio
				page.</p>
			<p>2.Does my portfolio already provide me with virtual money when
				I register?</p>
			<p id="p1">Yes! Once you have registered, you will be provided
				with $1,000 virtual dollars.</p>
			<p>3.What can I do on my portfolio?</p>
			<p id="p1">On you portfolio page, you can buy,sell, and search
				for stocks by using the "Buy", "Sell", and "Search" buttons.</p>
			<p>4.Who can view my portfolio page?</p>
			<p id="p1">No one! Only you can view your own portfolio page.</p>
		</fieldset>
		<br> <br> <img src="images/HelpUs.jpg" height="150"
			width="175" HSPACE=10>
	</div>
	<div class="navbar navbar-default">
		<center>
			<div class="copyright">Copyright &copy; 2015 &middot; All
				Rights Reserved &middot;</div>
		</center>
	</div>
</body>
</html>