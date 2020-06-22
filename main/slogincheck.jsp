<%@page import="java.sql.*"%>
<%
String sid= request.getParameter("serp");
String spass= request.getParameter("spswd");
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement st = null;
ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<body>
<%
if (sid.length()==11 && spass!=null) {
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
st=connection.createStatement();
String sql1="select * from login where username='"+sid+"'";
rs = st.executeQuery(sql1);
rs.next();
String dbpass=(String)rs.getString("password");
rs=null;
sql1="select * from s_details where username='"+sid+"'";
rs = st.executeQuery(sql1);
rs.next();
if(spass.equals(dbpass)){
rs = st.executeQuery(sql1);
rs.next();
session.setAttribute("sid",rs.getString("username"));
session.setAttribute("user",rs.getString("sname"));
response.sendRedirect("http://localhost:8080/chat_project/main/dashboard.jsp");
connection.close();
}else{%><h2>The entered username and password mismatch</h2><br>To retry login -><a href="slogin.jsp">click here</a><%;}
} catch (Exception e) {
%><h2>Sorry for inconvinience!There was some technical error.</h2><%
}}
%>
</body>
</html>