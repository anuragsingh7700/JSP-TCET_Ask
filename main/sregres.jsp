 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<% String serp=request.getParameter("sreg");
String sname=request.getParameter("sname");
String sgen=request.getParameter("sgen");
String syear=request.getParameter("syear");
String sdept=request.getParameter("sdept");
String semail=request.getParameter("semail");
String smob=request.getParameter("smob");
String spswd=request.getParameter("spswd");
try {
    java.sql.Connection con;
    con = DriverManager.getConnection("jdbc:mysql://localhost/chat_project","root","");
    Statement st=con.createStatement();
    int i=st.executeUpdate("insert into login(username,password)values('"+serp+"','"+spswd+"')");
	int j=st.executeUpdate("insert into s_details(username,sname,sgen,sdept,syear,semail,smobile) values ('"+serp+"','"+sname+"','"+sgen+"','"+sdept+"','"+syear+"','"+semail+"','"+smob+"')");
	con.close();
	response.sendRedirect("slogin.jsp");
}
catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>
<html>
<head>
	<title></title>
</head>
<body><br>
<a href="slogin.jsp">try again</a>
</body>
</html>