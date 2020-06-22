<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
String sid=(String)session.getAttribute("sid");
String fid=(String)session.getAttribute("fid");
try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
PreparedStatement st=connection.prepareStatement("Delete from msg where (reci=? and send =?)or(reci=? and send =?)");
st.setString(1,fid);
st.setString(2,sid);
st.setString(3,sid);
st.setString(4,fid);
st.executeUpdate();
connection.close();
response.sendRedirect("fdashboard.jsp");
}catch(Exception e){out.print("There was some technical error!"+e.getMessage());}
%>