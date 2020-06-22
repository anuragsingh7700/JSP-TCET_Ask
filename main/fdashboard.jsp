<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%String fid= (String)session.getAttribute("fid");
String fname=(String)session.getAttribute("fname");
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
out.println("Problem while connecting");
}%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../stylesheets/sloginstyle.css">
	<link rel="icon" type="image/png"href="../images/favicon.png">
<meta charset="ISO-8859-1">
<title>dashboard</title>
</head>
<body>
<header class="site_top" >
		<div class="logo"><img src="../images/Nav.png" width="352" height="124"></div>
		<nav class="menu">
		<ul >
			<li><a href="index.html">Home</a></li>
			<li><a href="https://www.tcetmumbai.in/contact.html"target="blank">Contact</a></li>
			<li><a href="developer.html"target="blank">Developers</a></li>
			<li><a href="logout.jsp" class="formbut">logout</a></li>
		</ul>
	</nav>
		</header>
<div class="login">
	<h1>Personal details:</h1><br>
	<table class="table" cellspacing="4">
	<%Connection connection = null;
Statement st = null;
ResultSet rs = null;
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
st=connection.createStatement();
rs = st.executeQuery("select * from f_details where username='"+fid+"'");
rs.next();
%>
		<tr><td><h2>Name:</h2></td><td><h4><%out.print(rs.getString("ffname")+" "+rs.getString("flname"));%></h4></td></tr>
		<tr><td><h2>Department:</h2></td><td><h4><%=rs.getString("fdept")%></h4></td></tr>
		<tr><td><h2>Mobile number:&nbsp;&nbsp;&nbsp;</h2></td><td><h4><%=rs.getString("fmob")%></h4></td></tr>
		<tr><td><h2>Email Address:</h2></td><td><h4><%=rs.getString("femail")%></h4></td></tr>
	</table>
<%
rs=null;
rs = st.executeQuery("select * from msg where reci='"+fid+"' and status=0");
int i=0;
while(rs.next())
{
	i++;
}if(i>0)
{out.println("There are "+i+" new messages!");%>
<br><br>
<a href="fmessages.jsp" class="formbut">View Messages</a><br><br><br><br>
<%}}catch(Exception e){out.println("Technical error!");}%>
<a href="frecentchats.jsp" class="formbut">Recent Chats</a><br>
</div>
</body>
</html>