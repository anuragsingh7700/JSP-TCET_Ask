<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%try{
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {out.println("Problem while connecting");}%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../stylesheets/sloginstyle.css">
	<link rel="icon" type="image/png"href="../images/favicon.png">
	<title>INBOX</title>
</head>
<body>
<header class="site_top" >
		<div class="logo"><img src="../images/Nav.png" width="352" height="124"></div>
		<nav class="menu">
		<ul >
			<li><a href="index.html">Home</a></li>
			<li><a href="developer.html"target="blank">Developers</a></li>
			<li><a href="fdashboard.jsp" class="a">Dashborad</a></li>
			<li><a href="logout.jsp" class="formbut">logout</a></li>
		</ul>
	</nav>
		</header>
	<section class="main">
	<div>
			<iframe src="notification.html" width="100%" height="45%" class="notif"></iframe>
	</div>
		<div>
	<h2>Messages recieved from:</h2><br><br>
<% String fid=(String)session.getAttribute("fid");
String sid=(String)session.getAttribute("sid");
try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
Statement st=connection.createStatement();
ResultSet rs = st.executeQuery("select sname,username,sdept,syear from s_details where username in (select send from msg where status=0 and reci='"+fid+"')");
while(rs.next()){
	%><h2><a href="fchatselect.jsp?sid=<%=rs.getString("username")%>"><%out.print(rs.getString("sname")+"-"+rs.getString("syear")+rs.getString("sdept"));%></a></h2><br><%
}
}catch(Exception e){out.print(e.getMessage());}%>
</div>
</body>
</html>