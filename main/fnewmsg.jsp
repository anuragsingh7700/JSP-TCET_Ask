 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%String message= (String)request.getParameter("message");
String sid=(String)session.getAttribute("sid");
String fid=(String)session.getAttribute("fid");
try {
    java.sql.Connection con;
    con = DriverManager.getConnection("jdbc:mysql://localhost/chat_project","root","");
    Statement st=con.createStatement();
    st.executeUpdate("insert into msg(send,reci,msgs) values('"+fid+"','"+sid+"','"+message+"')");
    con.close();
	response.sendRedirect("fchat.jsp");
}
catch(SQLException e) {out.println("Some technical error occured!");}%>