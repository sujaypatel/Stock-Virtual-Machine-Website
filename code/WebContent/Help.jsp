<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"    
      "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">
<script src="jquery-1.11.2.js"></script>
<link href='http://fonts.googleapis.com/css?family=Righteous'
	rel='stylesheet' type='text/css'>
<title>Help Page</title>
</head>
<body>
	<div class="navbar navbar-default">
		<span class="welcome"><a class="title" href="Help.jsp">Stock
				Virtual Machine</a></span>
		<ul class="nav navbar-nav">
			<li><a id="registernav" href="Register.jsp"> SIGN UP</a></li>
			<li><a id="loginnav" href="Login.jsp"> LOGIN</a></li>
			<li><a id="helpnav" href="Help.jsp"> HELP</a></li>
			<li><a id="aboutnav" href="AboutUs.jsp"><span> ABOUT
						US </span></a></li>
		</ul>
	</div>
	
	<div class=FormDesign>
		<h1>Help Menu</h1>
		<fieldset>
		    	<script>
$(document).ready(function(){
    $(".FAG").click(function(){
        $("p").slideToggle("slow");
    });
      });
    

</script>
        	<button class= "FAQ">FAQ</button>
        	<br> </br>
			<p> 1.What is a share? </p>
			 <p id = "p1">n the US shares are referred to as stocks. A share is a single unit of ownership of a company. </p>
			  <p>2.Why do people buy shares?</p>
			   <p id = "p1"> To make money.</p>
			 <p>3.What is the stock market?</p>
			  <p id = "p1">he term stock market  is used across old and new media and often  conjures up the image of a type of financial casino. But the stock market is much more than that. It’s a powerful tool for low risk wealth creation. </p>
			   <p>4.How do you buy and sell shares? </p>
			    <p id = "p1">Nowadays, the vast majority of individual investors buy and sell their shares online.
                Years ago you would have needed to telephone a broker to buy and sell shares for you. Most brokers are now online and you can buy and sell shares anywhere with a computer and an internet connection. 
                Online stock market investing has been around for so long that there are now legal safeguards in place to protect individual investors from fraud or the bankruptcy of your stockbroker.
Always read the terms and conditions carefully of any online stockbroker you would like to invest with.</p>
			  <p>5.Does the shareholder own the company?</p> 
			   <p id = "p1">Being a shareholder is about having a vested interest in a company, its prospects, its financial position and the way it is run by management and how they treat shareholders. </p>
			   <p>6.What are dividends?</p>
			    <p id = "p1">They are  payments made to shareholders out of the money a company makes. For example, if you have 100 shares in Glaxosmithkline and they pay a yearly dividend of £1.00, you would receive £100.00 a year from Glaxosmithkline in dividends (100 shares x £1.00 dividend). </p>
			  <p>7.Why do companies issue shares?</p>
			   <p id = "p1"> Stock exchanges allow companies issue shares to the public in exchange for cash.The amount of cash each company gets from issuing shares depends upon how many shares they issue and how much each of their shares are worth. </p>
			 
	</fieldset>
	<fieldset>
<script> $(document).ready(function(){
$(".FAQ").click(function(){
        $("p").slideToggle("slow");
    });
     });
     </script>
<button class="CONTACT"> LOGIN</button>
<br> </br>
			
	</fieldset>
	<fieldset>
<script> $(document).ready(function(){
$(".REGISTRATION").click(function(){
        $("p").slideToggle("slow");
    });
     });
     </script>
<button class="CONTACT"> REGISTRATION</button>
<br> </br>
	
	</fieldset>
	<fieldset>
<script> $(document).ready(function(){
$(".PORTFOLIO").click(function(){
        $("p").slideToggle("slow");
    });
     });
     </script>
<button class="CONTACT"> PORTFOLIO</button>
<br> </br>
			
	</fieldset>
	
	</div>
</body>
</html>