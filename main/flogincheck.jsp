<%@page import="java.sql.*"%>
<%
String fid= request.getParameter("ferp");
String fpass= request.getParameter("fpswd");
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
if (fid.length()==11 && fpass!=null) {
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
st=connection.createStatement();
String sql1="select * from login where username='"+fid+"'";
rs = st.executeQuery(sql1);
rs.next();
String dbpass=(String)rs.getString("password");
rs=null;
sql1="select * from f_details where username='"+fid+"'";
rs = st.executeQuery(sql1);
rs.next();
if(fpass.equals(dbpass)){
rs = st.executeQuery(sql1);
rs.next();
session.setAttribute("fid",rs.getString("username"));
session.setAttribute("fname",rs.getString("ffname"));
response.sendRedirect("http://localhost:8080/chat_project/main/fdashboard.jsp");
connection.close();
}else{%><h2>The entered username and password mismatch</h2><br>To retry login -><a href="flogin.jsp">click here</a><%;}
} catch (Exception e) {
%><h2>Sorry for inconvinience!There was some technical error.</h2><%
}}
%>
</body>
</html>