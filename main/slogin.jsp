<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../stylesheets/sloginstyle.css">
<title>Insert title here</title>
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
<h1>Registered Student login</h1><br>
<form action="slogincheck.jsp" method="post">
		<div>
			<div>
				<input type="text" name="serp" class="inputbox" placeholder="Username" autocomplete="off"required>
			</div><br>
			<div>
				<input type="password" name="spswd" class="inputbox"placeholder="Password" autocomplete="off"required>
			</div><br>
			<div>
				<input type="submit" value="Login" class="formbut">
			</div><br>
		</div>
	</form>
<p>New to this page<a href="sregister.jsp">Click here</a></p>
</section>
</body>
</html>