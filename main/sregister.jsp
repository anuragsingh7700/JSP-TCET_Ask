<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register yourself first!</title>
<link rel="stylesheet" type="text/css" href="../stylesheets/sloginstyle.css">
</head>
<body>
	<header class="site_top" >
	<div class="logo"><img src="../images/Nav.png" width="352" height="124"></div>
	<nav class="menu">
		<ul >
			<li><a href="index.html">Home</a></li>
			<li><a href="https://www.tcetmumbai.in/contact.html"target="blank">Contact</a></li>
			<li><a href="https://www.tcetmumbai.in/About%20Us.html"target="blank">About TCET</a></li>
			<li><a href="developer.html">Developers</a></li>
		</ul>
	</nav>
		</header>
<section class="login">
	<form action="sregres.jsp" method="post">
<input type="text" name="sreg" autocomplete="off" placeholder="Enter ERP id" class="inputbox" required><br>
<input type="text" name="sname"autocomplete="off" placeholder="Enter Full Name" class="inputbox"required><br>
		<select name="sgen" class="inputbox" >
			<option>Select gender</option>
			<option>Male</option>
			<option>Female</option>
		</select><br>
<select name ="syear"class="inputbox" >
	<option>Select year</option>
	<option>F.E.</option>
	<option>S.E.</option>
	<option>T.E.</option>
	<option>B.E.</option>
	</select><br>
<select name ="sdept"class="inputbox">
	<option>Select Department</option>
	<option>COMP-A</option>
	<option>COMP-B</option>
	<option>IT-A</option>
	<option>IT-B</option>
	<option>EXTC-A</option>
	<option>EXTC-B</option>
	<option>MECH-A</option>
	<option>MECH-B</option>
	<option>CIVIL-A</option>
	<option>CIVIL-A</option>
</select><br>
<input type="email" name="semail" autocomplete="off" placeholder="Enter email address"class="inputbox"required><br>
<input type="tel" name="smob"autocomplete="off" placeholder="Enter mobile number"class="inputbox"required><br>
<input type="password" name="spswd"class="inputbox" placeholder="Enter Password"required><br>
	<input type="reset" value="CLEAR"class="formbut">
	<input type="submit" value="SUBMIT"class="formbut">
	</form>
</section>
</body>
</html>