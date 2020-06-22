<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../stylesheets/sloginstyle.css">
	<link rel="icon" type="image/png"href="../images/favicon.png">
	<title></title>
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
<%Connection connection = null;
Statement st = null;
ResultSet rs = null;
String fid= (String)session.getAttribute("fid");
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
st=connection.createStatement();
rs = st.executeQuery("select sname,syear,sdept,username from s_details where username IN (select send from msg where reci='"+fid+"' or send='"+fid+"')");
while(rs.next()){%>
<h2><a href="fchatselect.jsp?sid=<%=rs.getString("username") %>">
	<%out.print(rs.getString("sname")+" - "+rs.getString("syear")+rs.getString("sdept"));%></a></h2><br><%}
}catch(Exception e){out.print(e.getMessage());}%>
</body>
</html>