<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%String sid= (String)session.getAttribute("sid");
String sname=(String)session.getAttribute("user");
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
	
	<table class="table" cellspacing="4">
	<%Connection connection = null;
Statement st = null;
ResultSet rs = null;
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
st=connection.createStatement();
rs = st.executeQuery("select * from s_details where username='"+sid+"'");
rs.next();
}catch(Exception e){}
%>		<tr colspan="3"><h1>Personal details:</h1></tr>
		<tr><td><h2>Name:</h2></td><td><h4><%=rs.getString("sname")%></h4></td></tr><tr></tr>
		<tr><td><h2>Department:&nbsp;&nbsp;&nbsp;</h2></td><td><h4><%=rs.getString("sdept")%></h4></td></tr><tr></tr>
		<tr><td><h2>Year:</h2></td><td><h4><%out.print(rs.getString("syear"));%></h4></td></tr><tr></tr>
		<tr><td><h2>Mobile:</h2></td><td><h4><%=rs.getString("smobile")%></h4></td></tr><tr></tr>
		<tr><td><h2>Email id:</h2></td><td><h4><%=rs.getString("semail")%></h4></td></tr>
	</table>
	<br>
<div class="deptselect">
		<h2>Select the faculty department:</h2>
	<ul>
	<li><a href="dashboard.jsp?dept=COMP">COMP</a></li>
	<li><a href="dashboard.jsp?dept=EXTC">EXTC</a></li>
	<li><a href="dashboard.jsp?dept=IT">IT</a></li></ul></div>
<div class="deptselect">
	<ul>
	<li><a href="dashboard.jsp?dept=ETRX">ETRX</a></li>
	<li><a href="dashboard.jsp?dept=MECH">MECH</a></li>
	<li><a href="dashboard.jsp?dept=CIVIL">CIVIL</a></li></ul>
</div>
<form action="fselect.jsp">
<% 
String dept = request.getParameter("dept");
if(dept!=null){%>
<select  name="fname" class="inputbox">
	<option>Select Faculty</option><%
try{
rs = st.executeQuery("select * from f_details where fdept='"+dept+"'");
while(rs.next())
{
	%><option><%=rs.getString("ffname")%></option><%
}}catch(Exception e){}%>
<input type="submit" value="Start" class="formbut">
</select>
</form>
<%}%>
<%rs=null;
rs = st.executeQuery("select * from msg where reci='"+sid+"' and status=0");
int i=0;
while(rs.next())
{
	i++;
}if(i>0)
{out.println("There are "+i+" new messages!");%>
<a href="smessages.jsp" class="formbut">View Messages</a><br><br><%}%>
		</div>
	</body>
</html>