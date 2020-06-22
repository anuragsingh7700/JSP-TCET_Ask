<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<%try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
String ffname=request.getParameter("fname");
String fid=request.getParameter("fid");

try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
Statement st=connection.createStatement();
if(ffname!=null)
{
	String sql1="select username,fgen from f_details where ffname='"+ffname+"'";
	ResultSet rs = st.executeQuery(sql1);
	rs.next();
	session.setAttribute("fid",rs.getString("username"));
	session.setAttribute("fgen",rs.getString("fgen"));
	session.setAttribute("fname",ffname);
}
else
{
	String sql1="select ffname,fgen from f_details where username='"+fid+"'";
	ResultSet rs = st.executeQuery(sql1);
	rs.next();
	session.setAttribute("fid",fid);
	session.setAttribute("fname",rs.getString("ffname"));
	session.setAttribute("fgen",rs.getString("fgen"));
}

	response.sendRedirect("chat.jsp");
}catch(Exception e){out.println("There was some technical error!");}%>
</body>
</html>