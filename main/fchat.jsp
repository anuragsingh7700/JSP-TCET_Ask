<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
ResultSet rs = null;
%>
<html>
<head>
	<title>Chatscreen</title>
	<link rel="stylesheet" type="text/css" href="../stylesheets/chatstyle.css">
	<link rel="icon" type="image/png"href="../images/favicon.png">
</head>
<body>
	<div class="menu">
	<a href="dashboard.jsp"class="formbut">Dashboard</a>
	<a href="logout.jsp"class="formbut">logout</a>
	<a href="fchat.jsp" class="formbut">Refresh</a>
	<a href="complete.jsp" class="formbut">Completed</a><br><br>
	</div>
<div class="sdetail">
	<table>
	<th>Current Student Details:</th>
		<tr><td><h4>Erp Id:</h4></td><td><h6><%=(String)session.getAttribute("sid")%></h6></td>
		<td><h4>Name</h4></td><td><h6><%=(String)session.getAttribute("sname")%></h6></td>
		<td><h4>Department:</h4></td><td><h6><%=(String)session.getAttribute("sdept")%></h6></td>
		<td><h4>Year:</h4></td><td><h6><%=(String)session.getAttribute("syear")%></h6></td>
		<td><h4>Mobile number:</h4></td><td><h6><%=(String)session.getAttribute("smobile")%></h6></td>
		<td><h4>Email id:</h4></td><td><h6><%=(String)session.getAttribute("semail")%></h6></td></tr>
	</table>
</div>
<div>
	<%String sid=(String)session.getAttribute("sid");
	String fid=(String)session.getAttribute("fid");
	String fname=(String)session.getAttribute("fname");
	String sname=(String)session.getAttribute("sname");
	String sender=null;%>
		<form action="fnewmsg.jsp" method="post" class="form">
	<input type="text" name="message" placeholder="Type new message here!" class="newmsg" autocomplete="off"required>
	<input type="submit"name="Send" value="SEND" class="button">
</form><%
try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
Statement st=connection.createStatement();
rs=st.executeQuery("select send,reci,msgs,time_format(timing,'%h:%i') as time from msg where (send='"+sid+"'and reci='"+fid+"') or (reci='"+sid+"' and send='"+fid+"') order by timing desc"); 
while(rs.next()){
	if(fid.equals(rs.getString("send"))){sender="ME";}else{sender=sname;}
if(sender.equals("ME")){%>
<section  class="chatscreen"><div>
<textarea disabled class="container">
<%out.println(sender+"     "+(String)rs.getString("time"));
out.print(rs.getString("msgs"));%>
</textarea></div>
<%}else{%>
	<div>
  <textarea disabled class="container2">
<%out.println(sender+"     "+(String)rs.getString("time"));
out.print(rs.getString("msgs"));%>
  	</textarea>
</div></section>
<%}%>
<%sender=null;}
PreparedStatement st2=connection.prepareStatement("UPDATE msg SET status=? WHERE reci=? and send=?");
st2.setInt(1,1);
st2.setString(2,fid);
st2.setString(3,sid);
st2.executeUpdate();
connection.close();
}catch (Exception e){out.print("Technical Error!!");}
%>
</div>
</table>
</body>
</html>