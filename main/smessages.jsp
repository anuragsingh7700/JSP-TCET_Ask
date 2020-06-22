<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%try{
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {out.println("Problem while connecting");}%>
<!DOCTYPE html>
<html>
<head>
	<title>INBOX</title>
	<link rel="stylesheet" type="text/css" href="../stylesheets/sloginstyle.css">
	<link rel="icon" type="image/png"href="../images/favicon.png">
</head>
<body>
	<header class="site_top" >
		<div class="logo"><img src="../images/Nav.png" width="352" height="124"></div>
		<nav class="menu">
		<ul >
			<li><a href="index.html">Home</a></li>
			<li><a href="developer.html"target="blank">Developers</a></li>
			<li><a href="dashboard.jsp" class="a">Dashborad</a></li>
			<li><a href="logout.jsp" class="formbut">logout</a></li>
		</ul>
	</nav>
		</header>
	<section class="main">
	<div>
			<iframe src="notification.html" width="100%" height="45%" class="notif"></iframe>
			<h3>IMPORTANT LINKS:</h3>
	</div><div>
	<ul>
		<li><a href="https://www.tcetmumbai.in"target="blank">TCET MUMBAI</a></li>
		<li><a href="http://erp.tcetmumbai.in/"target="blank">STUDENT ERP</a></li>
		<li><a href="http://www.mu.ac.in"target="blank">MUMBAI UNIVERSITY</a></li>
		<li><a href="https://www.aicte-india.org"target="blank">AICTE</a></li>
	</ul>
	</div>
	<div><h2>Messages recieved from:</h2>
<% String fid=(String)session.getAttribute("fid");
String sid=(String)session.getAttribute("sid");
try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
Statement st=connection.createStatement();
ResultSet rs = st.executeQuery("select ffname,username from f_details where username in (select send from msg where status=0 and reci='"+sid+"')");
while(rs.next()){
	%><h2><a href="fselect.jsp?fid=<%=rs.getString("username")%>"><%=rs.getString("ffname")%></a></h2><%}
}catch(Exception e){out.print(e.getMessage());}%>
</body>
</html>