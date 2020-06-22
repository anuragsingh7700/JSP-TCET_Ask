<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%String fid=(String)session.getAttribute("fid");
String sid=request.getParameter("sid");
try{
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {e.printStackTrace();}
try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
Statement st=connection.createStatement();
ResultSet rs = st.executeQuery("select * from s_details where username='"+sid+"'");
rs.next();
session.setAttribute("sid",sid);
session.setAttribute("sname",rs.getString("sname"));
session.setAttribute("sgen",rs.getString("sgen"));
session.setAttribute("sdept",rs.getString("sdept"));
session.setAttribute("syear",rs.getString("syear"));
session.setAttribute("smobile",rs.getString("smobile"));
session.setAttribute("semail",rs.getString("semail"));
response.sendRedirect("fchat.jsp");
}catch(Exception e){out.print(e.getMessage());}%>